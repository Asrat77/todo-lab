class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  validate :cannot_request_one_self

  validates :status, presence: true
  enum :status, {
    pending: 0,
    accepted: 1,
    rejected: 2
  }

  def cannot_request_one_self
    errors.add(:base, "Cannot request oneself") if sender == receiver
  end
end
