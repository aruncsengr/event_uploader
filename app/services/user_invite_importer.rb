class UserInviteImporter
  EVENT_SEED_FILE_PATH = File.join(Rails.root, 'lib/assets/events.csv')

  class << self
    def import
  		Event.all.each do |event|
        next if event.users_with_rsvp_raw.blank?

        UserInvite.insert_all! user_invites(event)
      end
    end

    private

    def user_invites(event)
      user_invites = []
      event.users_with_rsvp_raw.split(';').each do |invite|
        username, rsvp = invite.split('#')
        timeslot = timeslot(event)
        created_at, updated_at = Time.zone.now, Time.zone.now

        UserInvite.update_rsvp_for_overlapped_invites(username, event)

        user_invites << {
          username: username,
          rsvp: rsvp,
          timeslot: timeslot,
          event_id: event.id,
          created_at: created_at,
          updated_at: updated_at
        }
      end

      user_invites
    end

    def timeslot(event)
      end_time = event.all_day? ? event.start_time.tomorrow.beginning_of_day : event.end_time

      "[#{event.start_time},#{end_time})"
    end
  end
end
