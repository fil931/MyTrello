class ColumnsController < ApplicationController
  before_action :set_column, only: [:show, :edit, :update, :destroy]

  # GET /columns
  # GET /columns.json
  def index
    @columns = Column.all
  end

  # GET /columns/1
  # GET /columns/1.json
  def show
    @tickets = Ticket.where(:column_id => params[:id])
  end

  # GET /columns/new
  def new
    @column = Column.new
  end

  # GET /columns/1/edit
  def edit
  end

  def add_ticket
    @ticket = Ticket.new
    @ticket.title = params[:title]
    @ticket.description = params[:description]
    @ticket.column_id = params[:column_id]

    @column = Column.find(params[:column_id])
    @board = Board.find(@column.board_id)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @board, notice: 'New ticket was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html {redirect_to @board, notice: 'Error: ticket not created' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /columns
  # POST /columns.json
  def create
    @column = Column.new(column_params)

    respond_to do |format|
      if @column.save
        format.html { redirect_to @column, notice: 'Column was successfully created.' }
        format.json { render :show, status: :created, location: @column }
      else
        format.html { render :new }
        format.json { render json: @column.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /columns/1
  # PATCH/PUT /columns/1.json
  def update
    respond_to do |format|
      if @column.update(column_params)
        format.html { redirect_to @column, notice: 'Column was successfully updated.' }
        format.json { render :show, status: :ok, location: @column }
      else
        format.html { render :edit }
        format.json { render json: @column.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /columns/1
  # DELETE /columns/1.json
  def destroy
    @column.destroy
    respond_to do |format|
      format.html { redirect_to columns_url, notice: 'Column was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_column
      @column = Column.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def column_params
      params.require(:column).permit(:title)
    end
end
