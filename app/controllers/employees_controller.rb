class EmployeesController < ApplicationController
  before_action :is_store?
  before_action :get_store
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = @store.employees
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = @store.employees.build
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = @store.employees.build(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to [ @store, @employee ], notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: store_employees_url(@employee).errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to store_employees_url(@store), notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to store_employees_url(@store), notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def get_store
    @store = Store.find(params[:store_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = @store.employees.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :surname, :phone_num, :email, :position, :work_time, :store_id)
    end
end
