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
    final jsonData = jsonDecode(jsonString);
    // // ✅ ตรวจสอบ DOCUMENT และ SPECIFICATION.name จาก INCOMING
    final incoming = jsonData['INCOMMING'] as List? ?? [];
    final imageP = jsonData['Pimg']?['P1'] ?? '';
    ReportPDFCommonvar.Pimg = imageP;
    // print(imageP);

    final Set<String> methodKeys = {
      for (var item in incoming)
        if (item['METHOD'] != null) item['METHOD'].toString()
    };

    final Set<String> methodKeysFN = {
      for (var item in incoming)
        if (item['METHOD'] != null) item['METHOD'].toString()
    };

    final machineJsonStr = await rootBundle.loadString('assets/mockData/master_IC.MACHINE.json');
    final List<dynamic> machineList = jsonDecode(machineJsonStr);
    final Map<String, String> methodToMachineMethod = {};

    final machineJsonStrFN = await rootBundle.loadString('assets/mockData/master_FN.MACHINE.json');
    final List<dynamic> machineListFN = jsonDecode(machineJsonStr);
    final Map<String, String> methodToMachineMethodFN = {};

  for (final methodFN in methodKeysFN) {
    final match = machineListFN.firstWhere(
      (m) => m['masterID'] == methodFN,
      orElse: () => null,
    );
    if (match != null) {
      final machineMethodFN = match['METHOD'];
      methodToMachineMethodFN[methodFN] = machineMethodFN;

      // ✅ แสดงผลเช็ค
      print('🔍 METHOD Key: $methodFN ➜ MACHINE METHOD: $machineMethodFN');
    } else {
      print('⚠️ ไม่พบ MACHINE ที่ masterID = $methodFN');
    }
  }



    // print(incoming);
    // print(incoming.length);
    // for (var item in incoming) {
    //   final doc = item['SEQ']?.toString() ?? '';;
    //   final specList = item['SPECIFICATION'] as List<dynamic>? ?? [];
    //   final specName = specList.isNotEmpty
    //       ? specList[0]['name']?.toString() ?? ''
    //       : '';

    //   print('📄 DOCUMENT: $doc');
    //   print('🔧 SPECIFICATION name: $specName');
    // }

    // Transform into expected structure
  final transformed = {
    'databasic': {
      'CP': jsonData['CP'],
      'FG': jsonData['FG'],
      'CUSTOMER': jsonData['CUSTOMER'],
      'PART': jsonData['PART'],
      'PARTNAME': jsonData['PARTNAME'],
      'CONTROLPLANNO': jsonData['CP'],
      'MATERIAL': jsonData['MATERIAL'],
      'CUST_FULLNM': jsonData['CUST_FULLNM'],
      'PROCESS': jsonData['PROCESS'],
      'INSPECTIONSTDNO': jsonData['INSPECTIONSTDNO'] ?? '',
      'TPKLOT': jsonData['TPKLOT'] ?? '',
    },
    'datain': incoming,
    'datafn': jsonData['FINAL'] as List? ?? [],
  };


    final report = CommonReportOutputModel.fromJson(transformed);

    /* 
    IF WANT TO ASSIGN TO STATIC VAR
    */

    final basic = report.databasic;

    // ReportPDFCommonvar.CUSTOMER = basic.CUSTOMER ?? '';
    // ReportPDFCommonvar.PARTNAME = basic.PARTNAME ?? '';
    // ReportPDFCommonvar.PROCESS = basic.PROCESS ?? '';
    // ReportPDFCommonvar.PART = basic.PART ?? '';
    // ReportPDFCommonvar.MATERIAL = basic.MATERIAL ?? '';
    // ReportPDFCommonvar.INSPECTIONSTDNO = basic.INSPECTIONSTDNO ?? '';
    // String base64Image = basic.Pimg ?? '';
    // ReportPDFCommonvar.Pimg = 


    emit(ReportPDFLoaded(report, methodToMachineMethod : methodToMachineMethod, methodToMachineMethodFN : methodToMachineMethodFN));
  } catch (e) {
    emit(ReportPDFError('Failed to load: $e'));
  }
}

}
