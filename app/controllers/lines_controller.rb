class LinesController < ApplicationController
  before_action :set_line, only: %i[show edit update destroy]

  def index
    @lines = Line.all
  end

  def show; end

  def new
    @line = Line.new
  end

  def edit; end

  def create
    @line = Line.new(line_params)

    if @line.save
      redirect_to @line, notice: 'Line was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @line.update(line_params)
      redirect_to @line, notice: 'Line was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @line.destroy!
    redirect_to lines_url, notice: 'Line was successfully destroyed.', status: :see_other
  end

  private

  def set_line
    @line = Line.find(params[:id])
  end

  def line_params
    params.require(:line).permit(:lineable_id, :lineable_type, :description, :quantity, :unit_price, :total_price)
  end
end
