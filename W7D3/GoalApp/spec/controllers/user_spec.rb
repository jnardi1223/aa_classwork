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

 describe 'GET #index' do 
    it 'renders the index template' do 
      get :index 
      expect(response).to render_template(:index)
    end 
 end 
    
 describe 'GET #show' do 

  it 'renders the show template' do 
      get :show 
      expect(response).to render_template(:show)
    end 

  it 'redirects to users show page' do 
    get :show 
    user = User.find_by(username: 'Capy')
    expect(response).to redirect_to(user_url(user))
  end 
 end 


end

