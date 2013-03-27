class NewslettersController < ApplicationController
  # GET /newsletters
  # GET /newsletters.json
  def index
    @newsletters = Newsletter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @newsletters }
    end
  end

  # GET /newsletters/1
  # GET /newsletters/1.json
  def show
    @newsletter = Newsletter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @newsletter }
    end
  end

  # GET /newsletters/new
  # GET /newsletters/new.json
  def new
 		@newsletter = Newsletter.new
  	if(params[:id] != nil)
    	newsletter_aux = Newsletter.find(params[:id])
    	
    	@newsletter.title = "Anula e substitui: " + newsletter_aux.title
    	@newsletter.message_body = newsletter_aux.message_body
    	@newsletter.contact_groups = newsletter_aux.contact_groups
    end
    
    @contact_groups = ContactGroup.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @newsletter }
    end
  end

  # GET /newsletters/1/edit
  def edit
  	@newsletter = Newsletter.find(params[:id])
    
    @contact_groups = ContactGroup.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @newsletter }
    end
  end

  # POST /newsletters
  # POST /newsletters.json
  def create
    @newsletter = Newsletter.new(params[:newsletter])
    
    @newsletter.contact_groups = Array.new
    
    params[:contact_groups].each do |id|
    	@newsletter.contact_groups << ContactGroup.find(id[0])
		end

    respond_to do |format|
      if @newsletter.save
        format.html { redirect_to @newsletter, notice: 'Newsletter was successfully created.' }
        format.json { render json: @newsletter, status: :created, location: @newsletter }
      else
        format.html { render action: "new" }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /newsletters/1
  # PUT /newsletters/1.json
  def update
    @newsletter = Newsletter.find(params[:id])
    
    @newsletter.contact_groups = Array.new
    
    params[:contact_groups].each do |id|
    	@newsletter.contact_groups << ContactGroup.find(id[0])
		end

    respond_to do |format|
      if @newsletter.update_attributes(params[:newsletter])
        format.html { redirect_to @newsletter, notice: 'Newsletter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletters/1
  # DELETE /newsletters/1.json
  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy

    respond_to do |format|
      format.html { redirect_to newsletters_url }
      format.json { head :no_content }
    end
  end
end
