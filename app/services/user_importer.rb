class UserImporter
  COPY_STATEMENT = "COPY users FROM STDIN WITH (FORMAT CSV, DELIMITER ',')"
  USER_SEED_FILE_PATH = File.join(Rails.root, 'lib/assets/users.csv')

  class << self
    def import
    	db_conn = ActiveRecord::Base.connection.raw_connection
    	db_conn.copy_data(COPY_STATEMENT) do
        counter = 1
        CSV.foreach(USER_SEED_FILE_PATH, headers: true) do |user|
          user_data = build_user_data(counter, user)
          db_conn.put_copy_data(user_data.to_csv)
          counter = counter + 1
        end
      end
    end

    private

    def build_user_data(counter, user)
      [counter, *user.fields, Time.zone.now, Time.zone.now]
    end
  end
end
