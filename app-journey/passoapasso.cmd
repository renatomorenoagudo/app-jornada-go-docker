tecnologia: go
versao: 1.22.4
porta:8080

postgres
------------------------------------------------
dev:
    preparaçao 
    instalar libs
---------------------------------------------
execução:rodar app:
fo rum cmd/jornada-go 
terminal:

go mod download && go mod verify
outra opção é ir no site da go e baixar e instalar o arquivo.

go run cmd/journey/journey.go

ou clica com o botao edireito em cima do arquivo journey.go e executar
que ele vai abrir o terminal go.

----------------------------------------
produçao:
    preparaçao:
    -instalar libs
    -buildar:
    o binario é gerado pos bild:
    go build cmd/nlw-journey-devops/journey.go
    vai ser criado um arquivo binario abaixo do go.sum
    que deve ser executado diretamente no cmd:
    go run journey
    nao precisa por a extensao ".go"do arquivo poir é binario

https://hub.docker.com/_/golang
para usar images do goland no from do dockerfile


definir os passos do dockerfile que é a conteinirizaçao
precisa buildar no code:
-docker build -t api-journey:v1.
(como tem o mesmo nome: journey, basta o ponto apos, se
tiver qqr outro nome ai precisa adicional depois de v1 o -f)
ai ele fara o pull da docker images
aguarda terminar de rodar e instalar as bilbiotecas
aparecera os dados da image:
repository: api-journey, tag v1, image id:asdfa..., cread (tempo), size(tamanho) 
obs:por eqto é so um teste local, a tag criamos para teste, pois via de regra
o nome pe gerado via pip

em seguida para rodar, executar essa imagem
e ai sim teremos o conteiner:digitamos no code:
docker run -d -p 8080:8080 api-journey
(o -d é para executar no modo test)
(o -p é para setar a porta 8080)

agora para ver o processo : no code:
docker ps 
ou 
docker ps -a

pode tamber ver  motivo de nao retornar nada no docker ps
usamos o 
docker log + numero id
onde retornara problema no banco d dados, que ´r normal pq
ate aki nao foi definido o bd 

criação do arquivo docker compose
ajudar a rodar a aplicação em ambiente local
par aajudar no dia a dia do desenvolvedor

definimos nome para a aplicação, no caso= api
passamos nossa build:  . (só o ponto pq estao na mesma hierarquia)
definimos a porta =8080
o enviroment: variavel de ambiente, da tbm pelo cmd, acrescentando o -e na linha
de comando :docker run -d -p 8080:8080 -e _api-journey:v2
mas no caso definimos no enviroment

acrescentando as portas do postgres:
colocando o coneiner`name: api 
acessa o hub.docker e no postgres pega uma tag da versao, no caso a 16.2, 
onde tera a alpine tbm (alpine3.19)
fica assim :
image:postgres:16.2-alpine3.19
ai na propria documentaçao do postgres , no final da pagina,tem o que ele precisa de variaveis para a execução
(postgres_pass, postgres_user, postgres_db)
o valor vai ser criado via dot end
${journey_database_....}as mesmas da api, copia e cola

no final da api e da postgres , acrescesta o network: como um conteiner por integrar varias networks, passa o nome 
networks:
-journey

agora criamos um arquivo .env, para passar os parametros do compose
obs: no host não pode ser localhost, pq na internet nao tem  esse endereçço
entao, qdo tiver rodando varios conteiner no compose, definir como o proprio nome:
journey_database_rost: postgres
pq postegres é o nome do seriço;;;

para rodar, no cmd code: 
docker-compose up --build -d

(nem precisaria do --buid, so qdo quer buildar novamente)

para saber se deu certo apos rodar(em azul) trara que o 
conteiner api-db running e o conteiner api started

FALTA AGORA O CONTAINER REGISTRY E  O CI 
onde precisamos criar um repository no githun

cria um repositorio no github para salvar os arquivos
da um git init
git add
git branch -M main
git push
git push -u origin main

no CI preenche os dados, e precisara do nome usado da conta do docker.hub, logo 
vai precisar criar uma conta la 

depois faz outra publicaçao no github, e observa que a 
vai rodar a aplicaçao do docker no git

o arquivo docker compose é somente para ser usado na maquina local,
quando rodar na net nao vai usar ele
falta o banco de dados remoto!!!!









