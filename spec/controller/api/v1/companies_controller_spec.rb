
require 'rails_helper'

RSpec.describe Api::V1::CompaniesController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
    allow(controller).to receive(:authorize!).and_return(true)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
    	 company = create(:company)

      get :index

      expect(response).to have_http_status(:success)
      expect(assigns(:companies)).to include(company)
    end
  end

  describe 'POST #create' do
    it 'creates a new company' do
  post :create, params: { company: { name: 'My Private company', location: 'Random location' } }

  expect(response).to have_http_status(:created)
  expect(JSON.parse(response.body)).to include('name' => 'My Private company', 'location' => 'Random location')
end
  end
end
