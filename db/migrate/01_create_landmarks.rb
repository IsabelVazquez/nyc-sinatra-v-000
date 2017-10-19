class CreateLandmarks < ActiveRecord::Migration
  create_table :landsmarks do |t|
    t.string :name
    t.integer :figure_id
    t.integer :year_completed
  end
end
