module ApplicationHelper
  def ambiente_rails
    if Rails.env.development?
      "Desenvolvimento"
    elsif Rails.env.production?
      "Produção"
    else
      "Testes"
    end
  end

  def aplication_locale
    I18n.locale == :en ? "Estados Unidos" : "Português do Brasil"
  end
end
