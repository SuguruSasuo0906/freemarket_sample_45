# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  prepend_before_action :check_captcha, only: [:create]

  # GET /resource/sign_up
  def new
    @user=User.new
    # @user.build_address
  end

  # POST /resource
  def create
    #@user = User.new(user_params)
    #if verify_recaptcha
    # @user = User.new(user_params)
    # if @user.save
    #  redirect_to new_phone_number_path(user_id: current_user.id)
    #   return
    # else
    #   render :new
    # end
    super
   # else
      #self.resource = resource_class.new
      #respond_with_navigational(resource) { render :new }
   # end
  end

  def after_sign_up_path_for(resource)
    new_phone_number_path(user_id: current_user.id)
  end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  private
# def user_params
#   params.require(:user).permit(:nickname,:last_name,:first_name,:last_name_kana,:first_name_kana,:year,:month,:day)
# end

def check_captcha
  self.resource = resource_class.new sign_up_params
  resource.validate
  unless verify_recaptcha(model: resource)
    respond_with_navigational(resource) { render :new }
  end
end

end
