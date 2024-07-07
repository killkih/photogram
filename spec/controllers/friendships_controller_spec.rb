# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  let(:user) { create(:user) }
  let(:friendships) { create_list(:friendship, 5, user: user) }

  describe 'GET #index' do
    context 'Authenticated user' do

      before do
        login user
        get :index
      end

      it 'populates an array of all friendships' do
        expect(assigns(:friendships)).to match_array(friendships)
      end

      it 'renders index view' do
        expect(response).to render_template :index
      end
    end

    context 'Unauthenticated user' do
      it 'redirect to login page' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end