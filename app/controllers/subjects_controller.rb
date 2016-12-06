class SubjectsController < ApplicationController

  layout 'admin'

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destroyed"
    redirect_to subjects_path
  end

  def new
    @subject = Subject.new(:name => 'Default')
    @subject_count = Subject.count + 1
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count + 1
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfully"
      redirect_to(subject_path(@subject))
    else
      # if it fails, it will get the current @subject and get all filled information again et psot populated again
      @subject_count = Subject.count + 1
      render('edit')
    end
  end

  def create
    # Initiate our new object to save
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "Subject Created Successfully"
      redirect_to subjects_path
    else
      # if it fails, it will get the current @subject and get all filled information again et psot populated again
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
