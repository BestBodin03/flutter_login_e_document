import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
class ReportPDFCommonvar {
  static bool iscontrol = false;
  static bool canf = true;
  static String PO = '';
  static bool HIDEDATAPIC = false;

  static String STATUS = '';

  static String CUSTOMERNAME='';
  static String PARTNAME = '';
  static String PARTNO = '';
  static String CONTROLPLANNO = '';
  static String PRODUCTSTAGES = '';
  static String PROCESS = '';
  static String MATERIAL= '';
  static String INSPECTIONSTDNO = '';

  static String TPKLOTEDIT = '';

  static String PICstd = '';
  static String PIC01 = '';
  static String PIC02 = '';
  static String TYPE = '-';
  static String SCMASKTYPE = "";
  static String SCMASKTYPEonTop = '';

  //rawlistCORE

  static List<rawlist> rawlistGraph = [];
  static rawlist rawlistGraphCore = rawlist();

  static String remark = '';

  static String PASS = '';

  static String commp = 'Compound layer';

  static String INC01 = '';
  static String INC02 = '';

  static String SignInsBy = '';

  static List<ReportPDFCommonlist> datalist = [
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
  ];
}

class ReportPDFCommonlist {
  ReportPDFCommonlist({
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
    this.DATA01 = '',
    this.DATA02 = '',
    this.DATA03 = '',
    this.DATAAVG = '',
    this.REMARK = '',
  });
  String ITEM;
  String ITEMname = '';
  String METHOD = '';
  String METHODname = '';
  String SCMARK = '';
  String FREQ = '';
  String SPECIFICATION = '';
  String SPECIFICATIONname = '';
  String SPECIFICATIONve = '';
  String RESULT = '';
  String CONTROLlimmit = '';
  String DATA01 = '';
  String DATA02 = '';
  String DATA03 = '';
  String DATAAVG = '';
  String REMARK = '';
}

class rawlist {
  rawlist({
    this.DATANO = '',
    this.DATAPCS = '',
    this.DATA = '',
  });
  String DATANO;
  String DATAPCS = '';
  String DATA = '';
}

ReportPDFACTclear() {
  ReportPDFCommonvar.PO = '';

  ReportPDFCommonvar.CUSTOMERNAME= '';
  ReportPDFCommonvar.PARTNAME = '';
  ReportPDFCommonvar.PARTNO = '';
  ReportPDFCommonvar.CONTROLPLANNO = '';
  ReportPDFCommonvar.PRODUCTSTAGES = '';
  ReportPDFCommonvar.PROCESS = '';
  ReportPDFCommonvar.MATERIAL= '';
  ReportPDFCommonvar.INSPECTIONSTDNO = '';

  ReportPDFCommonvar.PICstd = '';
  ReportPDFCommonvar.PIC01 = '';
  ReportPDFCommonvar.PIC02 = '';

  ReportPDFCommonvar.SignInsBy = '';
  ReportPDFCommonvar.datalist = [
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
  ];
}
