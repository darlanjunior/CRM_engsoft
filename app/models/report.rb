class Report < Tableless


  column :beginRangeDate
  column :endRangeDate
  column :numCases
  column :perctOpenCases
  column :perctClosedCases
  column :perctProblemCases
  column :perctDoubtCases
  column :avgCompletionTime
  column :creationDate
  column :idleCases

  attr_accessible :beginRangeDate,
      :endRangeDate,
      :numCases,
      :perctOpenCases,
      :perctClosedCases,
      :perctProblemCases,
      :perctDoubtCases,
      :avgCompletionTime,
      :creationDate,
      :idleCases



end