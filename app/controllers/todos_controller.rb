# frozen_string_literal: true

class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todos = Todo.new
  end

  def create
    @todos = Todo.new(todo_params)
    @todos.save
    redirect_to todos_path
  end

  def show
    @todos = Todo.find(params[:id])
  end

  def edit
    @todos = Todo.find(params[:id])
  end

  def update
    @todos = Todo.find(params[:id])
    @todos.update(todo_params)
    redirect_to todos_path
  end

  def destroy
    @todos = Todo.find(params[:id])
    @todos.destroy
    redirect_to todos_path
  end

  def complete
    @todos = Todo.find(params[:id])
    @todos.update(completed: true)
    redirect_to todos_path
  end

  def list
    @completed = Todo.where(completed: true)
    @incompleted = Todo.where(completed: false)

  end

  private

  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
