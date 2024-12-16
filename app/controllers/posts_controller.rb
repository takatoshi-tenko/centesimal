class PostsController < ApplicationController
  # before_action :authenticate_user
  
  def index
    @posts = Post.all.order(created_at: :asc)
  end
  
  def show
  end

  def edit 
  end

  def yes
    @post = Post.new( yes_no: "A" )
    if @post.save
      redirect_to("/posts/show")
      $global_stop_status = true
    else
      render("posts/new")
    end
  end

  def no
    @post = Post.new( yes_no: "B" )
    if @post.save
      redirect_to("/posts/show")
      $global_stop_status = true
    else
      render("posts/new")
    end
  end

  def stop
    redirect_to("/posts/index")
  end

  def start
    Post.destroy_all
    redirect_to("/posts/index")
  end
  
end

