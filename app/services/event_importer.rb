class EventImporter
  EVENTS_COPY_STATEMENT = "COPY events FROM STDIN WITH (FORMAT CSV, DELIMITER ',')"
  EVENT_SEED_FILE_PATH = File.join(Rails.root, 'lib/assets/events.csv')

  class << self
    def import
    	db_conn = ActiveRecord::Base.connection.raw_connection
    	db_conn.copy_data(EVENTS_COPY_STATEMENT) do
        counter = 1
        CSV.foreach(EVENT_SEED_FILE_PATH, headers: true) do |event|
          event_data = build_event_data(counter, event)
          if event_valid?(event)
            db_conn.put_copy_data(event_data.to_csv)
            counter = counter + 1
          end
        end
      end
    end

    private

    def build_event_data(counter, event)
    	title = event['title']
      description = event['description']
      start_time = event['starttime']
      end_time = event['endtime']
      all_day = all_day?(event)
      completed = completed?(event)
      users_with_rsvp_raw = event['users#rsvp']
      created_at, updated_at = Time.zone.now, Time.zone.now

      [counter, title, start_time, end_time, description, users_with_rsvp_raw, all_day, completed, created_at, updated_at]
    end


    def completed?(event)
      DateTime.parse(event['starttime']) < Time.zone.now
    end

     def all_day?(event)
      event['allday'] == "true"
    end

    def event_valid?(event)
      all_day?(event) || DateTime.parse(event['starttime']) <= DateTime.parse(event['endtime'])
    end
  end
end
