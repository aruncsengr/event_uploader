json.array!(@user_invites) do |user_invite|
  json.title user_invite.event.title + " (rsvp: #{user_invite.rsvp})"
  json.rsvp user_invite.rsvp
  json.start user_invite.timeslot.begin.iso8601
  json.end user_invite.timeslot.end.iso8601
end
