class Quotation < ApplicationRecord
  belongs_to :customer
  has_many :lines, as: :lineable
  accepts_nested_attributes_for :lines, reject_if: :all_blank, allow_destroy: true

  enum :status, %w[draft sent rejected accepted], default: :draft

  validates :customer, presence: true
  validates :due_at, comparison: { greater_than: :issue_at }

  def generate_number
    self.number = "Q#{Time.now.strftime('%Y%m%d')}#{rand(1000..9999)}"
  end
end
