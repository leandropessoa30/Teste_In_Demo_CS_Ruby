#language: pt
#encoding: utf-8
@Teste_GET_Films
Funcionalidade: Teste Get Films

  Contexto:
    Dado que envie uma requisição Get para url "http://swapi.co/api/films/"

  @Teste_GET_Films_0
  Cenário: Buy_Now_With_1_Click
    Dado que o codigo do retorno da requisicao GET seja "200"
    Então imprimir no relatorio o campo apenas dos filmes que tenham "George Lucas" como diretor e que "Rick McCallum" tenha participado como produtor