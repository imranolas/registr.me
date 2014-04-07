class Users::InvitationsController < Devise::InvitationsController
  before_filter :get_organisation
  def create
    self.resource = invite_resource
    self.resource.teachers.create organisation: @organisation

    if resource.errors.empty?
      yield resource if block_given?
      set_flash_message :notice, :send_instructions, :email => self.resource.email if self.resource.invitation_sent_at
      respond_with resource, :location => after_invite_path_for(resource)
    else
      respond_with_navigational(resource) { render :new }
    end
  end
end