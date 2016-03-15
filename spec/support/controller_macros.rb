module ControllerMacros
  def sign_in_user
    before(:each) do
      @user = FactoryGirl.create(:user)
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in @user
    end
  end
end
