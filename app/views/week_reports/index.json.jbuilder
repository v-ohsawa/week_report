json.array!(@week_reports) do |week_report|
  json.extract! week_report, :id, :user_id, :project_id, :done, :understood, :next, :start_day
  json.url week_report_url(week_report, format: :json)
end
