

def captura_desktop
    File.delete('Img_Temp.gif') if File.exists?('Img_Temp.gif')
    Win32::Screenshot::Take.of(:desktop).write('Img_Temp.gif')
    openImg = File.open("Img_Temp.gif", "rb")
    $imgBase64 = Base64.encode64(openImg.read)
    openImg.close
    File.delete('Img_Temp.gif')
    $imgBase64
end

def captura_browser
  $imgBase64 = $browser.driver.screenshot_as(:base64)
end

def clicar_uia_button(obj, desc)
  cont_tempo = 0
  while obj.nil? and cont_tempo < 10
    sleep 0.5
    cont_tempo += 1
  end
  raise "Botão <#{desc}> não foi encontrado." if obj.nil?
  obj.click
end