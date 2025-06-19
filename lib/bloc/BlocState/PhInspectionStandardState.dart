// report_pdf_state.dart
import 'package:equatable/equatable.dart';
import 'package:newmaster/page/P32ReportPDFcommon/entities_models/ReportPDFModels.dart';

abstract class PhInspectionStandardState extends Equatable {
  const PhInspectionStandardState();

  @override
  List<Object> get props => [];
}

class ReportPdfInitial extends PhInspectionStandardState {}

class ReportPdfLoading extends PhInspectionStandardState {}

class ReportPdfLoaded extends PhInspectionStandardState {
  final CommonReportOutputModel? reportData;
  final BasicCommonDATAModel basicData;
  final List<FINALCHECKlistCommonClassModel> checklistData;
  final bool isControl;
  final bool canf;
  final bool hideDataPic;
  
  const ReportPdfLoaded({
    this.reportData,
    required this.basicData,
    required this.checklistData,
    this.isControl = false,
    this.canf = true,
    this.hideDataPic = false,
  });

  @override
  List<Object> get props => [
    reportData ?? '',
    basicData,
    checklistData,
    isControl,
    canf,
    hideDataPic,
  ];

  ReportPdfLoaded copyWith({
    CommonReportOutputModel? reportData,
    BasicCommonDATAModel? basicData,
    List<FINALCHECKlistCommonClassModel>? checklistData,
    bool? isControl,
    bool? canf,
    bool? hideDataPic,
  }) {
    return ReportPdfLoaded(
      reportData: reportData ?? this.reportData,
      basicData: basicData ?? this.basicData,
      checklistData: checklistData ?? this.checklistData,
      isControl: isControl ?? this.isControl,
      canf: canf ?? this.canf,
      hideDataPic: hideDataPic ?? this.hideDataPic,
    );
  }
}

class ReportPdfError extends PhInspectionStandardState {
  final String message;
  
  const ReportPdfError({required this.message});
  
  @override
  List<Object> get props => [message];
}