class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, only: %i[ show edit update destroy activate suspend reactivate ]

  # GET /cards or /cards.json
  def index
    @cards = Card.where("user_id = #{current_user.id} AND state != 'draft' AND state != 'pending'")
  end

  # GET /cards/1 or /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards or /cards.json
  def create
    params[:card][:user_id] = current_user.id
    params[:card][:requested_date] = Time.now
    params[:card][:state] = 'pending'
    @card = Card.new(card_params)
    # @card.update(card_number: Card.generate_card_number)
    respond_to do |format|
      if @card.save
        format.html { redirect_to cards_path, notice: "Your request have been created." }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        if @card.state == 'pending' && current_user && current_user.admin? && params[:pin] != '' && params[:activation_code] != ''
          action_activated
          return
        end
        format.html { redirect_to card_url(@card), notice: "Card was successfully updated." }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1 or /cards/1.json
  def destroy
    @card.destroy

    respond_to do |format|
      format.html { redirect_to cards_url, notice: "Card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def index_request_card
    @cards = Card.where(state: 'pending')
  end

  def action_activated
    @card.update(state: 'waiting', card_number: Card.generate_card_number, expired_date: Card.get_expired_date)
    redirect_to card_requests_path, notice: "Card has been activated for user #{@card.user.name}"
  end

  def activate
    if @card.activation_code != params[:activate_code]
      redirect_to @card, notice: "Incorrect Activation Code. Please try again"
    elsif @card.pin != params[:old_pin]
      redirect_to @card, notice: "Incorrect current PIN. Please try again"
    else
      @card.update(pin: params[:new_pin], state: 'active')
      redirect_to @card, notice: "Congratulations. Your card is activated!"
    end
  end

  def suspend
    @card.update(state: "suspended")
    current_user.reports.new(
      report_type: 'Cancelling Card',
      note: "Card number: #{@card.card_number}"
    ).save
    redirect_to @card, notice: "Your card is temporary cancelled!"
  end

  def reactivate
    @card.update(state: "active")
    current_user.reports.new(
      report_type: 'Re-activating Card',
      note: "Card number: #{@card.card_number}"
    ).save
    redirect_to @card, notice: "Your card is reactivated!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_params
      params.require(:card).permit(:user_id, :requested_date, :state, :pin, :activation_code, :name, :sid, :dob)
    end
end
