class CreateIllegalReports < ActiveRecord::Migration[6.0]
  def change
    create_table :illegal_reports do |t|
      t.integer    :location_id,        null: false
      t.text       :point,              null: false
      t.text       :content,            null: false
      t.text       :comment
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
