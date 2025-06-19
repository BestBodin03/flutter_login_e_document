
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

class UpdateReportDataEvent extends PhInspectionStandardEvent {
  final CommonReportOutputModel reportData;
  
  const UpdateReportDataEvent({required this.reportData});
  
  @override
  List<Object> get props => [reportData];
}

class ClearReportDataEvent extends PhInspectionStandardEvent {}

class UpdateBasicDataEvent extends PhInspectionStandardEvent {
  final BasicCommonDATAModel basicData;
  
  const UpdateBasicDataEvent({required this.basicData});
  
  @override
  List<Object> get props => [basicData];
}

class UpdateChecklistItemEvent extends PhInspectionStandardEvent {
  final int index;
  final FINALCHECKlistCommonClassModel item;
  
  const UpdateChecklistItemEvent({required this.index, required this.item});
  
  @override
  List<Object> get props => [index, item];
}