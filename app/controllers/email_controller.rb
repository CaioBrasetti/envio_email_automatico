require 'pry'
require 'date'
require 'net/smtp'

class EmailController < NiversController
  def enviar_email
    atualizar_dados
      
    pacientes = Niver.all
    
    pacientes.each do |paciente|      
      aniversario = Date.today
      data_atual = Date.today

      if data_atual.month == aniversario.month && data_atual.day == aniversario.day
        nome = paciente[:nome]
        nome = nome.tr('ÁÀÃÂÉÈÊÍÌÎÓÒÕÔÚÙÛáàãâéèêíìîóòõôúùû', 'AAAAEEEIIIOOOOUUUUaaaaeeeiiioooouuuu')
        # email = paciente[:email]
        email = "caiobrasetti@gmail.com"
        puts nome
        puts email

        msg = "From: Cynthia Koury <ckfonoaudiologia@hotmail.com>\n"
        msg += "To: #{nome} <#{email}>\n"
        msg += "Subject: Feliz aniversario =)\n\n"
        msg += "Olá! #{nome.split(" ")[0]}\n\nParabéns pelo seu aniversário!\n\nQue seja um dia inesquecível e o início de um novo ano na sua vida cheio de felicidade e muitas realizações.\n\nAtenciosamente,\nCynthia Koury"

        smtp = Net::SMTP.new 'smtp.office365.com', 587
        smtp.enable_starttls
        smtp.start('office365.com', 'ckfonoaudiologia@hotmail.com', 'ck150691', :login) do |smtp|
          smtp.send_message msg, 'ckfonoaudiologia@hotmail.com', email
        end
        
        puts 'Enviado paciente'
        sleep 5

        msg = "From: Bot Fono <ckfonoaudiologia@hotmail.com>\n"
        msg += "To: Oi Cynthia <caiobrasetti@hotmail.com>\n"#email da Cyn
        msg += "Subject: Enviado - Feliz aniversario para #{nome.split(" ")[0].capitalize}\n\n"
        msg += "Oi! Cynthia\n\nParabens enviado para o paciente '#{nome}' no email '#{email}'\n\nAtenciosamente,\nBot Fono"

        smtp = Net::SMTP.new 'smtp.office365.com', 587
        smtp.enable_starttls
        smtp.start('office365.com', 'ckfonoaudiologia@hotmail.com', 'ck150691', :login) do |smtp|
          smtp.send_message msg, 'ckfonoaudiologia@hotmail.com', 'caiobrasetti@hotmail.com'#email da Cyn
        end

        puts 'Enviado Cyn'
        sleep 5 
                 
      end
    end
  end
end
