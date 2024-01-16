require 'rails_helper'

RSpec.describe "Posts", type: :request do

  describe "GET /index" do
    let(:posts) { create_list(:post, 3) }

    before { get :index }

    it 'populates an array of all questions' do
      expect(assigns(:posts)).to match_array(posts)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
