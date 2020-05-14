class TasksController < ApplicationController
  def index
    sort_direction = params[:sort_direction] || :desc
    sort_type = params[:sort_type] || :updated_at
    @tasks = Task.order(important: :desc, sort_type => sort_direction)

    render json: @tasks
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = 'Task successfully created'
      render json: @task
    else
      flash[:notice] = 'Something went wrong!'
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:notice] = 'Task successfully updated'
      render json: @task
    else
      flash[:notice] = 'Something went wrong!'
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:notice] = 'Task successfully deleted'
      render json: @task
    else
      flash[:notice] = 'Something went wrong!'
    end
  end

  private

  def task_params
    params.require(:task).permit(:done, :todo, :important)
  end
end
