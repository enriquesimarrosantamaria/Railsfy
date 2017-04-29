class AddUsernameToUsers < ActiveRecord::Migration[5.0]
  def change #Anything inside this method  is translated to SQL,and modified the database (currently,SQLite)
    add_column :users, :username, :string #Add a new column to table Users, called username and type String
    add_index :users, :username, unique: true #first,index usernames and then  ensure that usernames are always unique
  end
end
