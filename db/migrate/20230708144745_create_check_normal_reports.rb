class CreateCheckNormalReports < ActiveRecord::Migration[6.0]
  def change
    create_table :check_normal_reports do |t|
      t.references :user,               null: false, foreign_key: true
      t.references :normal_report,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
