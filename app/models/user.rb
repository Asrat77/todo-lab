class User < ApplicationRecord
  has_secure_password

  has_many :friend_requests_sent, class_name: "FriendRequest", foreign_key: "sender_id"
  has_many :friend_requests_received, class_name: "FriendRequest", foreign_key: "receiver_id"
  has_many :tasks

  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
