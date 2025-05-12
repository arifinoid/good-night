class SleepRecordsController < ApplicationController
  def create
    record = current_user.sleep_records.create!(sleep_record_params)
    render json: record, status: :created
  end

  def index
    records = current_user.sleep_records.order(slept_at: :desc)
    render json: records
  end

  private

  def sleep_record_params
    params.require(:sleep_record).permit(:slept_at, :woke_up_at)
  end

  def current_user
    User.first
  end
end
