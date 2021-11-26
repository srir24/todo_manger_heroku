# todos_controller.rb
class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    #render plain: "Hello, this is /todos!"
    #render plain: Todo.all.to_a
    #render plain: Todo.all.map {|todo| todo.to_pleasant}.join("\n")
    #render plain: Todo.order(:due_date).map {|todo| todo.to_pleasant}.join("\n")
    render "index"
  end
  def show
    id = params[:id].to_i
    #render plain: "The id enter was #{id}"
    #todo= Todo.find(id)
    render "todo"
    #render plain: todo.to_pleasant
  end
  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    #render plain: "You are in create #{todo_text} and #{due_date}"
    todo=Todo.create!(todo_text: todo_text, due_date: due_date, completed:false)
    render_txt="Id is  #{todo.id}"
    render plain: render_txt
  end
  def update
    id = params[:id].to_i
    completed = params[:completed]
    todo= Todo.find(id)
    todo.completed=completed
    todo.save!
    render plain: "Updated completed status to #{completed}"
  end
end
