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
  final Map<String, String> itemToItemName;
  final Map<String, String> itemToItemNameFN;
  final Map<String, String> remarkToComment;
  final Map<String, String> remarkToCommentFN;

  const ReportPDFLoaded(
    this.report, {
    this.methodToMachineMethod = const {},
    this.methodToMachineMethodFN = const {},
    this.itemToItemName = const {},
    this.itemToItemNameFN = const {},
    this.remarkToComment = const {},
    this.remarkToCommentFN = const {}
  });
}


class ReportPDFError extends ReportPDFState {
  final String message;

  const ReportPDFError(this.message);

  @override
  List<Object?> get props => [message];
}
