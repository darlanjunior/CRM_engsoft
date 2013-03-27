class FaqsController < ApplicationController
  before_filter :find_subject
  before_filter :all_subjects
  
  # GET /faqs
  # GET /faqs.json
  def index
    @faqs = Faq.sorted
    if @subject
      @faqs = @faqs.where(:subject_id => @subject.id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @faqs }
    end
  end

  # GET /faqs/1
  # GET /faqs/1.json
  def show
    @faq = Faq.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @faq }
    end
  end

  # GET /faqs/new
  # GET /faqs/new.json
  def new 
    @faq = Faq.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @faq }
    end
  end

  # GET /faqs/1/edit
  def edit
    @faq = Faq.find(params[:id])
  end

  # POST /faqs
  # POST /faqs.json
  def create
    @faq = Faq.new(params[:faq])

    respond_to do |format|
      if @faq.save
        format.html { redirect_to @faq, notice: 'FAQ criada com sucesso.' }
        format.json { render json: @faq, status: :created, location: @faq }
      else
        @subjects = Subject.all
        format.html { render action: "new" }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /faqs/1
  # PUT /faqs/1.json
  def update
    @faq = Faq.find(params[:id])
    @faq.update_attributes(params[:faq])

    respond_to do |format|
      if @faq.save
        format.html { redirect_to @faq, notice: 'FAQ atualizada com sucesso.' }
        format.json { head :no_content }
      else
        @subjects = Subject.all
        format.html { render action: "edit" }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @faq = Faq.find(params[:id])
  end

  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy

    respond_to do |format|
      format.html { redirect_to faqs_url }
      format.json { head :no_content }
    end
  end

  private

  def find_subject
    if params[:subject_id]
      @subject = Subject.find_by_id(params[:subject_id])
    end
  end

  def all_subjects
    @subjects = Subject.all
  end
end
