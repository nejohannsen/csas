class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)
    @player.status_approver = current_user
    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render action: 'show', status: :created, location: @player }
      else
        format.html { render action: 'new' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end

  def accept
    @player = Player.find(params[:id])
    authorize! :update, @player
    @player.activate(:active, current_user)
    if @player.save
      redirect_to @player
    else
      flash[:alert] = "Updable to approve this request"
      render 'show'
    end
  end

  def reject
    @player = Player.find(params[:id])
    authorize! :update, @player
    @player.deny(:denied, current_user)
    if @player.save
      redirect_to @player
    else
      flash[:alert] = "Updable to reject this request"
      render 'show'
    end
  end

  def remove
    @player = Player.find(params[:id])
    authorize! :update, @player
    @player.remove(:removed, current_user)
    if @player.save
      redirect_to @player
    else
      render 'show'
    end
  end

  def propose
    @player = Player.find(params[:id])
    authorize! :update, @player
    @player.request(:pending, current_user)
    if @player.save
      redirect_to @player
    else
      flash[:alert] = "Updable to reject this request"
      render 'show'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:campaign_id, :user_id, :status, :status_approved_by)
    end
end