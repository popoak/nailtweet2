class LikesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @prototype = Prototype.find(params[:prototype_id])
    current_user.likes.create(prototype: @prototype)
    redirect_to @prototype
  end

  def destroy
    @prototype = Prototype.find(params[:prototype_id])
    current_user.likes.find_by(prototype: @prototype).destroy
    redirect_to @prototype
  end
end
