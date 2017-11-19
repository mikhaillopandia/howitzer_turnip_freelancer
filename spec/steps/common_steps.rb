# rubocop:disable Style/ClassAndModuleChildren
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

  # WHEN

  step 'I click :text menu item on :page page' do |text, page|
    page.on { main_menu_section.choose_menu(text) }
  end

  step 'I click Log In menu item on :page page' do |page|
    page.on { main_menu_section.choose_menu('Log In') }
  end

  step 'I click Sign Up menu item on :page page' do |page|
    page.on { main_menu_section.choose_menu('Sign Up') }
  end

  step 'I navigate to :page page' do |page|
    page.open
  end

  # THEN

  step 'I should be redirected to :page page' do |page|
    expect(page).to be_displayed
  end

  step 'I should be redirected to sign up page' do
    expect(SignUpPage).to be_displayed
  end

  step 'I should see following text on :page page:' do |page, string|
    page.on { expect(text).to include(string) }
  end

  step 'I should see following text on sign up page:' do |string|
    SignUpPage.on { expect(text).to include(string) }
  end

  step 'I should see following messages on sign up page:' do |table|
    str = table.raw.map(&:first)
    SignUpPage.on do
      wait_for(text).to include(str.compact.join(' '))
    end
  end

  step 'I should not be logged in the system' do
    expect(SignUpPage).to be_displayed
  end

  step 'I should be logged in the system' do
    DashboardPage.on { is_expected.to have_no_main_menu_section }
  end
end
