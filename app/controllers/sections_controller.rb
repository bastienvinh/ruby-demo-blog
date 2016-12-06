class SectionsController < ApplicationController

  layout 'admin'

  before_action :find_page

  def index
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:page_id => @page.id)
    @section_count = Section.count + 1
    @pages = Page.all
  end

  def create
    @section = Section.new(section_params)
    @section.page_id = params[:page_id].to_i
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(sections_path(:page_id => @page.id))
    else
      @section_count = Section.count + 1
      @pages = Page.all
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count + 1
    @pages = Page.all
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(section_path(@section, :page_id => @page.id))
    else
      @section_count = Section.count + 1
      @pages = Page.all
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section destroyed successfully."
    redirect_to(sections_path(:page_id => @page.id))
  end

  private

  def section_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content)
  end

  def find_page
    @page = Page.find(params[:page_id])
    # @page = Page.first
  end

end
