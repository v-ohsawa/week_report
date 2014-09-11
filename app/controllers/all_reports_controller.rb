class AllReportsController < ApplicationController

def index
	if signed_in?
		@all_reports = WeekReport.all
		@start_day = Date.today.beginning_of_week
		@week = @start_day.strftime("%W")
		@year = @start_day.strftime("%Y")
		@end_day = @start_day.end_of_week - 2
		session[:start_day] = @start_day
		if (2..8).include?(@start_day.end_of_month.strftime('%d').to_i - @start_day.strftime('%d').to_i) then
			flash.now[:info] = "今週は月報です！"
		end
	else
		redirect_to controller:'sessions', action:'new'
	end
end

#月報検索
def search_month
	@year = params[:item][:month][0..3]
	@month = params[:item][:month][5..6]
	if (1..2).include?(Date.new(@year.to_i,@month.to_i,1).end_of_month.strftime('%d').to_i) then
		@week = (Date.new(@year.to_i,@month.to_i,1).end_of_month - 1.week).strftime('%W')
	else
		@week = Date.new(@year.to_i,@month.to_i,1).end_of_month.strftime('%W')
	end
	@project = params[:item][:project_id]
	@user = params[:item][:user_id]
	if @project.blank?
		if @user.blank?
			@all_reports = WeekReport.where(["week_num = ? and year_num = ?", @week, @year])
		else
			@all_reports = WeekReport.where(["week_num = ? and year_num = ? and user_id = ?", @week, @year, @user])
		end
	else
		if @user.blank?
			@all_reports = WeekReport.where(["week_num = ? and year_num = ? and project_id = ?", @week, @year, @project])
		else
			@all_reports = WeekReport.where(["week_num = ? and year_num = ? and project_id = ? and user_id = ?", @week, @year, @project, @user])
		end
	end

	diff = 8 - Date.new(@year.to_i, 1, 1).strftime('%w').to_i
	case diff
	when 8
		@first_monday = Date.new(@year.to_i, 1, 2)
	when 7
		@first_monday = Date.new(@year.to_i, 1, 1)
	else
		@first_monday = Date.new(@year.to_i, 1, 1 + diff)
	end
	@start_day = @first_monday + 7 * (@week.to_i - 1)
	@end_day = @start_day.end_of_week - 2
	if (2..8).include?(@start_day.end_of_month.strftime('%d').to_i - @start_day.strftime('%d').to_i) then
		flash.now[:info] = "今週は月報です！"
	end
	render 'index'
end

#週報検索
def search_week
	@year = params[:item][:week][0..3]
	@week = params[:item][:week][6..7]
	@project = params[:item][:project_id]
	@user = params[:item][:user_id]
	if @project.blank?
		if @user.blank?
			@all_reports = WeekReport.where(["week_num = ? and year_num = ?", @week, @year])
		else
			@all_reports = WeekReport.where(["week_num = ? and year_num = ? and user_id = ?", @week, @year, @user])
		end
	else
		if @user.blank?
			@all_reports = WeekReport.where(["week_num = ? and year_num = ? and project_id = ?", @week, @year, @project])
		else
			@all_reports = WeekReport.where(["week_num = ? and year_num = ? and project_id = ? and user_id = ?", @week, @year, @project, @user])
		end
	end

	diff = 8 - Date.new(@year.to_i, 1, 1).strftime('%w').to_i
	case diff
	when 8
		@first_monday = Date.new(@year.to_i, 1, 2)
	when 7
		@first_monday = Date.new(@year.to_i, 1, 1)
	else
		@first_monday = Date.new(@year.to_i, 1, 1 + diff)
	end
	@start_day = @first_monday + 7 * (@week.to_i - 1)
	@end_day = @start_day.end_of_week - 2
	if (2..8).include?(@start_day.end_of_month.strftime('%d').to_i - @start_day.strftime('%d').to_i) then
		flash.now[:info] = "今週は月報です！"
	end
	render 'index'
end

end
