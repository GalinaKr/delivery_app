class Package < ApplicationRecord
  attr_accessor :tracking_number, :estimated_delivery_date, :delivery_status

  before_create :generate_tracking_number
  validates_uniqueness_of :tracking_number

  enum delivery_status: { new_: 0, processing: 1, delivered: 2, cancelled: 3 }

  private

  def generate_tracking_number
    self.tracking_number = next_package_number
  end

  def next_package_number
    loop do
      number = "#{first_pattern}#{next_digits}#{last_pattern}"
      break number unless Package.where(tracking_number: number).exists?
    end
  end

  def first_pattern
    'YA'
  end

  def last_pattern
    'AA'
  end

  def next_digits
    last_digits = Package.last.tracking_number.gsub(/[#{first_pattern}#{last_pattern}]/, '').to_i
    "%.3i" %(last_digits + 1)
  end

end
