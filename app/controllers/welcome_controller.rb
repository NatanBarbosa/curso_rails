class WelcomeController < ApplicationController
  def index
    @nome = params[:nome] #welcome/index?nome=valor
    @curso = "Rails"
  end
end
