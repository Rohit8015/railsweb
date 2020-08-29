class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.all
  end

  def new
    @enrollment= Enrollment.new
  end

  def show
    @enrollment = Enrollment.find(params[:id])
  end

  def create
    @enrollment= Enrollment.create(params.require(:enrollment).permit(:course_id, :student_id))
    redirect_to student_path(@enrollment.student)
  end

  def destroy
    @enrollment= Enrollment.find(params[:id])
    @student = @enrollment.student
    @enrollment.destroy
    redirect_to student_path(@student)
  end
end
