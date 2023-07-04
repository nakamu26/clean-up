class CreateIllegalReports < ActiveRecord::Migration[6.0]
  def change
    create_table :illegal_reports do |t|

      t.timestamps
    end
  end
end
