class RemoveWeekNumFromWeekReports < ActiveRecord::Migration
  def change
    remove_column :week_reports, :week_num, :string
  end
end
