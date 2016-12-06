class DemoController < ApplicationController
  layout 'application'

  def index
     @array = [1, 2, 3, 4, 5]
     render('index')
  end

  def hello
    @id = params['id']
    @page = params[:page]
    render('hello')
  end

  def other_hello
    redirect_to(:action => 'hello')
  end

  def lynda
    redirect_to('https://www.lynda.com')
  end

  def escape_output
    # nothing but just existing
  end

end
