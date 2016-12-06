class PublicController < ApplicationController

  layout 'public'

  def index
    @subjects = Subject.all
  end

  def show
    @page = Page.visible.where(:permalink => params[:permalink]).first
    if @page.nil?
      redirect_to root_path
    else
      # display page content
    end
  end
end
