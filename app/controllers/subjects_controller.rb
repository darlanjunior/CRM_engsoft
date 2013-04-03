# encoding: UTF-8
class SubjectsController < ApplicationController
  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.sorted

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subjects.to_json(:include => [:faqs]) }
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = Subject.find(params[:id])
    criar_lista_faqs

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /subjects/new
  # GET /subjects/new.json
  def new
    @subject = Subject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /subjects/1/edit
  def edit
    @subject = Subject.find(params[:id])
    criar_lista_faqs
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(params[:subject])

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: "Tópico criado com sucesso." }
        format.json { render json: @subject, status: :created, location: @subject }
      else
        format.html { render action: "new" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subjects/1
  # PUT /subjects/1.json
  def update
    @subject = Subject.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        format.html { redirect_to @subject, notice: "Tópico atualizado com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @subject = Subject.find(params[:id])
    criar_lista_faqs
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.faqs.each do |p|
      p.destroy
    end
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :no_content }
    end
  end

  private
  def criar_lista_faqs
    @lista_faqs = "Não há FAQs relacionadas a esse tópico."
    if not @subject.faqs.empty?
      @lista_faqs = ("<dl style='margin-bottom:0px;'>" + @subject.faqs.collect{|f| "<dt>" + f.question + "</dt><dd>" + f.answer + "</dd>"}.join() + "</dl>").html_safe
    end
  end
end
