class Users::PersonalcardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @personalcards = Array.new
    @card_ownerships = current_user.card_ownerships
    @card_ownerships.each do |card_ownership|
      @card = Card.find(card_ownership.card_id)
      @personalcards.push(@card)
    end
    return @personalcards
  end
  
  def show
    @personalcards = Array.new
	@user = User.find_by(username: params[:username])
    @card_ownerships = @user.card_ownerships
    @card_ownerships.each do |card_ownership|
	  if !card_ownership.private
        @card = Card.find(card_ownership.card_id)
        @personalcards.push(@card)
	  end
    end
    return @personalcards
  end
  
  def new
  end
  
  def edit
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
end