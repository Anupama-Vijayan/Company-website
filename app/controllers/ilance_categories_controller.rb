class IlanceCategoriesController < ApplicationController
  before_action :set_ilance_category, only: [:show, :edit, :update, :destroy]

  # GET /ilance_categories
  # GET /ilance_categories.json
  def index
    @ilance_categories = IlanceCategory.all
  end

  # GET /ilance_categories/1
  # GET /ilance_categories/1.json
  def show
  end

  # GET /ilance_categories/new
  def new
    @ilance_category = IlanceCategory.new
  end

  # GET /ilance_categories/1/edit
  def edit
  end

  # POST /ilance_categories
  # POST /ilance_categories.json
  def create
    @ilance_category = IlanceCategory.new(ilance_category_params)

    respond_to do |format|
      if @ilance_category.save
        format.html { redirect_to @ilance_category, notice: 'Ilance category was successfully created.' }
        format.json { render :show, status: :created, location: @ilance_category }
      else
        format.html { render :new }
        format.json { render json: @ilance_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ilance_categories/1
  # PATCH/PUT /ilance_categories/1.json
  def update
    respond_to do |format|
      if @ilance_category.update(ilance_category_params)
        format.html { redirect_to @ilance_category, notice: 'Ilance category was successfully updated.' }
        format.json { render :show, status: :ok, location: @ilance_category }
      else
        format.html { render :edit }
        format.json { render json: @ilance_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ilance_categories/1
  # DELETE /ilance_categories/1.json
  def destroy
    @ilance_category.destroy
    respond_to do |format|
      format.html { redirect_to ilance_categories_url, notice: 'Ilance category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ilance_category
      @ilance_category = IlanceCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ilance_category_params
      params.fetch(:ilance_category, {})
    end
end
