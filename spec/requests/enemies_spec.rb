require 'rails_helper'

RSpec.describe "Enemies", type: :request do
  describe "PUT /enemies" do
    context 'when the enemy exists' do

      let(:enemy) { create(:enemy) }
      let(:enemy_attributes) { attributes_for(:enemy) }
      before(:each) {put "/enemies/#{enemy.id}", params: { enemy: enemy_attributes}}

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end 
      it 'update the enemy'do
        expect(enemy.reload).to have_attributes(enemy_attributes)
      end
      it 'return the enemy updated'do        
        expect(enemy.reload).to have_attributes(json.except('created_at', 'updated_at'))
      end
    end

    context 'when the enemy does not exist' do

      before(:each) {put "/enemies/0", params: { enemy: attributes_for(:enemy) }}

      it 'return status code 404' do
        expect(response).to have_http_status(404)
      end
      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end
end

RSpec.describe "Enemies", type: :request do
  
  describe "DELETE /enemies" do
    context 'when the enemy exists' do

      let(:enemy) { create(:enemy) }
      before(:each) {delete "/enemies/#{enemy.id}" }
      
      it 'return status code 200' do
        expect(response).to have_http_status(204)
      end
      
      it 'destroy the record' do
        expect{enemy.reload}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when the enemy does not exist' do

      before(:each) { delete'/enemies/0' }
      
      it 'return status code 404' do
        expect(response).to have_http_status(404)
      end
      
      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end
end

RSpec.describe "Enemies", type: :request do
  
  describe "GET /enemies/:id" do
    it "test return index" do
      get enemies_path
      expect(response).to have_http_status(200)
    end      

    it "check that all details of the enemy are present in the show page" do
      enemy = create(:enemy)
      get "/enemies/#{enemy.id}"
      expect(response.body).to include(enemy.name)
      expect(response.body).to include(enemy.power_base.to_s)
      expect(response.body).to include(enemy.power_step.to_s)
      expect(response.body).to include(enemy.level.to_s)
      expect(response.body).to include(enemy.kind)
    end
  end
end

RSpec.describe "Enemies", type: :request do
  context 'create enemy with valid parameters' do

    let(:enemy) { attributes_for(:enemy) }
    before(:each) {post "/enemies", params: { enemy: enemy}}
    
    it 'return the enemy created' do
      expect(json['name']).to eq(enemy[:name])
      expect(json['power_base']).to eq(enemy[:power_base])
      expect(json['power_step']).to eq(enemy[:power_step])
      expect(json['level']).to eq(enemy[:level])
      expect(json['kind']).to eq(enemy[:kind])
    end
  end
end
