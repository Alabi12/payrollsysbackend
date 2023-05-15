class PayrollEntriesController < ApplicationController
  before_action :set_payroll_entry, only: %i[ show edit update destroy ]

  # GET /payroll_entries or /payroll_entries.json
  def index
    @payroll_entries = PayrollEntry.all
  end

  # GET /payroll_entries/1 or /payroll_entries/1.json
  def show
  end

  # GET /payroll_entries/new
  def new
    @payroll_entry = PayrollEntry.new
  end

  # GET /payroll_entries/1/edit
  def edit
  end

  # POST /payroll_entries or /payroll_entries.json
  def create
    @payroll_entry = PayrollEntry.new(payroll_entry_params)

    respond_to do |format|
      if @payroll_entry.save
        format.html { redirect_to payroll_entry_url(@payroll_entry), notice: "Payroll entry was successfully created." }
        format.json { render :show, status: :created, location: @payroll_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payroll_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payroll_entries/1 or /payroll_entries/1.json
  def update
    respond_to do |format|
      if @payroll_entry.update(payroll_entry_params)
        format.html { redirect_to payroll_entry_url(@payroll_entry), notice: "Payroll entry was successfully updated." }
        format.json { render :show, status: :ok, location: @payroll_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payroll_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payroll_entries/1 or /payroll_entries/1.json
  def destroy
    @payroll_entry.destroy

    respond_to do |format|
      format.html { redirect_to payroll_entries_url, notice: "Payroll entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payroll_entry
      @payroll_entry = PayrollEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payroll_entry_params
      params.require(:payroll_entry).permit(:payroll_period_id, :employee_id, :salary_id, :hours_worked, :vacation_hours, :sick_hours)
    end
end
