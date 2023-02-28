class WelcomeController < ApplicationController
  def index
    cookies[:curso] = 'Curso de ruby on Rails - Jackson Pires [COOKIE]'
    session[:curso] = 'Curso de ruby on Rails - Jackson Pires [SESSION]'

    @nome = params[:nome] #welcome/index?nome=valor
    @curso = "Rails"
  end
end
