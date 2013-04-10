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
    
    if(params[:contact_groups] != nil)
		  params[:contact_groups].each do |id|
		  	@newsletter.contact_groups << ContactGroup.find(id[0])
			end
		end

    respond_to do |format|
      if @newsletter.save
      	
      	contacts = Array.new
      	
      	@newsletter.contact_groups.each do |contact_group|
      		contact_group.contacts.each do |contact|
		    		if(not (contacts.include?(contact)))
		    			contacts.push(contact)
		    		end
		    	end
      	end
      	
      	Thread.new{
		    	contacts.each do |contact|
		    		NewsletterMailer.send_newsletter(@newsletter, contact).deliver
		  	end
      	}
      	
        format.html { redirect_to @newsletter, notice: 'Newsletter criada com sucesso.' }
        format.json { render json: @newsletter, status: :created, location: @newsletter }
      else
        format.html { render action: "new" }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end
end
