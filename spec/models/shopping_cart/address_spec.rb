require 'rails_helper'

module ShoppingCart
  RSpec.describe Address, type: :model do
    it { should validate_presence_of(:zip) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:country_id) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:first_name) }

    it { should validate_numericality_of(:zip) }

    it { should belong_to(:country) }
    it { should belong_to(:addressable) }
  end
end
