class ListsController < ApplicationController
  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/:id
  def show
    @list = List.find(params[:id])
    @reviews = @list.reviews.order(created_at: :desc)
    @bookmark = Bookmark.new
    @review = Review.new
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: 'List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
