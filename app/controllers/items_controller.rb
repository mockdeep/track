class ItemsController < ApplicationController
  def index
    @items = current_user.items
  end

  def new
    @item = current_user.items.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def update
    @item = current_user.items.find(params[:id])

    if @item.update_attributes(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    item = current_user.items.find(params[:id])
    item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params[:item].permit(:name)
  end
end
