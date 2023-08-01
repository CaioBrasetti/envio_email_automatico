class MesController < ApplicationController
  def index
    @nivers = Niver.all
    
    janeiro = []
    fevereiro = []
    marco = []
    abril = []
    maio = []
    junho = []
    julho = []
    agosto = []
    setembro = []
    outubro = []
    novembro = []
    dezembro = []
    
    @nivers.each do |niver|
      case niver.data_de_nascimento.strftime("%m")
      when "01"
        janeiro << niver
      when "02" 
        fevereiro << niver
      when "03"
        marco << niver
      when "04"
        abril << niver
      when "05"
        maio << niver
      when "06"
        junho << niver
      when "07"
        julho << niver
      when "08"
        agosto << niver
      when "09"
        setembro << niver
      when "10"
        outubro << niver
      when "11"
        novembro << niver
      when "12" 
        dezembro << niver
      end
    end

    @anual = { 
      janeiro: janeiro, fevereiro: fevereiro, marco: marco, abril: abril, maio: maio, junho: junho, 
      julho: julho, agosto: agosto, setembro: setembro, outubro: outubro, novembro: novembro, dezembro: dezembro 
    }
  end
end
