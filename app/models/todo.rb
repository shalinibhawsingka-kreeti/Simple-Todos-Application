class Todo < ApplicationRecord
  belongs_to :user
  scope :completed, -> { where(status: true) }
  scope :not_completed, -> { where(status: false) }
  scope :order_by_date, -> { order(:date) }
end
