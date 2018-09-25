class BlogsController < ApplicationController
  before_action :forcibly_redirect, only:[:new,:edit,:show,:destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id

    # respond_to do |format|
    if @blog.save
      # SubmitMailer.submit_mail(@blog).deliver
      # format.html { redirect_to @blog, notice: 'Contact was successfully created.' }
      # format.json { render :show, status: :created, location: @blog }
      redirect_to blogs_path
    else
      # format.html { render :new }
      # format.json { render json: @blog.errors, status: :unprocessable_entity }
      render 'new'
    end
    # end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new if @blog.invalid?
  end

  def show
    @blog = Blog.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
    @comments = @blog.comments
    @comment = @blog.comments.build
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :blog_image, :blog_image_cache)
  end

  def forcibly_redirect
    if current_user.present? == false
      redirect_to new_session_path
    end
  end

end
