class Event < ApplicationRecord
  has_many :user_invites
  has_many :users, through: :user_invites

  class << self
    def between(start_time, end_time)
      Event.where(start_time: start_time..end_time)
    end
  end

  def during
    end_time = self.all_day? ? self.start_time.tomorrow.beginning_of_day : self.end_time
    start_time...end_time
  end
end
