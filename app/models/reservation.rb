class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def total_price
    (check_out_date - check_in_date).to_i * room.price * number_of_people
  end

  validates :number_of_people, numericality: {greater_than_or_equal_to: 1}, presence: true
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validate :in_out_check

  def in_out_check
    return false if check_in_date.blank? || check_out_date.blank?
    record.errors.add(:check_out_date, "はチェックインより前の日付は選択できません") unless
    self.check_in_date < self.check_out_date
  end
end
