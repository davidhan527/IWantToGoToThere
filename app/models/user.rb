class User < ActiveRecord::Base
  include Clearance::User

  has_many :itineraries

  has_many :friendships
  has_many :passive_friendships,
           class_name: "Friendship",
           foreign_key: "friend_id"

  has_many :active_friends, -> { where(friendships: { approved: true }) },
           through: :friendships,
           source: :friend

  has_many :passive_friends, -> { where(friendships: { approved: true }) },
           through: :passive_friendships,
           source: :user

  has_many :pending_friends, -> { where(friendships: { approved: false }) },
           through: :friendships,
           source: :friend

  has_many :requested_friendships,
           -> { where(friendships: { approved: false }) },
           through: :passive_friendships,
           source: :user

  def requested?(user)
    pending_friends.include? user
  end

  def friends
    active_friends | passive_friends
  end

  def already_friends(user)
    friends.include? user
  end
end
