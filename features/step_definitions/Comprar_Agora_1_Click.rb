#encoding: utf-8

require './features/Pages/DemoCsPage'

comp = DemoCsPage.new

Dado("que selecione o produto {string}") do |produto|
  comp.selecionar_produto(produto)
  captura_browser
end

E("clique na opção {string}") do |opcao|
  comp.clica_opcao_compra(opcao)
  captura_browser
end

E("preencher o formulario") do |table|
  comp.preenche_formulario(table)
  captura_browser
end

Quando("clicar no botão Submit") do
  comp.clicar_submit
  captura_browser
end

Então("é apresentado a mensagem") do
  comp.valida_msg
  captura_browser
end
