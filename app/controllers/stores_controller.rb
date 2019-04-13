class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /stores/1/warehouses
  def warehouses
    @store = Store.find(params[:id])
    @warehouses = @store.warehouses
  end

  # POST /students/1/course_add?course_id=2
  def warehouse_add
    @store = Store.find(params[:id])
    @warehouse = Warehouse.find(params[:warehouse])
    unless @store.assigned_in?(@warehouse)
      @store.warehouses << @warehouse
      flash[:notice] = 'Store was successfully assigned'
    else
      flash[:error] = 'Store was already assigned'
    end
    redirect_to action: "warehouses", id: @store
  end

  # POST /stores/1/warehouse_remove?warehouses[]=
  def warehouse_remove
    @store = Store.find(params[:id])
    warehouse_ids = params[:warehouses]
    if warehouse_ids.any?
      warehouse_ids.each do |warehouse_id|
        warehouse = Warehouse.find(warehouse_id)
        if @store.assigned_in?(warehouse)
          logger.info "Removing student from course #{warehouse.id}"
          @store.courses.delete(warehouse)
          flash[:notice] = 'Course was successfully deleted'
        end
      end
    end
    redirect_to action: "warehouses", id: @store
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :address, :phone_num, :email, :open_hours)
    end
end
