class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]
  def new
    @user = User.new
  end

  def create
    super
  end

  def after_sign_up_path_for(resource)
    new_phone_number_path(@user)
  end

  private

def check_captcha
  self.resource = resource_class.new sign_up_params
  resource.validate
  unless verify_recaptcha(model: resource)
    respond_with_navigational(resource) { render :new }
  end
end

end
