class Users::InvitationsController < Devise::InvitationsController
  def create
    self.resource = invite_resource

    if resource.errors.empty?
      self.resource.create_teacher
      yield resource if block_given?
      set_flash_message :notice, :send_instructions, :email => self.resource.email if self.resource.invitation_sent_at
      respond_with resource, :location => after_invite_path_for(resource)
    else
      respond_with_navigational(resource) { render :new }
    end
  end
end