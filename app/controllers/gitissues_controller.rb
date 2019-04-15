require 'net/http'
require 'json'

require 'open-uri'
require 'json'

class GitissuesController < ApplicationController
  before_action :set_gitissue, only: [:show, :edit, :update, :destroy]

  # GET /gitissues
  # GET /gitissues.json
  def index
    a = URI.parse("https://api.github.com/repos/nnluukhtn/employment_bot/issues?state=all").read
    @gitissue = JSON.parse(a)
  end

  # GET /gitissues/1
  # GET /gitissues/1.json
  def show
  end

  # GET /gitissues/new
  def new
    @gitissue = Gitissue.new
  end

  # GET /gitissues/1/edit
  def edit
  end

  # POST /gitissues
  # POST /gitissues.json
  def create
    @gitissue = Gitissue.new(gitissue_params)

    respond_to do |format|
      if @gitissue.save
        format.html { redirect_to @gitissue, notice: 'Gitissue was successfully created.' }
        format.json { render :show, status: :created, location: @gitissue }
      else
        format.html { render :new }
        format.json { render json: @gitissue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gitissues/1
  # PATCH/PUT /gitissues/1.json
  def update
    respond_to do |format|
      if @gitissue.update(gitissue_params)
        format.html { redirect_to @gitissue, notice: 'Gitissue was successfully updated.' }
        format.json { render :show, status: :ok, location: @gitissue }
      else
        format.html { render :edit }
        format.json { render json: @gitissue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gitissues/1
  # DELETE /gitissues/1.json
  def destroy
    @gitissue.destroy
    respond_to do |format|
      format.html { redirect_to gitissues_url, notice: 'Gitissue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gitissue
      @gitissue = Gitissue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gitissue_params
      params.require(:gitissue).permit(:name, :content, :link)
    end
end
