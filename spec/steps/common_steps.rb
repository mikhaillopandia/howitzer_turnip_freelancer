module Turnip::Steps
  # rubocop:enable Style/ClassAndModuleChildren
  attr_accessor :admin, :user

  # GIVEN
  # rubocop:disable Style/SymbolProc
  step ':page page of web application' do |page|
    page.open
    end

  step 'sign up page of web application' do
    SignUpPage.open
  end

  step 'I am user' do
    @user = create(:user)
  end

  step 'I am logged in as admin user' do
    @user = create(:user, :admin)
    sleep 10
    LoginPage.open
    LoginPage.on { login_as(out(:@user).email, out(:@user).password) }
  end

  #WHEN

  step 'I click :text menu item on :page page' do |text, page|
    page.on { main_menu_section.choose_menu(text.split.map(&:capitalize)*' ') }
  end

  step 'I click log in menu item on :page page' do |page|
    page.on { main_menu_section.choose_menu('Log In') }
    end

  step 'I click sign up menu item on :page page' do |page|
    page.on { main_menu_section.choose_menu('Sign Up') }
  end

  step 'I navigate to :page page' do |page|
    page.open
  end

  #THEN

  step ':page page should be displayed' do |page|
    expect(page).to be_displayed
  end

  step ':page page should not be displayed' do |page|
    expect(page).not_to be_displayed
  end

  step 'I should be redirected to :page page' do |page|
    expect(page).to be_displayed
    end

  step 'I should be redirected to sign up page' do
    expect(SignUpPage).to be_displayed
  end

  step 'I should see following text on :page page:' do |page, string|
    page.on { expect(text).to include(string) }
  end

  step 'I should not be logged in the system' do
    expect(SignUpPage).to be_displayed

  end

  step 'I should be logged in the system' do
    expect(JobsPage).to be_authenticated
  end

end
