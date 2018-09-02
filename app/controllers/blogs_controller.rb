class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:new, :edit, :show, :destroy, :blogdates]
  before_action :log_in, only: [:new, :edit, :show, :destroy]
  
  def index
  end
  
  def blogdates
    @blogs = Blog.all
    # @myblogs = Blog.select("user_id")
  end

  def new
    
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
    
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    @blog.save
    CreateMailer.create_mail(@blog).deliver
    redirect_to blogdates_blogs_path, notice: 'ブログを作成しました！'
  end
  
  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
  
  def edit
  end
  
  def update
    if @blog.update(blog_params)
      redirect_to blogdates_blogs_path, notice:'ブログを編集しました！'
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog.destroy
      redirect_to blogdates_blogs_path, notice:'ブログを削除しました！'
  end
  
  def confirm
    @blog = Blog.new(blog_params)
  end
  
  def log_in
    if @current_user.nil?
      redirect_to new_session_path
    end
  end  
    
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
