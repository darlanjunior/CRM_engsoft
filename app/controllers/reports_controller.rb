class ReportsController < ApplicationController
  # To change this template use File | Settings | File Templates.

  def new
    @today = Time.now.to_date

    respond_to do |format|
      format.html # new.html.erb
    end
  end


  def supportCasesReport

    @test = params[:test]

    startDate = params[:startDate]
    endDate = params[:endDate]
    thresholdLength = params[:thresholdLength]
    if(thresholdLength == nil)
      thresholdLength=30
    end

    @allSupportCases = SupportCase.all

    numSupportCases = @allSupportCases.size

    @closedCases = SupportCase.where("status = ?","Fechado")

    @openCases = SupportCase.where("status = ?","Em andamento")

    @problemCases = SupportCase.where("caseType = ?","Problema")
    @doubtCases = SupportCase.where("caseType = ?","Duvida")

    @createdCases = @allSupportCases

    if(startDate!=nil && endDate!=nil )
      @createdCases = @createdCases.select{|createdCase| createdCase.created_at>startDate &&
          createdCase.created_at<endDate}
      @openCases = @openCases.select{|createdCase| createdCase.created_at>startDate &&
          createdCase.created_at<endDate}
      @closedCases = @closedCases.select{|createdCase| createdCase.created_at>startDate &&
          createdCase.updated_at<endDate && createdCase.created_at<endDate}
      @problemCases = @problemCases.select{|createdCase| createdCase.created_at>startDate &&
          createdCase.created_at<endDate}
      @doubtCases = @doubtCases.select{|createdCase| createdCase.created_at>startDate &&
          createdCase.created_at<endDate}
    end

    if(@closedCases!=nil && @closedCases.size!=0)
      @totalDays = 0
      @closedCases.each do |closedCase|
        @totalDays = @totalDays + (closedCase.updated_at.to_date - closedCase.created_at.to_date).to_i
      end

      @averageCompletionTime = @totalDays/@closedCases.size
    end

    @idleCases = nil;
    if(thresholdLength!=nil)
      @idleCases = @openCases.select{|openCase| openCase.updated_at < (Time.now.to_date - thresholdLength.days)}
    end

    if(@createdCases!=nil && @createdCases.size!=0)
      @perctOpenCases = @openCases.size.to_f/@createdCases.size.to_f
      @perctClosedCases = @closedCases.size.to_f/@createdCases.size.to_f
      @perctProblemCases = @problemCases.size.to_f/@createdCases.size.to_f
      @perctDoubtCases = @doubtCases.size.to_f/@createdCases.size.to_f
    end


  end
end