class StudentsController < ApplicationController

  def index
    if params[:name].present?
      name = params[:name].titlecase
      students = []
      students.push(Student.where("first_name = ?", params[:name]))
      students.push(Student.where("last_name = ?", params[:name]))
    else
      students = Student.all
    end

    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
