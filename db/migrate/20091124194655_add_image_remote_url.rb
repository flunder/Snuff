class AddImageRemoteUrl < ActiveRecord::Migration
  def self.up
     add_column :items, :image_remote_url, :string
   end

   def self.down
     remove_column :items, :image_remote_url
   end

end
