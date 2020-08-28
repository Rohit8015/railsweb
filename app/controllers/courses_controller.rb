class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(params.require(:course).permit(:name))
    if @course.valid?
      redirect_to courses_path
    else
      flash[:errors] = @course.errors.full_messages
      redirect_to new_courses_path
    end
  end

  def show
    @course = Course.find(params[:id])
  end
  
 

  def update
    @course = Course.find(params[:id])
    @course.update(params.require(:course).permit(:name))
    redirect_to course_path(@course)
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end
end
