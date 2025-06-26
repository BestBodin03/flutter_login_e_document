class FINALCHECKlistCommonClass {
  // String SEQ;
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
  String DOCUMENT;
  // String SRAWDATA;
  // String RESULTDSW;

  FINALCHECKlistCommonClass({
    // this.SEQ = '',
    this.NO = 0,
    this.TYPE = '',
    this.ITEM = '',
    this.ITEMname = '',
    this.METHOD = '',
    this.METHODname = '',
    this.SCMARK = '',
    this.PCS = '',
    this.FREQUENCY = '',
    this.DOCUMENT = '',
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
}

class BasicCommonDATA {
  String PO;
  String CP;
  String FG;
  String CUSTOMER;
  String PART;
  String PARTNAME;
  String MATERIAL;
  String CUST_FULLNM;
  String PROCESS;
  String INSPECTIONSTDNO;
  String CUSLOT;
  String TPKLOT;
  String Pimg;

  String USER_STATUS;
  String reportset;

  String CusApprovedBySigned;
  String CusCheckedBySigned;

  String ApprovedByQASigned;
  String ApproveSigned;
  String CheckedBySigned;
  String IssuedBySigned;
  String PASS;

  BasicCommonDATA ({
    this.PO = '',
    this.CP = '',
    this.FG = '',
    this.CUSTOMER = '',
    this.PART = '',
    this.PARTNAME = '',
    this.MATERIAL = '',
    this.CUST_FULLNM = '',
    this.PROCESS = '',
    this.INSPECTIONSTDNO = '',
    this.CUSLOT = '',
    this.TPKLOT = '',
    this.Pimg = '',

    this.USER_STATUS = '',
    this.reportset = '',

    this.CusApprovedBySigned = '',
    this.CusCheckedBySigned = '',

    this.ApprovedByQASigned = '',
    this.ApproveSigned = '',
    this.CheckedBySigned = '',
    this.IssuedBySigned = '',
    this.PASS = ''

  });
}

class CommonReportOutput {
  CommonReportOutput({
    this.datain = const [],
    this.datafn = const [],
    required this.databasic,
  });

  List<FINALCHECKlistCommonClass> datain;
  List<FINALCHECKlistCommonClass> datafn;
  BasicCommonDATA databasic;
}
