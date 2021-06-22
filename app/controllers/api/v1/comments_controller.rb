class Api::V1::CommentsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:show]
  before_action :set_comment, only: [:show, :update, :destroy]

  def show
  end

  def create
    @restaurant = policy_scope(Restaurant).find(params[:restaurant_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.restaurant = @restaurant
    authorize @comment
    if @comment.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @comment.update(comment_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :rating)
  end

  def set_comment
    @comment = authorize policy_scope(Comment).find(params[:id])
  end

  def render_error
    render json: { errors: @comment.errors.full_messages },
    status: :unprocessable_entity
  end
end
