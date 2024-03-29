class QuotationsController < ApplicationController
  before_action :set_quotation, only: %i[show edit update destroy]

  # GET /quotations
  def index
    @quotations = Quotation.all.order(created_at: :desc)
  end

  # GET /quotations/1
  def show; end

  # GET /quotations/new
  def new
    @quotation = Quotation.new(issue_at: Date.today, due_at: Date.today + 7.days)
    @quotation.generate_number
  end

  # GET /quotations/1/edit
  def edit; end

  # POST /quotations
  def create
    @quotation = Quotation.new(quotation_params)

    if @quotation.save
      redirect_to @quotation, notice: 'Quotation was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quotations/1
  def update
    if @quotation.update(quotation_params)
      redirect_to @quotation, notice: 'Quotation was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /quotations/1
  def destroy
    @quotation.destroy!
    redirect_to quotations_url, notice: 'Quotation was successfully destroyed.', status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quotation
    @quotation = Quotation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def quotation_params
    params.require(:quotation).permit(:customer_id, :number, :status, :issue_at, :due_at,
                                      lines_attributes: %i[id lineable_type lineable_id description quantity unit_price total_price _destroy position])
  end
end
