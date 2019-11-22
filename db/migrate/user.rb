class CreateUser < ActiveRecord::Base
  def change
    create_table :user do |u|
      u.string :username
      u.string :password
      u.integer :balance
    end
  end
end
