#encoding: utf-8

require 'magic_encoding'

class APITest

  def get_Films(url)
    retorno = RestClient.get(url)
    return retorno
  end

  def valida_retorno(code, retorno)
    raise "O codigo esperado da solicitação '#{code}' é diferente do encontrado '#{retorno.code}'" if retorno.code.to_s != code
  end

  def imprimir_dados(diretor, produtor, result)
    cont = 0
    fil = Array.new
    retorno = JSON.parse(result.body)
    puts "Filmes encontrados com o diretor #{diretor} e produtor #{produtor} são:"
    retorno["results"].each do |titulo|
      if titulo["director"].upcase.gsub(" ", "") == diretor.upcase.gsub(" ", "") and titulo["producer"].upcase.gsub(" ", "").include? produtor.upcase.gsub(" ", "")
        fil << titulo
      end
    end
    return fil
  end


end
