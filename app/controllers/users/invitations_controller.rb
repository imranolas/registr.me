class Users::InvitationsController < Devise::InvitationsController
  before_filter :get_organisation, only: [:create]
  def create
    self.resource = invite_resource
    self.resource.teachers.create organisation: @organisation

    if resource.errors.empty?
      yield resource if block_given?
      set_flash_message :notice, :send_instructions, :email => self.resource.email if self.resource.invitation_sent_at
      redirect_to @organisation
    else
      respond_with_navigational(resource) { render :new }
    end
  end
end