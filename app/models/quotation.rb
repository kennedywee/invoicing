class Quotation < ApplicationRecord
  belongs_to :customer
  has_many :lines, as: :lineable
end
