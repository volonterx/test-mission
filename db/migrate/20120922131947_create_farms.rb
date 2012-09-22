class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.belongs_to  :user
      t.string      :title
      t.timestamps
    end
  end
end
