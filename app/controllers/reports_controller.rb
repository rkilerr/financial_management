class ReportsController < ApplicationController
  def index
  end

  def report_by_category
    @operations = Operation.all.select {|item| item.category_id == params[:category_type].to_i}
  end

  def report_by_dates
    @operations = Operation.where("created_at BETWEEN ? AND ?", params[:start_date], params[:end_date])
  end
end
