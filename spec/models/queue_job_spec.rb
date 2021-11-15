require 'rails_helper'

RSpec.describe QueueJob, type: :model do
  
  describe 'validations' do
    it { should validate_presence_of(:queue_type) }
  end

end
