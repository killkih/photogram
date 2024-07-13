# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  let(:user) { create(:user) }
  let(:friend) { create(:user) }

  describe 'GET #show' do
    before { get :show, params: { id: user } }

    it 'assigns the requested Post to @post' do
      expect(assigns(:user)).to eq user
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'POST #subscribe' do

    before { login(user) }

    it 'saves a new friendship in the database' do
      expect { post :subscribe, params: { id: friend } }.to change(Friendship, :count).by(1)
    end

    it 'redirects to index view' do
      post :subscribe, params: { id: friend }
      expect(response).to redirect_to profile_path(friend)
    end
  end

  describe 'DELETE #unsubscribe' do
    before { login(user) }

    let!(:friendship) { create(:friendship, user_id: user.id, friend_id: friend.id) }

    it 'delete the friendship' do
      expect { delete :unsubscribe, params: { id: friend } }.to change(Friendship, :count).by(-1)
    end

    it 'redirects to friend list' do
      delete :unsubscribe, params: { id: friend }
      expect(response).to redirect_to friends_path
    end
  end
end
