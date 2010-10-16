class TasksController < ApplicationController
    def new
        @task = Day.find(params[:day_id]).tasks.new
    end

    def show
        @task = Task.find(params[:id])
    end

    def create
        day = Day.find( params[:day_id] )
        day.tasks.create( params[:task] )
        redirect_to day
    end
end
