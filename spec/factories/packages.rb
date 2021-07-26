FactoryBot.define do
  factory :package do
    courier { create :courier }
    tracking_number { "123456" }
    delivery_status { true }
  end
end
