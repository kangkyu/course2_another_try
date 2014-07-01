class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, except: [:show, :index]

  def index
    @posts = Post.find(:all).reverse
  end

  def show
    # @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      redirect_to @post #
    else
      render 'new'
    end
  end

  def edit
    # @post = Post.find(params[:id])
  end

  def update
    # @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post #
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :description, :category_ids => [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end