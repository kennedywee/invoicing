class LinesController < ApplicationController
  before_action :set_line, only: %i[ show edit update destroy ]

  # GET /lines
  def index
    @lines = Line.all
  end

  # GET /lines/1
  def show
  end

  # GET /lines/new
  def new
    @line = Line.new
  end

  # GET /lines/1/edit
  def edit
  end

  # POST /lines
  def create
    @line = Line.new(line_params)

    if @line.save
      redirect_to @line, notice: "Line was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lines/1
  def update
    if @line.update(line_params)
      redirect_to @line, notice: "Line was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /lines/1
  def destroy
    @line.destroy!
    redirect_to lines_url, notice: "Line was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = Line.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_params
      params.require(:line).permit(:lineable_id, :lineable_type, :description, :quantity, :unit_price, :total_price)
    end
end
