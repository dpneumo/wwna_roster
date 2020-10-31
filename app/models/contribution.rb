class Contribution < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :house

  validates :house_id,  presence: true
  validates :date_paid, presence: true
  validates :amount,    presence: true,
                        length: { maximum: 10 }

  before_save :clean_amount

  def clean_amount
    new_amount = amount.delete '^0-9.'
    self.amount = number_to_currency(new_amount, raise: true)
  rescue
    self.amount = '$0.00'
  end
end
