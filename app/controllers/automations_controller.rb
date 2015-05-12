class AutomationsController < ApplicationController
  before_action :set_automation, only: [:show, :edit, :update, :destroy, :sync]
  before_action :confirm_logged_in, only: :sync


  # GET /automations
  # GET /automations.json
  def index
    @automations = Automation.all
  end

  # GET /automations/1
  # GET /automations/1.json
  def show
  end

  # GET /automations/new
  def new
    @automation = Automation.new
  end

  # GET /automations/1/edit
  def edit
  end

  # POST /automations
  # POST /automations.json
  def create
    @automation = Automation.new(automation_params)

    respond_to do |format|
      if @automation.save
        format.html { redirect_to @automation, notice: 'Automation was successfully created.' }
        format.json { render :show, status: :created, location: @automation }
      else
        format.html { render :new }
        format.json { render json: @automation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /automations/1
  # PATCH/PUT /automations/1.json
  def update
    respond_to do |format|
      if @automation.update(automation_params)
        format.html { redirect_to @automation, notice: 'Automation was successfully updated.' }
        format.json { render :show, status: :ok, location: @automation }
      else
        format.html { render :edit }
        format.json { render json: @automation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /automations/1
  # DELETE /automations/1.json
  def destroy
    @automation.destroy
    respond_to do |format|
      format.html { redirect_to automations_url, notice: 'Automation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /automations/1/sync
  def sync
    jsonData = @automation.json
    client.automations.create(jsonData)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_automation
    @automation = Automation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def automation_params
    params.require(:automation).permit(:name, :tags, :description, :json, :package_id)
  end
end
