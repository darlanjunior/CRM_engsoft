class SupportCaseReport < Prawn::Document
  def initialize(report, view)
    super()

    text "<font size='30'> Relatorio de Chamados</font> #{report.creationDate}",
         :align => :center,
         :inline_format => true
    move_down 30

    text "<b>Periodo especificado</b>: #{report.beginRangeDate} ate #{report.endRangeDate}",
         :inline_format => true
    move_down 10

    text "<b>Numero total de chamados no periodo:</b> #{report.numCases}",
         :inline_format => true
    move_down 10

    text "<b>Porcentagem de chamados que foram fechados no periodo:</b> #{report.perctClosedCases}%",
         :inline_format => true
    move_down 10

    text "<b>Porcentagem dos chamados que esto em andamento no periodo:</b> #{report.perctOpenCases}%",
         :inline_format => true
    move_down 10

    text "<b>Porcentagem dos chamados do tipo 'Duvida' abertos no periodo:</b> #{report.perctDoubtCases}%",
         :inline_format => true
    move_down 10

    text "<b>Porcentagem dos chamdos do tipo 'Problema' abertos no periodo:</b> #{report.perctProblemCases}%",
         :inline_format => true
    move_down 10

    text "<b>Tempo medio de duracao de um chamado no periodo:</b> #{report.avgCompletionTime} dias",
         :inline_format => true
    move_down 10


  end

end