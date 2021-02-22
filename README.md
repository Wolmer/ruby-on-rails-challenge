# Desafio Ruby on Rails

### Objetivo 

Este projeto tem o objetivo de demonstrar conhecimento na criação de API's utilizando Ruby on Rails.
Para isso foi criado um projeto simples, com apenas duas rotas para retornar dados, uma para Cursos e outra para Ofertas desses cursos.
O projeto contém no total 3 rotas, sendo a terceira para autenticação JWT, retornando um json contendo o token desse usuário logado.

### O que foi feito

Após estudar Ruby, e Ruby on Rails, consegui produzir uma API contendo:

- Migrations (cria o banco de dados automaticamente, mantendo seu histórico)
- Seeder (popular o banco com dados à partir do json de exemplo)
- Testes unitários (das models e rotas com criação do banco com dados fictícios)
- Rota para autenticação JWT **/auth/login**
- Rotas para retornar os dados de cursos e ofertas:
  - Estrutura de dados esperado na rota **/courses**:
    ```
    [
      {
        "course": {
        "name": string,
        "kind": string,
        "level": string,
        "shift": string
        "university": {
          "name": string,
          "score": float,
          "logo_url": string
        },
        "campus": {
          "name": string,
          "city": string
        }
        }
      }
    ]
    ```
  - Estrutura de dados esperado na rota **/offers**:
    ```
    [
      {
        "full_price": float,
        "price_with_discount": float,
        "discount_percentage": float,
        "start_date": string,
        "enrollment_semester": string,
        "enabled": boolean,
        "course": {
          "name": string,
          "kind": string,
          "level": string,
          "shift": string
        },
        "university": {
          "name": string,
          "score": float,
          "logo_url": string
        },
        "campus": {
          "name": string,
          "city": string
        }
      }
    ]
    ```

### Setup do projeto

Para iniciar, via terminal vamos fazer o clone do projeto, e acessar a pasta criada: 
- `git clone git@github.com:Wolmer/ruby-on-rails-challenge.git`
- `cd ruby-on-rails-challenge`

Vamos instalar as dependências:
- `bundle install`

Agora vamos criar o banco, as tabelas e popular os dados à partir do json de exemplo:
- `rails db:create`
- `rails db:migrate`
- `rails db:seed`

Pronto, o projeto está ok agora, vamos levantar o servidor:
- `rails server`

### Como testar

O projeto possuí duas formas de teste, uma são os testes unitários e a outra via requisição para os endpoints.
- Para rodar os testes unitários, utilize o seguinte comando:
  - `rails spec`

- Para visualizar os dados via endpoints, você necessita primeiro fazer o login na aplicação, para então com o token acessar as demais rotas.
  Via seeder, foi criado no banco de dados um usuário com as seguintes credenciais:
  - **email**: test@example.com
  - **senha**: password

  Nesse passo, você pode seguir por dois formatos, utilizar o cURL ou o Postman se preferir.
  - Via cURL, utilize os seguintes comandos:
    - rota **/auth/login** (utilize os dados do usuário teste criado via seeder)
      - `curl -H "Content-Type: application/json" -X POST -d '{"email":"test@example.com","password":"password"}' http://127.0.0.1:3000/auth/login`

    - rota **/courses** (substitua `{auth_token}` pelo token obtido na rota `/auth/login`)
      - `curl -H "Authorization: {auth_token}" http://localhost:3000/courses`

    - rota **/offers** (substitua `{auth_token}` pelo token obtido na rota `/auth/login`)
      - `curl -H "Authorization: {auth_token}" http://localhost:3000/offers`

  - Via Postman, você pode utilizar a seguinte collection:
    - [Ruby Challenge API](docs/Ruby%20Challenge%20API.postman_collection.json)
