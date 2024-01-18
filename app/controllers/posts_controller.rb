class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    get_post
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

  def destroy
    get_post.destroy
    redirect_to root_path, notice: 'Post successfully deleted!'
  end

  private

  def post_params
    params.require(:post).permit(:content, :body)
  end

  def get_post
    @post ||= params[:id] ? Post.find(params[:id]) : Post.new
  end

end
