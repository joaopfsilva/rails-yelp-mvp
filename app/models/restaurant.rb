class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :category, inclusion: { in: ['chinese','italian','japanese','french','belgian'], allow_nil: false }, presence: true
  validates :name, presence: true
  validates :address, presence: true
end
