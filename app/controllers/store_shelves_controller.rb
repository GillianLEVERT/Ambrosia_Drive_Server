class StoreShelvesController < ApplicationController
  before_action :set_store_shelf, only: %i[ show update destroy ]

  # GET /store_shelves
  def index
    @store_shelves = StoreShelf.all

    render json: @store_shelves
  end

  # GET /store_shelves/1
  def show
    render json: @store_shelf
  end

  # POST /store_shelves
  def create
    @store_shelf = StoreShelf.new(store_shelf_params)

    if @store_shelf.save
      render json: @store_shelf, status: :created, location: @store_shelf
    else
      render json: @store_shelf.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /store_shelves/1
  def update
    if @store_shelf.update(store_shelf_params)
      render json: @store_shelf
    else
      render json: @store_shelf.errors, status: :unprocessable_entity
    end
  end

  # DELETE /store_shelves/1
  def destroy
    @store_shelf.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_shelf
      @store_shelf = StoreShelf.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def store_shelf_params
      params.require(:store_shelf).permit(:name)
    end
end
