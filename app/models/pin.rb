class Pin < ActiveRecord::Base

  #Connects pins to user accounts.
  belongs_to :user

end
