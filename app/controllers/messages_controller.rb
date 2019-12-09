class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index

    if current_user
      #id = current_user.id
      #@messages = Message.where(["sender = ? or receiver = ?", id, id])
      #@messages = current_user.messages
      @contacts = current_user.contacts

    end

    #@messages = Message.all
  end

  def check
    result = 0
    if current_user
      latest_messages = current_user.contacts;
      latest_messages.each do |key, value|
        if value.receiver == current_user.id and !value.seen
          result = 1 
        end
      end
    end
    render json: result.to_json
  end

  def chat

    username = params['username']
    if(User.find_by(username: username))
      m = current_user.chat_with(username)

      respond_to do |format|
        format.js { render json: m.to_json }
        format.html
      end
    else
      e = 1
      render json: e.to_json 
    end

  end

  def new_contacts
    c = current_user.contacts
    respond_to do |format|
      format.js { render json: c.to_json }
      format.html
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    username = params['id']
    puts username
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    puts params['msg']
    receiver = User.find_by(username: params['receiver']).id

    @message = Message.new(seen: 0, sender: current_user.id, receiver: receiver, contents: params[:msg], sent_at: Time.now)
    @message.save!

    #Load the messages
    m = current_user.chat_with(params['receiver'])
    respond_to do |format|
      format.js { render json: m.to_json }
      format.html
    end

    # @message = Message.new(message_params)

    # respond_to do |format|
    #   if @message.save
    #     format.html { redirect_to @message, notice: 'Message was successfully created.' }
    #     format.json { render :show, status: :created, location: @message }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @message.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:sender, :receiver, :contents, :sent_at, :seen)
    end
end
