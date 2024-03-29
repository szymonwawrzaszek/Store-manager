class ItemsController < ApplicationController
  before_action :is_warehouse?
  before_action :get_warehouse
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = @warehouse.items
    #@items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = @warehouse.items.build
    #@item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = @warehouse.items.build(item_params)
    #@item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to [ @warehouse, @item ], notice: 'Item was successfully created.' }
        #format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: [@warehouse, @item] }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to [ @warehouse, @item ], notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: [@warehouse, @item] }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to (warehouse_items_path(@warehouse)), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_warehouse
      @warehouse = Warehouse.find(params[:warehouse_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = @warehouse.items.find(params[:id])
      #@item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:warehouse_id, :name, :price, :quantity, :photo)
    end
  end