abstract class ProfState {}

class ProfInitial extends ProfState {}

class GlobalChangeSelectedType extends ProfState {}

class ProfStudentsFetched extends ProfState {}

class ProfDataFetched extends ProfState {}


class ProfLoadingState extends ProfState {}

class ProfTableLoaded extends ProfState {
  final Map<String, dynamic> tableData;

  ProfTableLoaded(this.tableData);
}

class ProfDataError extends ProfState {
  final String error;

  ProfDataError(this.error);
}
