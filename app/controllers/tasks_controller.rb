class TasksController < ApplicationController
  def index
    sort_direction = params[:sort_direction] || :desc
    sort_type = params[:sort_type] || :created_at
    page_number = params[:page] || 0
    @tasks = Task.order(important: :desc, sort_type => sort_direction).page(page_number)
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)

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
