class CreateNormalReports < ActiveRecord::Migration[6.0]
  def change
    create_table :normal_reports do |t|
      t.integer    :location_id,        null: false
      t.integer    :number_of_times_id, null: false
      t.text       :point,              null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
