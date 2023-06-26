class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, numericality: true, presence: true
  validates :location, presence: true
  validates :price,  numericality: {greater_than_or_equal_to: 1}, presence: true

  before_create :default_image

  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-image.png')), filename: 'default-image.png', content_type: 'image/png')
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "introduction", "location"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob", "reservations", "user", "room"]
  end
end
