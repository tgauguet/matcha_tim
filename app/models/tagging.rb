class Tagging < ActiveRecord::Base
  has_many :tags
  has_many :users, through: :tags
  validates :name, presence: true
end