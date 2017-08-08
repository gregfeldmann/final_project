class EntertainmentsController < ApplicationController
  def index
    @entertainments = Entertainment.all

    render("entertainments/index.html.erb")
  end

  def show
    @rating = Rating.new
    @recommend = Recommend.new
    @entertainment = Entertainment.find(params[:id])

    render("entertainments/show.html.erb")
  end

  def new
    @entertainment = Entertainment.new

    render("entertainments/new.html.erb")
  end

  def create
    @entertainment = Entertainment.new

    @entertainment.title = params[:title]

    save_status = @entertainment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/entertainments/new", "/create_entertainment"
        redirect_to("/entertainments")
      else
        redirect_back(:fallback_location => "/", :notice => "Entertainment created successfully.")
      end
    else
      render("entertainments/new.html.erb")
    end
  end

  def edit
    @entertainment = Entertainment.find(params[:id])

    render("entertainments/edit.html.erb")
  end

  def update
    @entertainment = Entertainment.find(params[:id])

    @entertainment.title = params[:title]

    save_status = @entertainment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/entertainments/#{@entertainment.id}/edit", "/update_entertainment"
        redirect_to("/entertainments/#{@entertainment.id}", :notice => "Entertainment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Entertainment updated successfully.")
      end
    else
      render("entertainments/edit.html.erb")
    end
  end

  def destroy
    @entertainment = Entertainment.find(params[:id])

    @entertainment.destroy

    if URI(request.referer).path == "/entertainments/#{@entertainment.id}"
      redirect_to("/", :notice => "Entertainment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Entertainment deleted.")
    end
  end
end
