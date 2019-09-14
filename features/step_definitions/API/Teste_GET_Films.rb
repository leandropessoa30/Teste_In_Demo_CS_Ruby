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
  str_result = ""
  puts "Foram encontrados #{filmes.size} filmes com o diretor #{diretor} e produtor #{produtor}, que são:"
  filmes.each do |filme|
    str_result = ""
    str_result = "<table border=1px, width=80%>"
    str_result += "<tr><td>Title</td><td width=70%> #{filme["title"]} </td></tr>"
    str_result += "<tr><td>Episode</td> <td>#{filme["episode_id"]} </td></tr>"
    str_result += "<tr><td>Opening Crawl</td> <td width=70%>#{filme["opening_crawl"].gsub("\r\n", " ")} </td></tr>"
    str_result += "<tr><td>Director</td> <td>#{filme["director"]} </td></tr>"
    str_result += "<tr><td>Producer</td> <td>#{filme["producer"]} </td></tr>"
    str_result += "<tr><td>Release Date</td> <td>#{filme["release_date"]} </td></tr>"
    str_result += "<tr><td>Characters</td> <td>#{filme["characters"]} </td></tr>"
    str_result += "<tr><td>Planets</td> <td>#{filme["planets"]} </td></tr>"
    str_result += "<tr><td>Starships</td> <td>#{filme["starships"]} </td></tr>"
    str_result += "<tr><td>Vehicles</td> <td>#{filme["vehicles"]} </td></tr>"
    str_result += "<tr><td>Species</td> <td>#{filme["species"]} </td></tr>"
    str_result += "<tr><td>Created</td> <td>#{filme["created"]} </td></tr>"
    str_result += "<tr><td>Edited</td> <td>#{filme["edited"]} </td></tr>"
    str_result += "<tr><td>URL</td> <td>#{filme["url"]} </td></tr></table>"
    puts str_result
  end
end