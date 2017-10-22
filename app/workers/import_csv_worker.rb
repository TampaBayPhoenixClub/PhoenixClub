class ImportCsvWorker
  include Sidekiq::Worker


  def perform(member)
    members.each do |member|


      record = Member.where(email: contact_email)
      if record.count >= 1
      Member.transaction do
        update_profile = record.first.update(
        name: name,
        contact_first_name: contact_first_name,
        contact_last_name: contact_last_name,
        contact_phone: contact_phone,
        phone: phone
        )
        # generate_naics_codes(update_profile, profile['niacs_codes'].to_s) if profile['niacs_codes'].present?
      end
      else
      Member.transaction do
        new_profile = Member.create(
        name: name,
        contact_first_name: contact_first_name,
        contact_last_name: contact_last_name,
        contact_phone: contact_phone
          )
        end


      end

    end
  end

  private


end
