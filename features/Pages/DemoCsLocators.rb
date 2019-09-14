#encoding: utf-8

require 'magic_encoding'

class DemoCsLocators
    
    def botao_calc(name)
        return $win.find(control_type: :button, name: name)
    end

    def input_caixa_pesquisa_produto
        return $browser.input(id: "search_input")
    end

    def btn_lupa_pesquisa_produto
        return $browser.button(title: "Search", class: "ty-search-magnifier")
    end

    def list_produtos_da_busca
        return $browser.as(class: "product-title")
    end

    def opcaoCompra(opcao)
        $browser.as.each do |item|
            return item if item.text.upcase.gsub(" ", "") == opcao.upcase.gsub(" ", "")
        end
        return $browser.a(text: item)
    end

    def input_your_name
        $browser.input(id: /call_data_call_request_.*_name/)
    end

    def input_phone
        $browser.input(id: /call_data_call_request_.*_phone/)
    end

    def input_email
        $browser.input(id: /call_data_call_request_.*_email/)
    end

    def btn_submit
        $browser.button(text: "Submit")
    end

    def div_msg_sucesso
        $browser.div(class: "cm-notification-content notification-content alert alert-success cm-auto-hide")
    end


end