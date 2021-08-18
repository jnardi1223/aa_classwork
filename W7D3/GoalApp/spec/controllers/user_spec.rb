require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders a new users template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:user_params) do {
        user: {
            username: 'Capy',
            password: 'password'
          }
        }
      end

      it 'logs in the user' do
        post :create, params: user_params
        user = User.find_by(username: 'Capy')
        expect(session[:session_token]).to eq user.session_token
      end

      it 'redirects to the users #show page' do
        post :create, params: user_params

        user = User.find_by(username: 'Capy')
        expect(response).to redirect_to(user_url(user))
      end
    end
  end
end