#encoding: utf-8

require './features/Pages/DemoCsPage'

pesq = DemoCsPage.new

Dado(/^que acesse a pagina "([^"]*)"$/) do |url|
    pesq.navega(url)
    captura_browser
end

Dado(/^preencher o campo de pesquisas de produtos "([^"]*)"$/) do |pesquisa|
    pesq.preencher_campo_pesquisa(pesquisa)
    captura_browser
end

Quando(/^clicar no botão lupa de pesquisa$/) do
    pesq.clicar_lupa_pesquisa
    captura_browser
end

Então(/^será apresentado o resultado das buscas com o item "([^"]*)" pesquisado$/) do |item|
    pesq.valida_result(item)
    captura_browser
end

