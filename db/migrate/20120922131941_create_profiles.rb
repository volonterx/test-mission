class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to  :user
      t.string      :country
      t.date        :dob # date of birth
      t.timestamps
    end
  end
end
