class Qun < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :posts
end
