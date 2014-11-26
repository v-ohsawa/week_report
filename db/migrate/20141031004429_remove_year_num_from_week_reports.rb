class RemoveYearNumFromWeekReports < ActiveRecord::Migration
  def change
    remove_column :week_reports, :year_num, :string
  end
end
