class CardOwnershipsController < ApplicationController
  before_action :authenticate_user!
  
  def new
	@card = Card.find(params[:card_id])
	@card_ownership = CardOwnership.new	
  end

  def edit
	@card_ownership = CardOwnership.find(params[:id])
	@card = Card.find(@card_ownership.card_id)
  end
  
  def create
	@card = Card.find(params[:card_id])
	if (!current_user.card_ownerships.find_by(card_id: params[:card_id]))
		@card_ownership = CardOwnership.new(count: params[:count], user_id: current_user.id, card_id: params[:card_id], private: params[:private], sell: params[:sell])
		if (!@card_ownership.save)
			render 'new'
			return
		end
	end
	redirect_to @card
  end
  
  def update
	@card_ownership = current_user.card_ownerships.find(params[:id])
	@card = Card.find(@card_ownership.card_id)
	if (params[:card_ownership][:count]=='0')
		@card_ownership.destroy
    elsif (!@card_ownership.update(params.require(:card_ownership).permit(:count, :private, :sell)))
		render 'edit'
		return
	end
	redirect_to @card
  end
  

end
