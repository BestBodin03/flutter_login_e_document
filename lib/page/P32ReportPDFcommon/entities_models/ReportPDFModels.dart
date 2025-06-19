import 'dart:convert';

import 'package:flutter/services.dart';

import 'ReportPDF.dart';

class FINALCHECKlistCommonClassModel extends FINALCHECKlistCommonClass {
  FINALCHECKlistCommonClassModel({
    super.NO = 0,
    super.TYPE = '',
    super.ITEM = '',
    super.ITEMname = '',
    super.METHOD = '',
    super.METHODname = '',
    super.SCMARK = '',
    super.PCS = '',
    super.FREQUENCY = '',
    super.SPECIFICATIONname = '',
    super.LOAD = '',
    super.Cross = '',
    super.REMARK = '',
    super.REMARKDETAIL = '',

    // this.SPECIFICATIONve = '',
    // this.RESULT = '',
    // this.CONTROLlimmit = '',
    // this.SPECIFICATION = '',
    // this.SRAWDATA = '',
    // this.RESULTDSW = '',
  });

  factory FINALCHECKlistCommonClassModel.fromJson(Map<String, dynamic> jsonData) {
    return FINALCHECKlistCommonClassModel(
    NO: jsonData['NO'] ?? 0,
    TYPE: jsonData['TYPE'] ?? '',
    ITEM: jsonData['ITEM'] ?? '',
    ITEMname: jsonData['ITEMname'] ?? '',
    METHOD: jsonData['METHOD'] ?? '',
    METHODname: jsonData['METHODname'] ?? '',
    SCMARK: jsonData['FINAL']['SEQ'] ?? '',
    PCS: jsonData['FINAL']['PCS'] ?? '',
    FREQUENCY: jsonData['FINAL']['FREQUENCY'] ?? '',
    SPECIFICATIONname: jsonData['FINAL']['SPECIFICATION']['name'] ?? '',
    LOAD: jsonData['LOAD'] ?? '',
    Cross: jsonData['CROSS'] ?? '',
    REMARK: jsonData['REMARK'] ?? '',
    REMARKDETAIL: jsonData['REMARKDETAIL'] ?? '',


      // SPECIFICATION: json['SPECIFICATION'] ?? '',
      // SPECIFICATIONve: json['SPECIFICATIONve'] ?? '',
      // RESULT: json['RESULT'] ?? '',
      // CONTROLlimmit: json['CONTROLlimmit'] ?? '',
      // SRAWDATA: json['SRAWDATA'] ?? '',
      // RESULTDSW: json['RESULTDSW'] ?? '',
    );
  }
}

class BasicCommonDATAModel extends BasicCommonDATA {
  BasicCommonDATAModel({
    super.PO = '',
    super.CP = '',
    super.FG = '',
    super.CUSTOMER = '',
    super.PART = '',
    super.PARTNAME = '',
    super.MATERIAL = '',
    super.CUST_FULLNM = '',
    super.PROCESS = '',
    super.INSPECTIONSTDNO = '',
    super.CUSLOT = '',
    super.TPKLOT = '',
    super.Pimg = '',

    super.USER_STATUS = '',
    super.reportset = '',

    super.CusApprovedBySigned = '',
    super.CusCheckedBySigned = '',

    super.ApprovedByQASigned = '',
    super.ApproveSigned = '',
    super.CheckedBySigned = '',
    super.IssuedBySigned = ''
  });

  factory BasicCommonDATAModel.fromJson(Map<String, dynamic> json) {
    return BasicCommonDATAModel(
      PO: json['PO'] ?? '',
      CP: json['CP'] ?? '',
      CUSTOMER: json['CUSTOMER'] ?? '',
      PROCESS: json['PROCESS'] ?? '',
      PARTNAME: json['PARTNAME'] ?? '',
      CUSLOT: json['CUSLOT'] ?? '',
      TPKLOT: json['TPKLOT'] ?? '',
      MATERIAL: json['MATERIAL'] ?? '',

      USER_STATUS: json['USER_STATUS'] ?? '',
      reportset: json['reportset'] ?? '',

      // QTY: json['QTY'] ?? '',
      // UNITSAP: json['UNITSAP'] ?? '',
      // PICstd: json['PICstd'] ?? '',
      // PIC01: json['PIC01'] ?? '',
      // PIC02: json['PIC02'] ?? '',
      // PIC03: json['PIC03'] ?? '',
      // PARTNAMEref: json['PARTNAMEref'] ?? '',
      // PARTref: json['PARTref'] ?? '',
      // PASS: json['PASS'] ?? '',
      // INC01: json['INC01'] ?? '',
      // INC02: json['INC02'] ?? '',
      // ITEMPIC01: json['ITEMPIC01'] ?? '',
      // ITEMPIC02: json['ITEMPIC02'] ?? '',
      // ITEMPIC03: json['ITEMPIC03'] ?? '',
      // Inspected: json['Inspected'] ?? '',
      // Check: json['Check'] ?? '',
      // Approve: json['Approve'] ?? '',
      // Inspected_sign: json['Inspected_sign'] ?? '',
      // Check_sign: json['Check_sign'] ?? '',
      // Approve_sign: json['Approve_sign'] ?? '',
    );
  }
}

class CommonReportOutputModel extends CommonReportOutput {
  CommonReportOutputModel({
    super.datain,
    required super.databasic,
  });

  factory CommonReportOutputModel.fromJson(Map<String, dynamic> json) {
    return CommonReportOutputModel(
      databasic: BasicCommonDATAModel.fromJson(json['databasic']),
      datain: (json['datain'] as List<dynamic>)
          .map((item) => FINALCHECKlistCommonClassModel.fromJson(item))
          .toList(),
    );
  }
}

