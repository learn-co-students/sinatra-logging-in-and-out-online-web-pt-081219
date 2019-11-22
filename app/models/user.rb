class User
  attr_accessor :username, :password, :balance

  def initialize(username, password, balance)
    @username = params[:username]
    @password = params[:password]
    @balance = params[:balance]
  end
end
