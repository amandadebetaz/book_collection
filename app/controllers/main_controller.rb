class MainController < ApplicationController
  def index
  end

  def about
    # render('about')
    @created_by = "Amanda"
    @id = params[:id]
    @page = params[:page]
  end

  def hello
    redirect_to(action: 'index')
  end
end
