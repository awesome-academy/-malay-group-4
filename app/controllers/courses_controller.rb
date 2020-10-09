class CoursesController < ApplicationController

  def index
    @course = Course.page.order("created_at DESC")
  end

  def show
    @course = Course.find_by id: params[:id]
    return if @course

    flash[:danger] = "Course not found!"
    redirect_to root_path
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params

    if @course.save
      flash[:success] = "Course successfully created"
      redirect_to root_url
    else
      flash[:danger] = "Course not created"
      render :new
    end
  end

  def edit
    @course = Course.find_by id: params[:id]
    if @course.edit course_params
      flash.now[:success] = "Course found"
      render :edit
    else
      flash[:danger] = "Course not found"
      redirect_to root_url
    end
  end

  def update
    @course = Course.find_by id: params[:id]
    if @course.update course_params
      flash.now[:success] = "Course updated"
      redirect_to @course
    else
      flash[:danger] = "Course not updated"
      render :edit
    end
  end

  def destroy
    @course = Course.find_by id: params[:id].destroy
    flash[:success] = "Course deleted"
    redirect_to root_url
  end

private

  def course_params
    params.require(:course).permit :title, :description, :credits, :user_id
  end
end
