class Member < ApplicationRecord
  include Elasticsearch::Model::Callbacks
  include Elasticsearch::Model

  has_many :visits, dependent: :destroy
  accepts_nested_attributes_for :visits, allow_destroy: true


  state_machine :status, initial: :guest do
    state :active
    state :dna
    state :historical
    state :compted
    state :staff
    state :guest


  end


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
       indexes :first_name, type: 'text', analyzer: "edge_ngram_analyzer", search_analyzer: 'search_analyzer'
       indexes :last_name, type: 'text', analyzer:   "edge_ngram_analyzer", search_analyzer: 'search_analyzer'
       indexes :scene_name, type: 'text', analyzer: "edge_ngram_analyzer", search_analyzer: 'search_analyzer'
       indexes :membership_id, type: 'integer'
   end
 end



   def self.search(query)

   __elasticsearch__.search(
   {
     size: 10000,
     query: {
           multi_match: {
             query: query,
             fields: ['first_name', 'last_name', 'scene_name', 'membership_id'],
             lenient: true
           }
     }
   }
   )

 end

end

# # Delete the previous articles index in Elasticsearch
Member.__elasticsearch__.create_index! force: true
#
# # Create the new index with the new mapping
Member.__elasticsearch__.refresh_index!

# Index all article records from the DB to Elasticsearch
Member.import
