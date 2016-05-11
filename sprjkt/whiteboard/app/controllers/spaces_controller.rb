class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /spaces
  # GET /spaces.json
  def index
    @spaces = Space.all
  end

  # GET /spaces/1
  # GET /spaces/1.json
  def show
	@space = Space.find(params[:id])

    @layer = @space.layers.all
	@layer_new = Layer.new

	@d1 = @space.clickX
	@d2 = @space.clickY
	@d3 = @space.clickDrag

	return @d1, @d2, @d3

  end

  # GET /spaces/new
  def new
    @space = Space.new
  end

  # PATCH/PUT /spaces/1
  # PATCH/PUT /spaces/1.json
  def clear
	@space = Space.find(params[:space_id])
	@space.clickX = []
	@space.clickY = []
	@space.clickDrag = []
	@space.save

    respond_to do |format|
      if @space.update(space_params)
        format.html { redirect_to @space }
        format.json { render :show, status: :ok, location: @space }
      else
        format.html { render :edit }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end

  end

  # GET /spaces/1
  # GET /spaces/1.json
  def load
	@space = Space.find(params[:space_id])
	@d1 = @space.clickX
	@d2 = @space.clickY
	@d3 = @space.clickDrag

	raise @d1.inspect

	return @d1, @d2, @d3

    respond_to do |format|
        format.html { redirect_to @space, notice: 'Space was successfully loaded.' }
        format.json { render :show, status: :ok, location: @space }
    end

  end




  # GET /spaces/1
  # GET /spaces/1.json
  def edit
	
  end

  # POST /spaces
  # POST /spaces.json
  def create
    @space = Space.new(space_params)
    @space.user = current_user

    respond_to do |format|
      if @space.save
        format.html { redirect_to @space }
        format.json { render :show, status: :created, location: @space }
      else
        format.html { render :new }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spaces/1
  # PATCH/PUT /spaces/1.json
  def update

	@varx = params[:x]
	@vary = params[:y]
	@vard = params[:dragging]
	@space = Space.find(params[:id])

	@space.clickX.push(@varx)
	@space.clickY.push(@vary)
	@space.clickDrag.push(@vard)
	@space.save

    respond_to do |format|
      if @space.update(space_params)
        format.html { redirect_to @space }
        format.json { render :show, status: :ok, location: @space }
      else
        format.html { render :edit }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spaces/1
  # DELETE /spaces/1.json
  def destroy
    @space.destroy
    respond_to do |format|
      format.html { redirect_to spaces_url, notice: 'Space was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space
      @space = Space.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_params
      params.require(:space).permit(:user_id, :spacename, :clickX, :clickY, :clickDrag)
    end
end
