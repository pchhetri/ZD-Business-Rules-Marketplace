class CredentialsController < ApplicationController
  before_action :set_credential, only: [:show, :edit, :update, :destroy]

  # GET /credentials
  # GET /credentials.json
  def index
    # @credentials = Credential.all
  end

  # GET /credentials/1
  # GET /credentials/1.json
  def show
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:token].present? && params[:subdomain].present?
      session[:subdomain] =params[:subdomain]
      session[:username ]= params[:username]
      session[:token] = params[:token]
      flash[:notice] = "Thank you for entering your Zendesk Credentials!"
      redirect_to root_url
    else
      flash[:notice] = "Please fill out all of the fields"
      redirect_to action: 'login'
    end
  end

  def logout
    # mark user as logged out
    session[:subdomain] = nil
    session[:username] = nil
    session[:token] = nil
    flash[:notice] = "Credentials Cleared"
    redirect_to(:action => "login")
  end
  # GET /credentials/1/edit
  def edit
  end

  # POST /credentials
  # POST /credentials.json
  def create
    # @credential = Credential.new(credential_params)

    respond_to do |format|
      if @credential.save
        format.html { redirect_to @credential, notice: 'Credential was successfully created.' }
        format.json { render :show, status: :created, location: @credential }
      else
        format.html { render :new }
        format.json { render json: @credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credentials/1
  # PATCH/PUT /credentials/1.json
  def update
    respond_to do |format|
      if @credential.update(credential_params)
        format.html { redirect_to @credential, notice: 'Credential was successfully updated.' }
        format.json { render :show, status: :ok, location: @credential }
      else
        format.html { render :edit }
        format.json { render json: @credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credentials/1
  # DELETE /credentials/1.json
  def destroy
    # @credential.destroy
    # respond_to do |format|
    #   format.html { redirect_to credentials_url, notice: 'Credential was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credential
      # @credential = Credential.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credential_params
      params[:credential]
    end
end
