# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post!, except: :index

  def index
    @posts = Post.all
  end

  def show; end

  def new; end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to root_path, notice: 'Post successfully created!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to root_path, notice: 'Post successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Post successfully deleted!'
  end

  private

  def post_params
    params.require(:post).permit(:content, :body)
  end

  def set_post!
    @post ||= params[:id] ? Post.find(params[:id]) : Post.new
  end
end
