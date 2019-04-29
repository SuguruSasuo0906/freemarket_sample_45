# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
  end

  # POST /resource
  def create
    @user = User.new(user_params)
    if verify_recaptcha
      super
      if @user.save
        redirect_to root_path
      else
        render :new
      end
    else
      self.resource = resource_class.new
      respond_with_navigational(resource) { render :new }
    end
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
def user_params
  params.permit(:nickname,:last_name,:first_name,:last_name_kana,:first_name_kana,:year,:month,:day)
end

end
