class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.done = 0

    if @task.save
      redirect_to tasks_path, notice: 'Complete'
    else
      redirect_to tasks_path, notice: 'Something went wrong!'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Complete'
    else
      redirect_to tasks_path, notice: 'Something went wrong'
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      redirect_to tasks_path, notice: 'Complete'
    else
      redirect_to tasks_path, notice: 'Something went wrong'
    end
  end

  private

  def task_params
    params.require(:task).permit(:done, :todo, :important)
  end
end
