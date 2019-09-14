#encoding: utf-8

require 'magic_encoding'

class DemoCsPage < DemoCsLocators

  def navega(url)
    $browser.goto url
  end

  def preencher_campo_pesquisa(pesquisa)
    input_caixa_pesquisa_produto.send_keys pesquisa
  end

  def clicar_lupa_pesquisa
    btn_lupa_pesquisa_produto.click
  end

  def tecla_enter
    $browser.send_keys :enter
  end

  def verifica_result(result)
    list_produtos_da_busca.each do |item|
      if item.title.upcase.gsub(" ", "") == result.upcase.gsub(" ", "")
        return true
      end
      return false
    end
  end

  def valida_result(item)
    raise "Produto não encontrado" if !verifica_result(item)
  end

  def selecionar_produto(produto)
    list_produtos_da_busca.each do |item|
      if item.title.upcase.gsub(" ", "") == produto.upcase.gsub(" ", "")
        $browser.driver.execute_script("window.scrollBy(0,300)") #Scroll
        item.click
        return true
      end
      return false
    end
  end

  def clica_opcao_compra(opcao)
    begin
      retries ||= 0
      $browser.driver.execute_script("window.scrollBy(0,300)") #Scroll
      opcaoCompra(opcao).click
    rescue Exception => e
      sleep 1
      retry if (retries += 1) < 3
      raise "Não foi possivel selecionar a opção de compra #{opcao}. Error: #{e.message}"
    end
  end

  def preenche_formulario(table)
    dados = table.hashes[0]

    #Aguarda Formulario ser carregado
    cont = 0
    while !btn_submit.exists? and cont < 10
      sleep 1
      cont += 1
    end

    #Verifica dados
    # Gera Massa Aleatoria
    dados["Your Name"] = Faker::Name.name if dados["Your Name"] == ""
    dados["Phone"] = Faker::PhoneNumber.phone_number_with_country_code if dados["Phone"]  == ""
    dados["E-mail"] = Faker::Internet.email if dados["E-mail"]  == ""

    begin
      retries ||= 0
      input_your_name.send_keys(dados["Your Name"])
      input_phone.send_keys(dados["Phone"])
      input_email.send_keys(dados["E-mail"])
    rescue Exception => e
      retry if (retries += 1) < 3
      raise "Não foi possivel preencher o formulario - Erro: #{e.message}"
    end
  end

  def clicar_submit
    begin
      btn_submit.click
    rescue Exception => e
      raise "Não foi possivel clicar no botão submit - Erro: #{e.message}"
    end
  end

  def valida_msg
    cont = 0
    while !div_msg_sucesso.exists? and cont < 10
      sleep 0.5
      cont += 1
    end
    raise "Não foi exibida a mensagem de validação" unless div_msg_sucesso.exists?
  end

end