// report_pdf_cubit.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newmaster/bloc/Cubit/ReportPDFState.dart';
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
    final finalFN = jsonData['FINAL'] as List? ?? [];
    final imageP = jsonData['Pimg']?['P1'] ?? '';
    ReportPDFCommonvar.Pimg = imageP;
    // print(imageP);

// Incomming Method Mapping
    final Set<String> methodKeys = {
      for (var item in incoming)
        if (item['METHOD'] != null) item['METHOD'].toString()
    };

    final machineJsonStr = await rootBundle.loadString('assets/mockData/master_IC.MACHINE.json');
    final List<dynamic> machineList = jsonDecode(machineJsonStr);
    final Map<String, String> methodToMachineMethod = {};

    for (final method in methodKeys) {
      final match = machineList.firstWhere(
        (m) => m['masterID'] == method,
        orElse: () => null,
      );
       if (match != null) {
         final machineMethod = match['METHOD'];
         methodToMachineMethod[method] = machineMethod;

          // ✅ แสดงผลเช็ค
        print('🔍 METHOD Key: $method ➜ MACHINE METHOD: $machineMethod');
      } else {
          print('⚠️ ไม่พบ MACHINE ที่ masterID = $method');
        }
    }

// Final Method Mapping

    final Set<String> methodKeysFN = {
      for (var item in finalFN)
        if (item['METHOD'] != null) item['METHOD'].toString()
    };

    final machineJsonStrFN = await rootBundle.loadString('assets/mockData/master_FN.MACHINE.json');
    final List<dynamic> machineListFN = jsonDecode(machineJsonStrFN);
    final Map<String, String> methodToMachineMethodFN = {};

    for (final methodFN in methodKeysFN) {
      final matchFN = machineListFN.firstWhere(
        (m) => m['masterID'] == methodFN,
        orElse: () => null,
      );
      if (matchFN != null) {
        final machineMethodFN = matchFN['METHOD'];
        methodToMachineMethodFN[methodFN] = machineMethodFN;

        // ✅ แสดงผลเช็ค
        print('🔍 METHOD Key: $methodFN ➜ MACHINE METHOD: $machineMethodFN');
      } else {
        print('⚠️ ไม่พบ MACHINE ที่ masterID = $methodFN');
      }
    }

// Incoming Item Mapping

    final Set<String> itemKeys = {
      for (var item in incoming)
        if (item['ITEMs'] != null) item['ITEMs'].toString()
    };

    final itemJsonStr = await rootBundle.loadString('assets/mockData/master_IC.ITEMs.json');
    final List<dynamic> itemList = jsonDecode(itemJsonStr);
    final Map<String, String> itemToItemName = {};

    for (final itemName in itemKeys) {
      final match = itemList.firstWhere(
        (m) => m['masterID'] == itemName,
        orElse: () => null,
      );
      if (match != null) {
        final itemNameIC = match['ITEMs'];
        itemToItemName[itemName] = itemNameIC;

        // ✅ แสดงผลเช็ค
        print('🔍 Items Key: $itemName ➜ MACHINE METHOD: $itemNameIC');
      } else {
        print('⚠️ ไม่พบ Items ที่ masterID = $itemName');
      }
    }

// Final Item Mapping

    final Set<String> itemKeysFN = {
      for (var item in finalFN)
        if (item['ITEMs'] != null) item['ITEMs'].toString()
    };

    final itemJsonStrFN = await rootBundle.loadString('assets/mockData/master_FN.ITEMs.json');
    final List<dynamic> itemListFN = jsonDecode(itemJsonStrFN);
    final Map<String, String> itemToItemNameFN = {};

    for (final itemFN in itemKeysFN) {
      final match = itemListFN.firstWhere(
        (m) => m['masterID'] == itemFN,
        orElse: () => null,
      );
      if (match != null) {
        final itemNameFN = match['ITEMs'];
        itemToItemNameFN[itemFN] = itemNameFN;

        // ✅ แสดงผลเช็ค
        print('🔍 Items Key: $itemFN ➜ MACHINE METHOD: $itemNameFN');
      } else {
        print('⚠️ ไม่พบ Items ที่ masterID = $itemFN');
      }
    }

    // Final Remark (COMMENT) Mapping

    final Set<String> remarkKeysFN = {
      for (var item in finalFN)
        if (item['REMARK'] != null) item['REMARK'].toString()
    };

    final remarkJsonStrFN = await rootBundle.loadString('assets/mockData/master_FN.COMMENT.json');
    final List<dynamic> remarkListFN = jsonDecode(remarkJsonStrFN);
    final Map<String, String> remarkToCommentFN = {};

    for (final remarkFN in remarkKeysFN) {
      final matchFN = remarkListFN.firstWhere(
        (m) => m['masterID'] == remarkFN,
        orElse: () => null,
      );
      if (matchFN != null) {
        final remarkCommentFN = matchFN['COMMENT'];
        remarkToCommentFN[remarkFN] = remarkCommentFN;

        // ✅ แสดงผลเช็ค
        print('🔍 Remark Key: $remarkFN ➜ MACHINE METHOD: $remarkCommentFN');
      } else {
        print('⚠️ ไม่พบ Remark ที่ masterID = $remarkFN');
      }
    }

    // Incoming Remark (COMMENT) Mapping

    final Set<String> remarkKeys = {
      for (var item in finalFN)
        if (item['REMARK'] != null) item['REMARK'].toString()
    };

    final remarkJsonStr = await rootBundle.loadString('assets/mockData/master_IC.COMMENT.json');
    final List<dynamic> remarkList = jsonDecode(remarkJsonStr);
    final Map<String, String> remarkToComment = {};

    for (final remark in remarkKeys) {
      final match = remarkList.firstWhere(
        (m) => m['masterID'] == remark,
        orElse: () => null,
      );
      if (match != null) {
        final remarkComment = match['COMMENT'];
        remarkToComment[remark] = remarkComment;

        // ✅ แสดงผลเช็ค
        print('🔍 Remark Key: $remark ➜ MACHINE METHOD: $remarkComment');
      } else {
        print('⚠️ ไม่พบ Remark ที่ masterID = $remark');
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
    'datafn': finalFN,
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


    emit(ReportPDFLoaded(report,
     methodToMachineMethod : methodToMachineMethod, 
     methodToMachineMethodFN : methodToMachineMethodFN, 
     itemToItemName: itemToItemName,
     itemToItemNameFN: itemToItemNameFN,
     remarkToCommentFN: remarkToCommentFN,
     remarkToComment: remarkToComment)
     );
  } catch (e) {
    emit(ReportPDFError('Failed to load: $e'));
  }
}

}
