#language: pt
#encoding: utf-8

@Buy_Now_With_1Click
Funcionalidade: Buy Now With 1 Click

Contexto:
  Dado que acesse a pagina "https://demo.cs-cart.com"

@Comprar_agora_com_1_clique
Cenário: Buy_Now_With_1_Click
  Dado preencher o campo de pesquisas de produtos "Asus CP6130"
  Quando clicar no botão lupa de pesquisa
  Então será apresentado o resultado das buscas com o item "Asus CP6130" pesquisado
  Dado que selecione o produto "Asus CP6130"
  E clique na opção "BUY NOW WITH 1-CLICK"
  E preencher o formulario 
  |Your Name |Phone        |E-mail        |
  |José Teste|5511999999999|jose@gmail.com|
  Quando clicar no botão Submit
  Então é apresentado a mensagem
