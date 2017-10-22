class Member < ApplicationRecord
  has_many :visits, dependent: :destroy
  accepts_nested_attributes_for :visits, allow_destroy: true

  def self.import_csv
    SmarterCSV.process(file.path, {
    chunk_size: 20,
    file_encoding: 'iso-8859-1:utf-8',
    row_sep: :auto,
    key_mapping: {
      first_name: :first_name,
      last_name: :last_name,
      scene_name: :scene_name,
      joined_date: :join_date,
      guest_code: :code,
      member: :membership_id,
      renewal_date: :renewal_date
    }
    }) do |chunk|
      ImportCsvWorker.perform_async(chunk)
    end
  end

  validates :user_id, presence: true
  settings analysis: {
         filter: {
           edge_ngram_filter: {
             type: "edgeNGram",
             min_gram: "1",
             max_gram: "20",
           }
         },
         analyzer: {
           edge_ngram_analyzer: {
             type: "custom",
             tokenizer: "standard",
             filter: ["lowercase", "edge_ngram_filter"]
           },
           search_analyzer: {
             type: 'custom',
             tokenizer: 'standard',
             filter: ['lowercase']
           }
         }
       } do
   mapping do
       indexes :first_name, analyzer: "edge_ngram_analyzer", search_analyzer: 'search_analyzer'
       indexes :last_name, analyzer:   "edge_ngram_analyzer", search_analyzer: 'search_analyzer'
       indexes :scene_name, analyzer: "edge_ngram_analyzer", search_analyzer: 'search_analyzer'
       indexes :membership_id, analyzer:   "edge_ngram_analyzer", search_analyzer: 'search_analyzer'
   end
 end



   def self.search(query)

   __elasticsearch__.search(
   {
     size: 10000,
     query: {
           multi_match: {
             query: "#{query}",
             fields: ['first_name', 'last_name', 'scene_name', 'membership_id'],
             operator:   "and",
             type:       "cross_fields",
           }
     }
   }
   )

 end

end
