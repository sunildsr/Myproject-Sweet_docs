class ReportsController < ApplicationController


 def show_display_options
    @dates_with_readings = Reading.available_dates
    @months_with_readings = Reading.available_months
  end

  def results
    @report_type = params[:report_type]
    @date = Reading.format_date(params[:date])
    @month = params[:month]
    if @report_type == ["daily"]
      readings = Reading.for_day(@date)
	  @data = report_data(readings)
    elsif @report_type == ["month-to-date"]
	  from_date,to_date = @date.beginning_of_month, @date.end_of_day
      readings = Reading.get_readings_data(from_date, to_date)
	  @data = report_data(readings)
    elsif @report_type == ["monthly"]
	   from_date,to_date = @date.beginning_of_month, @date.end_of_month
        readings = Reading.get_readings_data(from_date, to_date)
	    @data = report_data(readings)
    end
  end
  
  private
   def  report_data(readings)
    glucose_readings = readings.pluck(:glucose_reading)
	sum_of_readings = glucose_readings.inject(0){|sum,x| sum + x }
    average = (sum_of_readings/glucose_readings.size.to_f).round(1)
    {:minimum => glucose_readings.min, :maximum => glucose_readings.max, :average => average}
  end
  
  
end
