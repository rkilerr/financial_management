class ReportsController < ApplicationController
  def index
    @categories = Category.all.map { |item| [item.name, item.id] }
  end

  def generate_report
    if report_by_dates?
      redirect_to reports_report_by_dates_path(start_date: params[:start_date], end_date: params[:end_date], transaction_type: params[:transaction_type], report: params[:report])
    end

    if report_by_category?
      redirect_to reports_report_by_category_path(transaction_type: params[:transaction_type])
    end
  end

  def report_by_category
    @categories = Category.joins(:operations).where(operations: {transaction_type: params[:transaction_type] }).group("categories.name").sum(:amount).to_a
    @names = @categories.map { |item| item[0] }
    @values = @categories.map { |item| item[1] }
  end

  def report_by_dates
    @operaitons = ""
    if (params[:report] == "По датам")
      @operations = Operation
      .odate_filter(params[:start_date], params[:end_date])
      .order(odate: :asc)
      .map { |item| [item.odate.to_s, item.amount] }
    end

    if (params[:report] == "Графік")
      @operations = Operation
      .odate_filter(params[:start_date], params[:end_date])
      .transaction_type_filter(params[:transaction_type])
      .order(odate: :asc)
      .map { |item| [item.odate.to_s, item.amount] }
    end

    @dates = @operations.map {|item| item[0]}
    @amounts = @operations.map {|item| item[1]}
  end

  private
    def report_by_category?
      params[:report] == "Згенерувати"
    end

    def report_by_dates?
      params[:report] == "По датам" || params[:report] = "Графік"
    end
end
