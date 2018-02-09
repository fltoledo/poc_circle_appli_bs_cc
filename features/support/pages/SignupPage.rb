class SignupPage
  include PageObject
  
  text_field(:user_email, :css => '.modal2-background .sign-up-body__form-field #user_email')
  text_field(:user_password, :css => '.modal2-background .sign-up-body__form-field #user_password')
  text_field(:user_password_confirmation, :css => '.modal2-background .sign-up-body__form-field #user_password_confirmation')
  button(:signupBtn, :css => 'div.modal2-background div.sign-up-actions > button')
  span(:switchToSignin_span, :css => 'body > div.modal2-background > div > div > div.modal-body > div.sign-in-sign-up-footer > div:nth-child(1) > span')
  label(:error_message, :css => 'div.js-email-field.sign-up-body__form-field.form-field__input--invalid > label')
  
  
  def switchToSignin
    self.switchToSignin_span_element.click
  end

  def signUp_with(email, password)
    self.user_email = email
    self.user_password = password
    self.user_password_confirmation = password
    signupBtn_element.click
  end
    
  def loaded?
    self.user_email?
    self.user_password?
    self.user_password_confirmation?
    self.signupBtn?
    self.switchToSignin_span?
  end

  def validate_error_message(message)
    self.error_message?
    self.error_message_element.text.include?(message)
  end
  
end