class ReportsController < ApplicationController


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

    @report = Report.new

    @report.numCases = @createdCases.size
    @report.perctOpenCases = (@perctOpenCases*100).round(2)
    @report.perctClosedCases = (@perctClosedCases*100).round(2)
    @report.perctDoubtCases = (@perctDoubtCases*100).round(2)
    @report.perctProblemCases = (@perctProblemCases*100).round(2)
    @report.beginRangeDate = startDate
    @report.endRangeDate = endDate
    @report.creationDate = Date.today
    @report.avgCompletionTime = @averageCompletionTime
    @report.idleCases = @idleCases


  end

  def supportCasesReportPdf
    supportCasesReport

    respond_to do |format|
      format.html
      format.pdf do
        pdf = SupportCaseReport.new(@report,view_context)
        send_data pdf.render, filename:
            "RelatorioDeChamados#{Date.today.to_s}.pdf",
            type: "application/pdf"
      end
    end


  end


end