class FriendsController < ApplicationController
  def index
    @friends = Friend.all

    render("friends/index.html.erb")
  end

  def show
    @recommend = Recommend.new
    @friend = Friend.find(params[:id])

    render("friends/show.html.erb")
  end

  def new
    @friend = Friend.new

    render("friends/new.html.erb")
  end

  def create
    @friend = Friend.new

    @friend.sender_id = params[:sender_id]
    @friend.accepted_at = params[:accepted_at]

    save_status = @friend.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/friends/new", "/create_friend"
        redirect_to("/friends")
      else
        redirect_back(:fallback_location => "/", :notice => "Friend created successfully.")
      end
    else
      render("friends/new.html.erb")
    end
  end

  def edit
    @friend = Friend.find(params[:id])

    render("friends/edit.html.erb")
  end

  def update
    @friend = Friend.find(params[:id])

    @friend.sender_id = params[:sender_id]
    @friend.accepted_at = params[:accepted_at]

    save_status = @friend.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/friends/#{@friend.id}/edit", "/update_friend"
        redirect_to("/friends/#{@friend.id}", :notice => "Friend updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Friend updated successfully.")
      end
    else
      render("friends/edit.html.erb")
    end
  end

  def destroy
    @friend = Friend.find(params[:id])

    @friend.destroy

    if URI(request.referer).path == "/friends/#{@friend.id}"
      redirect_to("/", :notice => "Friend deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Friend deleted.")
    end
  end
end
