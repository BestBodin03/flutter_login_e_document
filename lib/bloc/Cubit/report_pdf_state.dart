// report_pdf_state.dart

import 'package:equatable/equatable.dart';
import 'package:newmaster/page/P32ReportPDFcommon/entities_models/ReportPDFModels.dart';

abstract class ReportPDFState extends Equatable {
  const ReportPDFState();

  @override
  List<Object?> get props => [];
}

class ReportPDFInitial extends ReportPDFState {}

class ReportPDFLoading extends ReportPDFState {}

class ReportPDFLoaded extends ReportPDFState {
  final CommonReportOutputModel report;
  final Map<String, String> methodToMachineMethod;
  final Map<String, String> methodToMachineMethodFN;

  ReportPDFLoaded(
    this.report, {
    this.methodToMachineMethod = const {},
    this.methodToMachineMethodFN = const {},
  });
}


class ReportPDFError extends ReportPDFState {
  final String message;

  const ReportPDFError(this.message);

  @override
  List<Object?> get props => [message];
}
