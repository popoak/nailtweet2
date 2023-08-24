class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC")
    @weekly_ranked_prototypes = Prototype.includes(:user)
                                          .where(created_at: 1.week.ago..Time.now)
                                          .left_joins(:likes)
                                          .group(:id)
                                          .order(Arel.sql('COUNT(likes.id) DESC'))
                                          .limit(5)
  end

  def new
    @prototype = Prototype.new
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    @prototype = Prototype.find(params[:id])
    @liked_by_user = user_signed_in? && Like.liked_by_user?(current_user, @prototype)
  end

  def create
    # binding.pry
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to @prototype, notice: 'Prototype was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path, notice: 'Prototype was successfully destroyed.'
  end

  def like
    @prototype = Prototype.find(params[:id])
    liked = params[:liked] == "true" # trueまたはfalseの文字列をBooleanに変換
    if liked
      @prototype.likes.create(user: current_user)
    else
      like = @prototype.likes.find_by(user: current_user)
      like.destroy if like
    end
    render json: { like_count: @prototype.likes.count }
  end

  def search
    @prototypes = Prototype.search(params[:keyword])
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :price, :catch_copy, :image, :likes_count).merge(user_id: current_user.id)
  end

  def check_owner
    @prototype = Prototype.find(params[:id])
    redirect_to root_path unless @prototype.user == current_user
  end
end
