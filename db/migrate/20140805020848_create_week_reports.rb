class CreateWeekReports < ActiveRecord::Migration
  def change
    create_table :week_reports do |t|
      t.integer :user_id
      t.integer :project_id
      t.text :done
      t.text :understood
      t.text :next
      t.string :year_num
      t.string :week_num
      t.string :start_day
      t.string :end_day

      t.timestamps
    end
  end
end
