// report_pdf_state.dart

import 'package:equatable/equatable.dart';

abstract class ReportPDFState extends Equatable {
  const ReportPDFState();

  @override
  List<Object?> get props => [];
}

class ReportPDFInitial extends ReportPDFState {}

class ReportPDFLoading extends ReportPDFState {}

class ReportPDFLoaded extends ReportPDFState {}

class ReportPDFError extends ReportPDFState {
  final String message;

  const ReportPDFError(this.message);

  @override
  List<Object?> get props => [message];
}
