class PostsController < ApplicationController
  # before_action :authenticate_user
  
  def index
    @posts = Post.all.order(created_at: :asc)
  end
  
  def show
  end

  def edit 
  end

  # def new
  #   session[:stop_status] = false unless $global_stop_status
  # end

  # def reset
  #   session[:stop_status] = false
  # end

  def yes
    @post = Post.new( yes_no: "YES" )
    if @post.save
      # session[:stop_status] = false unless $global_stop_status
      redirect_to("/posts/show")
      session[:stop_status] = true
      $global_stop_status = true
    else
      render("posts/new")
    end
  end

  def no
    @post = Post.new( yes_no: "NO" )
    if @post.save
      redirect_to("/posts/show")
      session[:stop_status] = true
      $global_stop_status = true
    else
      render("posts/new")
    end
  end

  # def yes
  #   # セッションに :yes_submitted が設定されていない場合のみ処理を実行
  #   unless session[:yes_submitted]
  #     @post = Post.new(yes_no: "YES")
  #     if @post.save
  #       # セッションに :yes_submitted を設定して、再度のカウントを防ぐ
  #       session[:yes_submitted] = true
  #       # session[:stop_status] = false unless $global_stop_status
  #       redirect_to("/posts/show")
  #     else
  #       render("posts/new")
  #     end
  #   else
  #     # 既に YES が送信されている場合は、何らかのメッセージを表示
  #     redirect_to("/posts/top", notice: "You have already submitted.")
  #   end
  # end

  def stop
    # $stop = "stop"
    # current_user.update(stop_status: true)
    # $global_stop_status = true
    # session[:stop_status] = true
    redirect_to("/posts/index")
  end

  def start
    # $stop = "start"
    # current_user.update(stop_status: false)
    # $global_stop_status = false
    # session[:stop_status] = false
    # session[:yes_submitted] = false
    Post.destroy_all
    redirect_to("/posts/index")
  end
  
end

