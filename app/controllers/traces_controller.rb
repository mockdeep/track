class TracesController < ApplicationController
  before_filter :find_item

  def index
    @traces = @item.traces
  end

  def new
    @trace = @item.traces.new
  end

  def create
    @trace = @item.traces.new(trace_params)
    if @trace.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
    @trace = @item.traces.find(params[:id])
  end

  def update
    @trace = @item.traces.find(params[:id])
    if @trace.update_attributes(trace_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    trace = @item.traces.find(params[:id])
    trace.destroy
    redirect_to items_path
  end

  private

  def find_item
    @item = current_user.items.find(params[:item_id])
  end

  def trace_params
    params[:trace].permit(:count, :executed_on)
  end
end
