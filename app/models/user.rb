class User < ApplicationRecord
  has_many :user_invites, foreign_key: :username, primary_key: :username
	has_many :events, through: :user_invites
end
