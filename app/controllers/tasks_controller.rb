class TasksController < ApplicationController
  def index
    @tasks = ['Fold laundry', 'Sweep porch', 'Take out trash']
  end

  def new
  end

  def edit
  end
end
