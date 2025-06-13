import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:flutter/widgets.dart';

class FINALCHECKlistCommonClass {
  FINALCHECKlistCommonClass({
    this.NO = 0,
    this.TYPE = '',
    this.ITEM = '',
    this.ITEMname = '',
    this.METHOD = '',
    this.METHODname = '',
    this.SCMARK = '',
    this.FREQ = '',
    this.SPECIFICATION = '',
    this.SPECIFICATIONname = '',
    this.SPECIFICATIONve = '',
    this.RESULT = '',
    this.CONTROLlimmit = '',
    this.LOAD = '',
    this.Cross = '',
    this.Remark = '',
    this.SRAWDATA = '',
    this.RESULTDSW = '',
    //
  });
  int NO;
  String TYPE;
  String ITEM;
  String ITEMname;
  String METHOD;
  String METHODname;
  String SCMARK;
  String FREQ;
  String SPECIFICATION;
  String SPECIFICATIONname;
  String SPECIFICATIONve;
  String RESULT;
  String CONTROLlimmit;
  String LOAD;
  String Cross;
  String Remark;
  String SRAWDATA;
  String RESULTDSW;
//
}

class BasicCommonDATA {
  BasicCommonDATA({
    this.PO = '',
    this.CP = '',
    this.CUSTOMERNAME = '',
    this.PROCESS = '',
    this.PARTNAME = '',
    this.PARTNO = '',
    this.CUSLOT = '',
    this.TPKLOT = '',
    this.MATERIAL = '',
    this.QTY = '',
    this.UNITSAP = '',
    this.PICstd = '',
    this.PIC01 = '',
    this.PIC02 = '',
    this.PIC03 = '',
    this.PARTNAMEref = '',
    this.PARTref = '',
    this.PASS = '',
    this.INC01 = '',
    this.INC02 = '',
    this.USER_STATUS = '',
    this.reportset = '',
    this.ITEMPIC01 = '',
    this.ITEMPIC02 = '',
    this.ITEMPIC03 = '',
    this.Inspected = '',
    this.Check = '',
    this.Approve = '',
    this.Inspected_sign = '',
    this.Check_sign = '',
    this.Approve_sign = '',
  });

  String PO;
  String CP;
  String CUSTOMERNAME;
  String PROCESS;
  String PARTNAME;
  String PARTNO;
  String CUSLOT;
  String TPKLOT;
  String MATERIAL;
  String QTY;
  String PICstd;
  String UNITSAP;
  String PIC01;
  String PIC02;
  String PIC03;

  String PARTNAMEref;
  String PARTref;

  String PASS;

  String INC01;
  String INC02;

  String USER_STATUS;
  String reportset;

  String ITEMPIC01;
  String ITEMPIC02;
  String ITEMPIC03;

  String Inspected;
  String Check;
  String Approve;

  String Inspected_sign;
  String Check_sign;
  String Approve_sign;

  factory BasicCommonDATA.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'PO': String PO,
        'CP': String CP,
        'CUSTOMERNAME': String CUSTOMERNAME,
        'PROCESS': String PROCESS,
        'PARTNAME': String PARTNAME,
        'PARTNO': String PARTNO,
        'CUSLOT': String CUSLOT,
        'TPKLOT': String TPKLOT,
        'MATERIAL': String MATERIAL,
        'QTY': String QTY,
        'PICstd': String PICstd,
        'UNITSAP': String UNITSAP,
        'PIC01': String PIC01,
        'PIC02': String PIC02,
        'PIC03': String PIC03,

        'PARTNAMEref': String PARTNAMEref,
        'PARTref': String PARTref,
        'PASS': String PASS,
        'INC01': String INC01,
        'INC02': String INC02,
      } => BasicCommonDATA(
        PO: PO,
        CP: CP,
        CUSTOMERNAME: CUSTOMERNAME,
        PROCESS: PROCESS,
        PARTNAME: PARTNAME,
        PARTNO: PARTNO,
        CUSLOT: CUSLOT,
        TPKLOT: TPKLOT,
        MATERIAL: MATERIAL,
        QTY: QTY,
        PICstd: PICstd,
        UNITSAP: UNITSAP,
        PIC01: PIC01,
        PIC02: PIC02,
        PIC03: PIC03,
        PARTNAMEref: PARTNAMEref,
        PARTref: PARTref,
        PASS: PASS,
        INC01: INC01,
        INC02: INC02,

      ),
      _=> throw const FormatException('เกิดข้อผิดผลาดในการโหลดข้อมูล')

    };

  }
}

class CommonReportOutput {
  CommonReportOutput({
    this.datain = const [],  // DATA MUST CONVERT FROM JSON TO FLUTTER OBJ AND COLLECT TO THIS
    required this.databasic,
  });

  List<FINALCHECKlistCommonClass> datain;
  BasicCommonDATA databasic;
  
  factory CommonReportOutput.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'databasic': BasicCommonDATA databasic,
      } => CommonReportOutput(
        databasic: databasic,
      ),
      _=> throw const FormatException('เกิดข้อผิดผลาดในการโหลดข้อมูล')
    };
  }
}


// Future<CommonReportOutput> fetchCommonReportOutput() async {
//   final String response = await rootBundle.loadString('assets/mockData/testCP.json');
//   final data = jsonDecode(response) as Map<BasicCommonDATA, dynamic>;
//   return CommonReportOutput.fromJson(data);
// }

Future<CommonReportOutput> fetchCommonReportOutput() async {
  final String response = await rootBundle.loadString('assets/mockData/testCP.json');
  
  // Print the raw JSON response
  print('Raw JSON response:\n$response'); // good for long strings

  final data = jsonDecode(response) as Map<String, dynamic>;
  
  // Optional: print decoded data
  print('Decoded JSON:\n$data');

  return CommonReportOutput.fromJson(data);
}


