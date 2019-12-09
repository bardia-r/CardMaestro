class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :card_ownerships, :dependent => :delete_all
  has_many :cards, through: :card_ownerships

  #Validations
  validates :username, uniqueness: true, length: {in: 4..16}, presence: true
  validates :fname, length: {in: 1..40}, presence: true
  validates :lname, length: {in: 1..40}, presence: true

  def messages
    Message.where(["sender = ? or receiver = ?", self.id, self.id])
  end

  def contacts
    contacts = Hash.new
    messages = Message.where(["sender = ? or receiver = ?", self.id, self.id])
    messages.each do |m|
      contact = nil
      if m.sender==self.id
        contact = User.find(m.receiver)
      else
        contact = User.find(m.sender)
      end
      if contacts.has_key? contact.username
        if contacts[contact.username].sent_at < m.sent_at
          contacts[contact.username] = m
        end
      else
        contacts[contact.username] = m
      end
    end
    return contacts
  end

  def chat_with(username)
    other_id = User.find_by(username: username).id
    messages = Message.where(["(sender = ? and receiver = ?) or (sender = ? and receiver = ?)", self.id, other_id, other_id, self.id ])
    msgs = Array.new
    messages.each do |m|
      msg = Hash.new
      if m.sender==self.id
        msg['user'] = m.receiver
        msg['sent'] = 1
      else
        #set seen to true
        temp_m = m
        temp_m.seen = true
        temp_m.save!
        msg['user'] = m.sender
        msg['sent'] = 0
      end
      msg['content'] = m.contents
      msg['time'] = m.sent_at.strftime("%T | %b %d")

      #Add to array
      msgs.push(msg)
    end
    return msgs
  end

end
