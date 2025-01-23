# frozen_string_literal: true

class Admin::WeeklyInfosController < Admin::BaseController
  helper_method :weekly_infos_collection, :dates, :resource_weekly_info

  def index; end

  def new
    render layout: false
  end

  def edit
    render layout: false
  end

  def create
    if resource_weekly_info.save
      flash[:notice] = t('messages.create', resource_name: WeeklyInfo.model_name.human)
      redirect_to admin_weekly_infos_url
    else
      flash.now[:alert] = I18n.t('messages.errors')
      render :new
    end
  end

  def update
    if resource_weekly_info.update_attributes(params[:weekly_info])
      flash[:notice] = t('messages.updated', resource_name: WeeklyInfo.model_name.human)
      redirect_to admin_weekly_infos_url
    else
      flash.now[:alert] = I18n.t('messages.errors')
      render :edit
    end
  end

  private

  def weekly_infos_collection
    @weekly_infos_collection ||= WeeklyInfo.where(
      'start >= ? AND ending <=?', dates.first[:start], dates.last[:end]
    ).index_by { |weekly_info| weekly_info.start.cweek }
  end

  def dates
    return @dates if defined?(@dates)

    current_week_start = Date.today.beginning_of_week
    current_week_end = Date.today.end_of_week
    @dates = [
      { start: current_week_start, end: current_week_end },
      { start: current_week_end + 1.day, end: (current_week_end + 1.day).end_of_week }
    ]
  end

  def resource_weekly_info
    @resource_weekly_info ||= params[:id].present? ? WeeklyInfo.find(params[:id]) : WeeklyInfo.new(params[:weekly_info])
  end
end
