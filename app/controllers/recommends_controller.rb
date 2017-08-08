class RecommendsController < ApplicationController
  def index
    @recommends = Recommend.page(params[:page]).per(10)

    render("recommends/index.html.erb")
  end

  def show
    @recommend = Recommend.find(params[:id])

    render("recommends/show.html.erb")
  end

  def new
    @recommend = Recommend.new

    render("recommends/new.html.erb")
  end

  def create
    @recommend = Recommend.new

    @recommend.rating_id = params[:rating_id]
    @recommend.friend_id = params[:friend_id]
    @recommend.entertainment_id = params[:entertainment_id]

    save_status = @recommend.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/recommends/new", "/create_recommend"
        redirect_to("/recommends")
      else
        redirect_back(:fallback_location => "/", :notice => "Recommend created successfully.")
      end
    else
      render("recommends/new.html.erb")
    end
  end

  def edit
    @recommend = Recommend.find(params[:id])

    render("recommends/edit.html.erb")
  end

  def update
    @recommend = Recommend.find(params[:id])

    @recommend.rating_id = params[:rating_id]
    @recommend.friend_id = params[:friend_id]
    @recommend.entertainment_id = params[:entertainment_id]

    save_status = @recommend.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/recommends/#{@recommend.id}/edit", "/update_recommend"
        redirect_to("/recommends/#{@recommend.id}", :notice => "Recommend updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Recommend updated successfully.")
      end
    else
      render("recommends/edit.html.erb")
    end
  end

  def destroy
    @recommend = Recommend.find(params[:id])

    @recommend.destroy

    if URI(request.referer).path == "/recommends/#{@recommend.id}"
      redirect_to("/", :notice => "Recommend deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Recommend deleted.")
    end
  end
end
