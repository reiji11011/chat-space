class Group < ApplicationRecord
  has_many :groups_users, dependent: :destroy
  has_many :users, through: :groups_users

  accepts_nested_attributes_for :groups_users, allow_destroy: true
end
