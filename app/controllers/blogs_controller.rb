class BlogsController < ApplicationController
  before_action :blog_set, only: %i[show edit update destroy]
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: '新規ブログ作成完了！'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: 'ブログ更新完了！'
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: 'ブログ削除完了！'
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def blog_set
    @blog = Blog.find(params[:id])
  end
end
