class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path
    else
      redirect_to tasks_path, notice: 'Something went wrong!'
    end
  end

  def edit
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path
    else
      redirect_to tasks_path, notice: 'Something went wrong'
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      redirect_to tasks_path
    else
      redirect_to tasks_path, notice: 'Something went wrong'
    end
  end

  private

  def task_params
    params.require(:task).permit(:done, :todo, :important)
  end
end
