class UserInvite < ApplicationRecord
	belongs_to :user
	belongs_to :event

	scope :booked, -> { where(rsvp: RSVP[:yes]) }
  scope :overlap_with, -> (start_time, end_time) {
    where("timeslot && tstzrange(?, ?, '[)')", start_time, end_time)
  }

	RSVP = {
		yes: 'yes',
		no: 'no',
		maybe: 'maybe'
	}

	def self.update_rsvp_for_overlapped_invites(username, event)
    overlapped = UserInvite.where(username: username).booked.overlap_with(event.during.begin, event.during.end)
    overlapped.update_all(rsvp: RSVP[:no]) if overlapped.any?
  end

  def self.booked_between(username, start_time, end_time)
    UserInvite.includes(:event).where(username: username).overlap_with(start_time, end_time).booked
  end
end
