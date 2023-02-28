namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    if Rails.env.development?
      show_spinner('Apagando BD...') do
        #bloco de código executado no yield da função
        %x(rails db:drop)
      end

      show_spinner('Recriando BD...') {%x(rails db:create)}
      show_spinner('Rodando migration...') {%x(rails db:migrate)}
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
      
    else
      puts "Task exclusiva para ambiente de desenvolvimento"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    coins = [
      {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://static.vecteezy.com/system/resources/previews/008/505/801/original/bitcoin-logo-color-illustration-png.png",
          mining_type: MiningType.find_by(acronym: 'PoW')
      },
      {
          description: "Etheruium",
          acronym: "ETH",
          url_image: "https://w7.pngwing.com/pngs/268/1013/png-transparent-ethereum-eth-hd-logo-thumbnail.png",
          mining_type: MiningType.all.sample
      },
      {
          description: "Dash",
          acronym: "DASH",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png",
          mining_type: MiningType.all.sample
      }
    ]
    
    show_spinner('Cadastrando as moedas...', 'Cadastro feito') do
      coins.each do |coin|
          Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    mining_types = [
      {
          description: "Proof of Work",
          acronym: "PoW",
      },
      {
          description: "Proof of Stake",
          acronym: "PoS",
      }
    ]

    show_spinner('Cadastrando os tipos de mineração...', 'Cadastro feito') do
      mining_types.each do |mining_type|
          MiningType.find_or_create_by!(mining_type)
      end
    end

  end

  private
  def show_spinner(msg_start, msg_end = 'Ok!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end