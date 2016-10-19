# The pages_controller.rb contains all the code for /pages
class PagesController < ApplicationController

  # back-end code for /pages/index
  def index
  end

  # back-end code for /pages/home
  def home
    @posts = Post.all
  end

  # back-end code for /pages/profile
  def profile
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice=> "User not found!"
    end
    
    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
    @newPost = Post.new
  end

  # back-end code for /pages/explore
  def explore
    @posts = Post.all
  end
end
