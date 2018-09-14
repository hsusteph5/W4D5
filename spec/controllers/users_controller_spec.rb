require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it 'renders the new users template' do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "logs the user in" do
        post :create, params:
          { user: { username: 'jianyang',
          password: 'notahotdog'}}
        user = User.find_by(username:'jianyang')
        expect(session[:session_token]).to eq(user.session_token)
      end

      it "redirects them to the user show page" do
        post :create, params:
          { user: { username: 'jianyang',
          password: 'notahotdog'}}
        user = User.find_by(username:'jianyang')
        expect(response).to redirect_to(user_url(user))
      end
    end


    context "with invalid params" do
      it "redirect to :new template and should include errors" do
        post :create, params:
          { user: { username: 'jianyang',
          password: 'notahotdog'}}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
  end

end
