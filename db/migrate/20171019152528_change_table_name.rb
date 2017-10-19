class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :landsmarks, :landmarks
  end
end
