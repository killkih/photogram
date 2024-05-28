# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  let(:user) { create(:user) }

  describe 'GET /show' do
    before { get :show, params: { id: user } }

    it 'assigns the requested Post to @post' do
      expect(assigns(:user)).to eq user
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
end
