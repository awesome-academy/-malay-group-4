class CoursesController < ApplicationController

  def index
    @course = Course.page.order("created_at DESC")
  end

  def show
    @course = Course.find_by :id params[:id]
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params

    if @course.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit; end

  def update
    if @course.update course_params
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to_root_path
  end

  private

    def course_params
      params.require(:course).permit(:title, :description, :credits)
    end

    def find_course
      @course = Course.find_by :id params[:id]
      if @course.find_course course_params
        flash[:success] = "Course found"
      else
        flash[:danger] = "Course not found"
        redirect_to root_url
      end
    end
  end
