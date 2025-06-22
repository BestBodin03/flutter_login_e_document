
// report_pdf_event.dart
import 'package:equatable/equatable.dart';
import 'package:newmaster/page/P32ReportPDFcommon/entities_models/ReportPDFModels.dart';

abstract class PhInspectionStandardEvent extends Equatable {
  const PhInspectionStandardEvent();

  @override
  List<Object> get props => [];
}

class LoadReportDataEvent extends PhInspectionStandardEvent {
  final String po;
  
  const LoadReportDataEvent({required this.po});
  
  @override
  List<Object> get props => [po];
}

class ClearReportDataEvent extends PhInspectionStandardEvent {}