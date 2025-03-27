class ArchivesController < ApplicationController
  def index
      @posts = current_user.posts.archived.order(created_at: :desc)
                           .page(params[:page])
                           .per(10)
  end

  def show
      @post = current_user.posts.archived.find_by(id: params[:id])
      redirect_to archives_path, alert: "Post not found." unless @post
  end
end
