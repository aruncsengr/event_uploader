require 'csv'

namespace :import do
  desc 'import all'
  task all: :environment do
    puts "importing users..."
    UserImporter.import
    puts "All users imported.\n\n"

    puts "importing events..."
    EventImporter.import
    puts "All events imported.\n\n"

    puts "importing user_invites..."
    UserInviteImporter.import
    puts "All user_invites imported.\n\n"
  end

  desc 'import users'
	task users: :environment do
    UserImporter.import
	end

  desc 'import events'
  task events: :environment do
    EventImporter.import
  end

  desc 'import user_invites'
  task user_invites: :environment do
    UserInviteImporter.import
  end
end

task clean_all: :environment do
  User.delete_all
  Event.delete_all
  UserInvite.delete_all
end
