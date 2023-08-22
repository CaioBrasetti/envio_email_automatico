class NiversController < ApplicationController
  require 'roo'

  skip_before_action :verify_authenticity_token
  before_action :set_niver, only: %i[ show edit update destroy ]

  def atualizar_dados
    file_contents = params[:file_input]

    if file_contents.present?
      spreadsheet = Roo::Spreadsheet.open(file_contents.path) # Ou use 'Roo::Spreadsheet.open' para outros formatos
      sheet_name = 'teste_caio'
      spreadsheet.default_sheet = sheet_name
      headers = spreadsheet.row(1)
      data = []
      
      # Agora você pode iterar pelas planilhas e linhas para processar os dados do arquivo
      spreadsheet.each_with_index  do |row, id|
        next if id == 0 # skip header
        value = {}

        headers.each_with_index do |header, index|
          value[header] = row[index]
        end

        data << value
        # Processar cada linha conforme necessário
      end

    data.each do |paciente|
      Niver.where(nome: paciente["Paciente"], data_de_nascimento: paciente["Data de Nascimento"], email: paciente["E-mail"]).first_or_create
    end
      flash[:success] = 'Arquivo processado com sucesso.'
    else
      flash[:error] = 'Nenhum arquivo foi enviado.'
    end
      redirect_to root_path
  end

  # GET /nivers or /nivers.json
  def index
    @nivers = Niver.all
  end

  # GET /nivers/1 or /nivers/1.json
  def show
  end

  # GET /nivers/new
  def new
    @niver = Niver.new
  end

  # GET /nivers/1/edit
  def edit
  end

  # POST /nivers or /nivers.json
  def create
    @niver = Niver.new(niver_params)

    respond_to do |format|
      if @niver.save
        format.html { redirect_to niver_url(@niver), notice: "Paciente criado com sucesso." }
        format.json { render :show, status: :created, location: @niver }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @niver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nivers/1 or /nivers/1.json
  def update
    respond_to do |format|
      if @niver.update(niver_params)
        format.html { redirect_to niver_url(@niver), notice: "Atualização feita com sucesso." }
        format.json { render :show, status: :ok, location: @niver }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @niver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nivers/1 or /nivers/1.json
  def destroy
    @niver.destroy

    respond_to do |format|
      format.html { redirect_to nivers_url, notice: "Paciente deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_niver
      @niver = Niver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def niver_params
      params.require(:niver).permit(:nome, :data_de_nascimento, :email)
    end
end
