class NiversController < ApplicationController
  before_action :set_niver, only: %i[ show edit update destroy ]

  def atualizar_dados
    file_contents = File.read('/mnt/c/email_pacientes/pacientes.txt')
    dados = eval(file_contents)

    dados.each do |paciente|
      Niver.find_or_create_by!(paciente)
    end
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
