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
      flash[:notice] = "Task successfully created"
      redirect_to tasks_path
    else
      flash[:notice] = "Something went wrong!"
      redirect_to tasks_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:notice] = "Task successfully updated"
      redirect_to tasks_path
    else
      flash[:notice] = "Something went wrong!"
      redirect_to tasks_path
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:notice] = "Task successfully updated"
      redirect_to tasks_path
    else
      flash[:notice] = "Something went wrong!"
      redirect_to tasks_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:done, :todo, :important)
  end
end
