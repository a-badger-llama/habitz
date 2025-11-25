class HabitLogsController < ApplicationController
  before_action :set_habit
  before_action :set_habit_log, only: [:destroy]

  def index
    @habit_logs = @habit.habit_logs.order(date: :desc)
  end

  def create
    @habit_log = @habit.habit_logs.new(habit_log_params)

    if @habit_log.save
      redirect_to habit_habit_logs_path(@habit), notice: "Habit log was successfully created."
    else
      redirect_to habit_habit_logs_path(@habit), alert: "Failed to create habit log."
    end
  end

  def destroy
    @habit_log.destroy
    redirect_to habit_habit_logs_path(@habit), notice: "Habit log was successfully destroyed."
  end

  private

  def set_habit
    @habit = Habit.find(params[:habit_id])
  end

  def set_habit_log
    @habit_log = @habit.habit_logs.find(params[:id])
  end

  def habit_log_params
    params.require(:habit_log).permit(:date)
  end
end
