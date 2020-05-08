class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :subscriptions
  # Чтобы Рельсы понимали, какой именно класс будет лежать
  # в модели subscribers, надо указать source
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :photos

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :address, presence: true
  validates :datetime, presence: true
  scope :sorted, -> { order(:datetime) }

  def visitors
    (subscribers + [user]).uniq
  end

  def pincode_valid?(pin2chek)
    pincode == pin2chek
  end
end
