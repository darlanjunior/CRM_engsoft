class BannersController < ApplicationController
  # GET /banners
  # GET /banners.json
  def index
    @banners = Banner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @banners }
    end
  end

  # GET /banners/1
  # GET /banners/1.json
  def show
    @banner = Banner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @banner }
    end
  end

  # GET /banners/new
  # GET /banners/new.json
  def new
    @banner = Banner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @banner }
    end
  end

  # GET /banners/1/edit
  def edit
    @banner = Banner.find(params[:id])
  end

  # POST /banners
  # POST /banners.json
  def create
    @banner = Banner.new(params[:banner])
    size = @banner.banner_types[@banner.size_type]
    @banner.width = size.first
    @banner.height = size.last

    respond_to do |format|
      if @banner.save
        format.html { redirect_to @banner, notice: 'O Banner foi criado com sucesso.' }
        format.json { render json: @banner, status: :created, location: @banner }
      else
        format.html { render action: "new" }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /banners/1
  # PUT /banners/1.json
  def update
    @banner = Banner.find(params[:id])
    size = @banner.banner_types[@banner.size_type]
    @banner.width = size.first
    @banner.height = size.last

    respond_to do |format|
      if @banner.update_attributes(params[:banner])
        format.html { redirect_to @banner, notice: 'O Banner foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @banner = Banner.find(params[:id])
  end

  # DELETE /banners/1
  # DELETE /banners/1.json
  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy

    respond_to do |format|
      format.html { redirect_to banners_url }
      format.json { head :no_content }
    end
  end
end
