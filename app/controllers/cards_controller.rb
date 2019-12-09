class CardsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def index
    @cards = Card.search(params[:collection_filter], params[:set_filter], params[:search])
  end
  
  def show

    

    @card = Card.find(params[:id])
  end
  
  def new
    @card = Card.new
  end
  
  def edit
    @card = Card.find(params[:id])
  end
  
  def create
    @card = Card.new(card_params)
	
	if @card.save
    flash[:request] = "Your card will appear upon admin approval."
	  redirect_to cards_path
	else
	  render 'new'
	end
  end
  
  def update
    @card = Card.find(params[:id])
 
    if @card.update(card_params)
      redirect_to @card
    else
      render 'edit'
	end
  end
  
  def admin
    @cards = Card.search(params[:collection_filter], params[:set_filter], params[:search])
  end
  
  def approve
    if current_user.admin
      session[:return_to] ||= request.referer
      @card = Card.find(params[:id])
      @card.update_attribute(:approved, true)
      redirect_to session.delete(:return_to)
    else
      flash[:notice] = "Sorry, you don't have permission to do that."
      redirect_to cards_path
    end
  end
      
  def destroy
    session[:return_to] ||= request.referer
    @card = Card.find(params[:id])
    @card.destroy
	
    prev_loc = session.delete(:return_to)
    if prev_loc.split('/').last.match?(/\A-?\d+\Z/)
      redirect_to cards_admin_path
    else
      redirect_to prev_loc
    end
  end
  
  private
    def card_params
      params.require(:card).permit(:title, :text, :collection, :set, :image, :imageurl, :filter, :search)
	  end
end