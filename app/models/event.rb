class Event < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user, presence: true
  validates :title, presence: true, length: {maximum: 255}
  validates :address, presence: true
  validates :datetime, presence: true
end
