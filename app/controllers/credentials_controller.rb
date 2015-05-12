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
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      # mark user as logged in
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
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
