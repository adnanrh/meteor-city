class HomeController < ApplicationController
  def index
    # TODO paginate this

    @posts = Post.visible_to(current_user)
                 .includes(:user, :likes, :comments)
                 .order(created_at: :desc)
                 .page(params[:page])
                 .per(10)
  end
end
