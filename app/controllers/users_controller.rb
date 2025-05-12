class UsersController < ApplicationController
  def follow
    user = User.find(params[:id])
    current_user.followings << user unless current_user.followings.include?(user)
    head :no_content
  end

  def unfollow
    user = User.find(params[:id])
    current_user.followings.delete(user)
    head :no_content
  end

  def followings_sleep_records
    records = SleepRecord
      .where(user_id: current_user.followings.ids)
      .where("slept_at >= ?", 1.week.ago)
      .includes(:user)
      .sort_by { |r| -(r.duration || 0) }

    render json: records.map { |r| {
      user_id: r.user_id,
      slept_at: r.slept_at,
      woke_up_at: r.woke_up_at,
      duration: r.duration
    }}
  end

  private

  def current_user
    User.first
  end
end
