module AccountSteps
#GIVEN
  step 'I confirm sing up from confirmation instruction email' do
    ConfirmationInstructionEmail.find_by_recipient(user.email).confirm_my_account
  end

  step 'I confirm employer sing up from confirmation employer instruction email' do
    ConfirmationEmployerInstructionEmail.find_by_recipient(user.email).confirm_my_employer_account
  end

  step 'I select (.+) on (.+) page' do |what, page|
    page.on { looking_to_hire_radio_element.click }
  end

  step 'I fill form on sign up page with blank data' do
    SignUpPage.on { fill_form }
  end

  #WHEN
  step 'I fill form on sign up page with new data' do
    s = self
    s.user = build(:user)
    SignUpPage.on do
      fill_form(username: s.user.name,
                email: s.user.email,
                password: s.user.password,
                looking_for_work_radio: s.user.looking_for_work_radio
                )
    end
  end
  
  step 'I fill form on sign up page with not email data' do
    @user = build(:user)
    SignUpPage.on do
      fill_form(username: out(:@user).name,
                email: 'test.123456789',
                password: out(:@user).password,
                looking_for_work_radio: out(:@user).looking_for_work_radio
                )
    end
  end
  
  step 'I fill form on sign up page with short password' do
    @user = build(:user)
    SignUpPage.on do
      fill_form(username: out(:@user).name,
                email: out(:@user).email,
                password: '1',
                looking_for_work_radio: out(:@user).looking_for_work_radio
      )
    end
  end

  step 'I submit form on :page page' do |page|
    page.on { submit_form }
  end

  step 'I submit form on sign up page' do
    SignUpPage.on { submit_form }
  end
  
  #THEN
  step 'I should receive (.+) email' do |email|
    email.as_email_class.find_by_recipient(@user.email)
  end

  step 'I should receive confirmation instruction email' do
    ConfirmationInstructionEmail.find_by_recipient(user.email)
  end
  step 'I should receive confirmation instruction employer email' do
    ConfirmationInstructionEmployerEmail.find_by_recipient(user.email)
  end


end

RSpec.configure { |c| c.include AccountSteps, account_steps: true }
