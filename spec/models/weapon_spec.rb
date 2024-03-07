# spec/models/weapon_spec.rb
# spec/models/weapon_spec.rb

require 'rails_helper'

RSpec.describe Weapon, type: :model do
  describe '#current_power' do
    it 'calculates the current power of the weapon' do
      weapon = create(:weapon, level: 3)
      expect(weapon.current_power).to eq(3200)
    end
  end

  describe '#title' do
    it 'returns the title of the weapon' do
      weapon = create(:weapon, name: 'Excalibur', level: 2)
      expect(weapon.title).to eq('Excalibur #2')
    end
  end
end
