# Requisitos
1. Rodar em sistema linux
2. Docker engine instalado

# Instalação

1. docker compose build
2. docker compose up -d
3. docker compose run web rake db:create
4. docker compose run web rails db:migrate
