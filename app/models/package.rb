class Package < ApplicationRecord
    belongs_to :courier

    before_create :generate_tracking_number
    validates_uniqueness_of :tracking_number

    enum delivery_status: { new_: 0, processing: 1, delivered: 2, cancelled: 3 }

    private

    def generate_tracking_number
        # format: YA<8 digits sequence>AA
        @tracking_number = self.tracking_number = 'YA'+rand(10000000..99999999).to_s+'AA'
    end
end
