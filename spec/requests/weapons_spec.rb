require 'rails_helper'

RSpec.describe "Weapons", type: :request do
  describe "GET /weapons" do
    it "works! (now write some real specs)" do
      get weapons_path
      expect(response).to have_http_status(200)
    end

    it "the weapon's title is present" do
      weapons = create_list(:weapon, 10)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.title)
      end
    end

    it "the weapon's current power is present" do
      weapons = create_list(:weapon, 10)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.current_power.to_s)
      end
    end

    it " the name of the weapon is present" do
      weapons = create_list(:weapon, 10)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.name)
      end
    end

    it "the link to create weapon is present" do
      get weapons_path
      expect(response.body).to include('<a href="' + weapons_path + '">Back</a>')
    end

    it "check that all details of the weapon are present in the show page" do
      weapon = create(:weapon)
      get weapons_path(weapon)
      expect(response.body).to include(weapon.title)
      expect(response.body).to include(weapon.current_power.to_s)
      expect(response.body).to include(weapon.name)
    end
  end

  describe "POST /weapons" do
    it "creates the weapon with correct attributes" do
      weapon_params = FactoryBot.attributes_for(:weapon)
      post weapons_path, params: { weapon: weapon_params }
      created_weapon = Weapon.last
      expect(created_weapon).to have_attributes(
        name: weapon_params[:name],
        description: weapon_params[:description],
        power_base: weapon_params[:power_base],
        power_step: weapon_params[:power_step],
        level: weapon_params[:level]
      )
    end

    it "does not create wepaon with invalid attributes" do
      weapon_params = FactoryBot.attributes_for(:weapon, name: nil)
      post weapons_path, params: { weapon: weapon_params }
      expect(Weapon.count).to eq(0)
    end
  end

  it "verify if id exists and destroy" do
    weapon = create(:weapon)
    expect(Weapon.count).to eq(1)
    delete weapon_path(weapon)
    expect(Weapon.count).to eq(0)
  end
end
