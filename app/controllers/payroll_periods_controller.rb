class PayrollPeriodsController < ApplicationController
  before_action :set_payroll_period, only: %i[ show edit update destroy ]

  # GET /payroll_periods or /payroll_periods.json
  def index
    @payroll_periods = PayrollPeriod.all
  end

  # GET /payroll_periods/1 or /payroll_periods/1.json
  def show
  end

  # GET /payroll_periods/new
  def new
    @payroll_period = PayrollPeriod.new
  end

  # GET /payroll_periods/1/edit
  def edit
  end

  # POST /payroll_periods or /payroll_periods.json
  def create
    @payroll_period = PayrollPeriod.new(payroll_period_params)

    respond_to do |format|
      if @payroll_period.save
        format.html { redirect_to payroll_period_url(@payroll_period), notice: "Payroll period was successfully created." }
        format.json { render :show, status: :created, location: @payroll_period }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payroll_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payroll_periods/1 or /payroll_periods/1.json
  def update
    respond_to do |format|
      if @payroll_period.update(payroll_period_params)
        format.html { redirect_to payroll_period_url(@payroll_period), notice: "Payroll period was successfully updated." }
        format.json { render :show, status: :ok, location: @payroll_period }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payroll_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payroll_periods/1 or /payroll_periods/1.json
  def destroy
    @payroll_period.destroy

    respond_to do |format|
      format.html { redirect_to payroll_periods_url, notice: "Payroll period was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payroll_period
      @payroll_period = PayrollPeriod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payroll_period_params
      params.require(:payroll_period).permit(:start_date, :end_date)
    end
end
