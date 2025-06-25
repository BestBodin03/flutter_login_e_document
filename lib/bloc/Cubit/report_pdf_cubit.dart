// report_pdf_cubit.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newmaster/bloc/Cubit/report_pdf_state.dart';
import 'package:newmaster/page/P32ReportPDFcommon/ReportPDFCommonvar.dart';
import 'package:newmaster/page/P32ReportPDFcommon/entities_models/ReportPDFModels.dart';

class ReportPDFCubit extends Cubit<ReportPDFState> {
  ReportPDFCubit() : super(ReportPDFInitial());

Future<void> loadReportPDF(String assetPath) async {
  emit(ReportPDFLoading());
  try {
    final jsonString = await rootBundle.loadString(assetPath);
    final rawData = jsonDecode(jsonString);

    // Transform into expected structure
    final transformed = {
      'databasic': {
        'CP': rawData['CP'],
        'FG': rawData['FG'],
        'CUSTOMER': rawData['CUSTOMER'],
        'PART': rawData['PART'],
        'PARTNAME': rawData['PARTNAME'],
        'MATERIAL': rawData['MATERIAL'],
        'CUST_FULLNM': rawData['CUST_FULLNM'],
        'PROCESS': rawData['PROCESS'],
        'INSPECTIONSTDNO': rawData['INSPECTIONSTDNO'] ?? '',
        'TPKLOT': rawData['TPKLOT'] ?? '',
        'Pimg': rawData['Pimg']?['P1'] ?? '',
      },
      'datain': rawData['FINAL'] ?? [],
    };

    final report = CommonReportOutputModel.fromJson(transformed);

    final basic = report.databasic;
    ReportPDFCommonvar.CUSTOMER = basic.CUSTOMER ?? '';
    ReportPDFCommonvar.PARTNAME = basic.PARTNAME ?? '';
    ReportPDFCommonvar.PROCESS = basic.PROCESS ?? '';
    ReportPDFCommonvar.PART = basic.PART ?? '';
    ReportPDFCommonvar.MATERIAL = basic.MATERIAL ?? '';
    ReportPDFCommonvar.INSPECTIONSTDNO = basic.INSPECTIONSTDNO ?? '';

    emit(ReportPDFLoaded());
  } catch (e) {
    emit(ReportPDFError('Failed to load: $e'));
  }
}

}
