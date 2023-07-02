class CreateSpecialReports < ActiveRecord::Migration[6.0]
  def change
    create_table :special_reports do |t|
      t.integer    :location_id,        null: false
      t.integer    :category_id,        null: false
      t.text       :point,              null: false
      t.text       :comment
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
