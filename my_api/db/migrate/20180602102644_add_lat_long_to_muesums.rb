class AddLatLongToMuesums < ActiveRecord::Migration[5.2]
  def change
    add_column :museums, :lat, :float
    add_column :museums, :long, :float
  end
end
