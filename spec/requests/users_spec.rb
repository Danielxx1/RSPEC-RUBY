require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "returns success status" do
      get users_path
      expect(response).to have_http_status(200)
    end
    it "the user's title is present" do 
      users = create_list(:user, 10)
      get users_path
      users.each do |user|
        expect(response.body).to include(user.title)
      end
    end
  end

  describe "POST /users" do 
    context "when it has valid parameters" do
      it "creates the user with correct attributes" do
        user_params = FactoryBot.attributes_for(:user)
        post users_path, params: { user: user_params }
        created_user = User.last

        expect(created_user).to have_attributes(
          nickname: user_params[:nickname],
          kind: user_params[:kind],
          level: user_params[:level]
        )
      end
    end


    context "when it has no valid parameters" do
      it "does not create user" do
        expect {
          post users_path, params: { user: { kind: '', Name: '', nickname: '' }}
        }.not_to change { User.count }
      end
    end
  end
end
