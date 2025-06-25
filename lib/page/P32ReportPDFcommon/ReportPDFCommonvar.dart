import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
class ReportPDFCommonvar {
  static bool iscontrol = false;
  static bool canf = true;
  static String PO = '';
  static bool HIDEDATAPIC = false;

  static String STATUS = '';
  static String CP = '';
  static String FG = '';
  static String CUSTOMER = '';
  static String PART = '';
  static String PARTNAME = '';
  static String MATERIAL = '';
  static String CUST_FULLNM = '';
  static String PROCESS = '';
  static String INSPECTIONSTDNO = '';
  static String CUSLOT = '';
  static String TPKLOT = '';
  static String Pimg = '';

  static String USER_STATUS = '';
  static String reportset = '';

  static String CusApprovedBySigned = '';
  static String CusCheckedBySigned = '';

  static String ApprovedByQASigned = '';
  static String ApproveSigned = '';
  static String CheckedBySigned = '';
  static String IssuedBySigned = '';

  static String commp = 'Compound layer';
  static String TPKLOTEDIT = '';
  static String TYPE = '';
  static String PASS = '';
  static String SignInsBy = '';
  
}

class ReportPDFCommonlist {
  ReportPDFCommonlist({
    this.NO = 0,
    this.TYPE = '',
    this.ITEM = '',
    this.ITEMname = '',
    this.METHOD = '',
    this.METHODname = '',
    this.SCMARK = '',
    this.PCS = '',
    this.FREQUENCY = '',
    // this.SPECIFICATION = '',
    this.SPECIFICATIONname = '',
    // this.SPECIFICATIONve = '',
    // this.RESULT = '',
    // this.CONTROLlimmit = '',
    this.LOAD = '',
    this.Cross = '',
    this.REMARK = '',
    this.REMARKDETAIL = '',
    // this.SRAWDATA = '',
    // this.RESULTDSW = '',
  });
  int NO;
  String TYPE;
  String ITEM;
  String ITEMname;
  String METHOD;
  String METHODname;
  String SCMARK;
  String PCS;
  String FREQUENCY;
  // String SPECIFICATION;
  String SPECIFICATIONname;
  // String SPECIFICATIONve;
  // String RESULT;
  // String CONTROLlimmit;
  String LOAD;
  String Cross;
  String REMARK;
  String REMARKDETAIL;
  // String SRAWDATA;
  // String RESULTDSW;
}

ReportPDFACTclear() {
  ReportPDFCommonvar.PO = '';

  ReportPDFCommonvar.CP = '';
  ReportPDFCommonvar.FG = '';
  ReportPDFCommonvar.CUSTOMER = '';
  ReportPDFCommonvar.PART = '';
  ReportPDFCommonvar.PARTNAME = '';
  ReportPDFCommonvar.MATERIAL = '';
  ReportPDFCommonvar.CUST_FULLNM = '';
  ReportPDFCommonvar.TPKLOTEDIT = '';
  ReportPDFCommonvar.TYPE = '';
}
