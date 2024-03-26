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
    @post = Post.new( yes_no: "YES" )
    if @post.save
      redirect_to("/posts/show")
    else
      render("posts/new")
    end
  end

  def no
    @post = Post.new( yes_no: "NO" )
    if @post.save
      redirect_to("/posts/show")
    else
      render("posts/new")
    end
    
  end

  def stop
    $stop = "stop"
    redirect_to("/posts/index")
  end

  def start
    $stop = "start"
    Post.destroy_all
    redirect_to("/posts/index")
  end
  
end

