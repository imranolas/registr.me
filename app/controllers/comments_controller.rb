class CommentsController < ApplicationController
  def create
    resource_class = Kernel.const_get(params[:resource_class])
    resource = resource_class.find(params[:id])
    Comment.build_from( resource, current_user.id, params[:comment] )
    redirect_to resource
  end
end
