class WeekReportsController < ApplicationController
before_action :set_week_report, only: [:show, :edit, :update, :destroy]

#indexコントローラ
def index
	if signed_in?
		@start_day = Date.today.beginning_of_week
		@week = @start_day.strftime("%W")
		@year = @start_day.strftime("%Y")
		@end_day = @start_day.end_of_week - 2
		@week_reports = WeekReport.where('user_id = ? AND week_num = ? AND year_num = ?', current_user.id, @week, @year)
		session[:start_day] = @start_day
		if (2..8).include?(@start_day.end_of_month.strftime('%d').to_i - @start_day.strftime('%d').to_i) then
			flash.now[:danger] = "今週は月報です！"
		end
	else
		redirect_to controller:'sessions', action:'new'
	end
end

#指定の週報を表示
def change_week
	if signed_in?
		@start_day = Date.strptime(params[:start], "%Y-%m-%d").beginning_of_week
		@week = @start_day.strftime("%W")
		@year = @start_day.strftime("%Y")
		@end_day = @start_day.end_of_week - 2
		@week_reports = WeekReport.where('user_id = ? AND week_num = ? AND year_num = ?', current_user.id, @week, @year)
		session[:start_day] = @start_day
		if (2..8).include?(@start_day.end_of_month.strftime('%d').to_i - @start_day.strftime('%d').to_i) then
			flash.now[:danger] = "今週は月報です！"
		end
		render 'index'
	else
		redirect_to controller:'sessions', action:'new'
	end
end

#単体表示画面
def show
end

#新規作成画面用
def new
  	@week_report = WeekReport.new
	@start_day = Date.strptime(session[:start_day], "%Y-%m-%d")
	@week = @start_day.strftime("%W")
	@year = @start_day.strftime("%Y")
	@end_day = @start_day.end_of_week - 2
end

# GET /week_reports/1/edit
def edit
	@start_day = Date.strptime(session[:start_day], "%Y-%m-%d")
	@week = @start_day.strftime("%W")
	@year = @start_day.strftime("%Y")
	@end_day = @start_day.end_of_week - 2
end

#新規作成
def create
	@week_report = WeekReport.new(week_report_params)
	@week_report.user_id = current_user.id
	if @week_report.save
		flash[:success] = "新しい項目が追加されました！"
	else
		flash[:danger] = "入力値が不正です！"
	end
	redirect_to controller:'week_reports', action:'change_week', start:session[:start_day]
end

#更新
def update
	if @week_report.update(week_report_params)
		flash[:success] = "正しく更新されました！"
	else
		flash[:danger] = "入力値が不正です！"
	end
	redirect_to controller:'week_reports', action:'change_week', start:session[:start_day]
end

#削除
def destroy
	@week_report.destroy
	flash[:success] = "正しく削除されました！"
	redirect_to controller:'week_reports', action:'change_week', start:session[:start_day]
end

  def all_index
	@week_reports = WeekReport.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_week_report
      @week_report = WeekReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def week_report_params
	    params.require(:week_report).permit(:user_id, :project_id, :done, :understood, :next, :year_num, :week_num, :start_day, :end_day)
    end
end
