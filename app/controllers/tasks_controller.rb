class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @featured = @tasks.select { |task| task.priority == 1 && task.done != true}
  end

  def all
    @tasks = Task.order(:priority)
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)

    if task.save #it worked! will be true if worked
      redirect_to all_tasks_path
    else
      render :new #this will show the form again
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])

    if !@task.nil?
      if @task.update(task_params)
        redirect_to task_path(@task.id)
      else
        render :edit
      end
    end
  end

  def completed
    @task = Task.find_by(id: params[:id])
    @task.done = true
    @task.priority = 4
    @task.complete_date = DateTime.now
    @task.save
    redirect_to task_path(@task.id)
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    if @task
      @task.destroy
    end
    redirect_to all_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :location, :priority, :complete_date, :done)
  end
end
