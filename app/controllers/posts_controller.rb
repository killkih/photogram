class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path, notice: 'Post successfully created!'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :body)
  end

end
