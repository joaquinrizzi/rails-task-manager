class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(tasks_params)
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    # @task = Task.find(params[:id])
    @task.update(tasks_params)
    redirect_to task_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
