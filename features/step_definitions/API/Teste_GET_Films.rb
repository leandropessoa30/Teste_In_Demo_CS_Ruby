#encoding: utf-8

require './features/Pages/APITest'

retornoApi = APITest.new
$retorno = ""

Dado("que envie uma requisição Get para url {string}") do |url|
  $retorno = retornoApi.get_Films(url)
end

Dado("que o codigo do retorno da requisicao GET seja {string}") do |code|
  retornoApi.valida_retorno(code, $retorno)
end


Então("imprimir no relatorio o campo apenas dos filmes que tenham {string} como diretor e que {string} tenha participado como produtor") do |diretor, produtor|
  filmes = retornoApi.imprimir_dados(diretor, produtor, $retorno)

  html_table = "<table margin=1px>#{trs_tds}</td></table>"

  puts "Filmes encontrados com o diretor #{diretor} e produtor #{produtor} são:"
  filmes.each do |filme|
    puts "***********************************************************************"
    filme.each do |x,y|
    puts "***********************************************************************"
  end
end