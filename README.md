![TestInProject](logo.png) 

## Objetivo

Teste automaticos na opção "Buy now with 1 click" na pagina demo.cs-cart
e teste de requisição GET na API swapi.co/api/films/.

<br/>
Desenvolvido no ruby 2.5.6(x64)

## Instalação

git clone https://github.com/leandropessoa30/TestInProject.git

#### Dependências

gem 'magic_encoding'<br/>
gem 'cucumber'<br/>
gem 'watir'<br/>
gem 'win32/screenshot'<br/>
gem 'base64'<br/>
gem 'faker'<br/>
gem 'rest-client'<br/>
gem 'json'<br/>

## Jenkins

##### http://191.232.242.199:8080/

###### Jobs: <br/>

Compra_Agora_1_Click <br/>
Test_APT_FILMS </br>

###### Schedule CRON: <br/>
Compra_Agora_1_Click: <br/>
TZ=America/Sao_Paulo <br/>
0 11,21 * * * <br/>
<br/>
Test_APT_FILMS </br>
TZ=America/Sao_Paulo <br/>
0 10,20 * * * <br/>

###### Relatorios: <br/>

HTML Publish <br/>

O relatório da execução poderá é acessado via htmlpublish disponivel 
nos jobs.
<br/>




