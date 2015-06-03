class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def create
    respond_with Item.create(item_params), location: ''
  end

  def update
    respond_with Item.update(params[:id], item_params)
  end

private

  def item_params
    params.require(:item).permit(:name, :description)
  end

end
