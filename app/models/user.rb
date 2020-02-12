class User < ActiveRecord::Base
  REGEX_EMAIL = /.+@.+\..+/

  has_many :events

  validates :name, presence: true, length: {maximum: 35}
  validates :email, presence: true, length: {maximum: 255}
  validates :email, uniqueness: true
  validates :email, format: { with: REGEX_EMAIL }
end
