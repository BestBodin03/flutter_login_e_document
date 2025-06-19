// report_pdf_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newmaster/bloc/BlocEvent/AbstractEvent/PhInspectionStandardEvent.dart';
import 'package:newmaster/bloc/BlocState/PhInspectionStandardState.dart';
import 'package:newmaster/page/P32ReportPDFcommon/ReportPDFCommonvar.dart';
import 'package:newmaster/page/P32ReportPDFcommon/entities_models/ReportPDF.dart';
import 'package:newmaster/page/P32ReportPDFcommon/entities_models/ReportPDFModels.dart';

class ReportPdfBloc extends Bloc<PhInspectionStandardEvent, PhInspectionStandardState> {
  ReportPdfBloc() : super(ReportPdfInitial()) {
    on<LoadReportDataEvent>(_onLoadReportData);
    on<UpdateReportDataEvent>(_onUpdateReportData);
    on<ClearReportDataEvent>(_onClearReportData);
    on<UpdateBasicDataEvent>(_onUpdateBasicData);
    on<UpdateChecklistItemEvent>(_onUpdateChecklistItem);
  }

  void _onLoadReportData(LoadReportDataEvent event, Emitter<PhInspectionStandardState> emit) async {
    emit(ReportPdfLoading());
    
    try {
      // Simulate API call or data loading
      await Future.delayed(const Duration(seconds: 1));
      
      // Create default data
      final basicData = BasicCommonDATAModel(
        PO: event.po,
        CP: '',
        FG: '',
        CUSTOMER: '',
        PART: '',
        PARTNAME: '',
        MATERIAL: '',
        CUST_FULLNM: '',
        PROCESS: '',
        INSPECTIONSTDNO: '',
        CUSLOT: '',
        TPKLOT: '',
        Pimg: '',
        USER_STATUS: '',
        reportset: '',
      );

      final checklistData = List.generate(7, (index) => 
        FINALCHECKlistCommonClassModel(
          NO: index + 1,
          TYPE: '',
          ITEM: '',
          ITEMname: '',
          METHOD: '',
          METHODname: '',
          SCMARK: '',
          PCS: '',
          FREQUENCY: '',
          SPECIFICATIONname: '',
          LOAD: '',
          Cross: '',
          REMARK: '',
          REMARKDETAIL: '',
        )
      );

      emit(ReportPdfLoaded(
        basicData: basicData,
        checklistData: checklistData,
      ));

      // Update static variables
      _updateStaticVariables(basicData, checklistData);

    } catch (e) {
      emit(ReportPdfError(message: e.toString()));
    }
  }

  void _onUpdateReportData(UpdateReportDataEvent event, Emitter<PhInspectionStandardState> emit) {
    if (state is ReportPdfLoaded) {
      final currentState = state as ReportPdfLoaded;
      
      // Safely convert to model types
      final basicDataModel = _convertToBasicDataModel(event.reportData.databasic);
      final checklistDataModel = _convertToChecklistModels(event.reportData.datain);
      
      emit(currentState.copyWith(
        reportData: event.reportData,
        basicData: basicDataModel,
        checklistData: checklistDataModel,
      ));

      // Update static variables
      _updateStaticVariables(basicDataModel, checklistDataModel);
    }
  }

  // Helper methods for type conversion
  BasicCommonDATAModel _convertToBasicDataModel(BasicCommonDATA basicData) {
    if (basicData is BasicCommonDATAModel) {
      return basicData;
    }
    
    // Create new model from base class properties
    return BasicCommonDATAModel(
      PO: basicData.PO,
      CP: basicData.CP,
      FG: basicData.FG,
      CUSTOMER: basicData.CUSTOMER,
      PART: basicData.PART,
      PARTNAME: basicData.PARTNAME,
      MATERIAL: basicData.MATERIAL,
      CUST_FULLNM: basicData.CUST_FULLNM,
      PROCESS: basicData.PROCESS,
      INSPECTIONSTDNO: basicData.INSPECTIONSTDNO,
      CUSLOT: basicData.CUSLOT,
      TPKLOT: basicData.TPKLOT,
      Pimg: basicData.Pimg,
      USER_STATUS: basicData.USER_STATUS,
      reportset: basicData.reportset,
      CusApprovedBySigned: basicData.CusApprovedBySigned,
      CusCheckedBySigned: basicData.CusCheckedBySigned,
      ApprovedByQASigned: basicData.ApprovedByQASigned,
      ApproveSigned: basicData.ApproveSigned,
      CheckedBySigned: basicData.CheckedBySigned,
      IssuedBySigned: basicData.IssuedBySigned,
    );
  }

  List<FINALCHECKlistCommonClassModel> _convertToChecklistModels(List<FINALCHECKlistCommonClass>? datain) {
    if (datain == null) return [];
    
    return datain.map((item) {
      if (item is FINALCHECKlistCommonClassModel) {
        return item;
      }
      
      // Create new model from base class properties
      return FINALCHECKlistCommonClassModel(
        NO: item.NO,
        TYPE: item.TYPE,
        ITEM: item.ITEM,
        ITEMname: item.ITEMname,
        METHOD: item.METHOD,
        METHODname: item.METHODname,
        SCMARK: item.SCMARK,
        PCS: item.PCS,
        FREQUENCY: item.FREQUENCY,
        SPECIFICATIONname: item.SPECIFICATIONname,
        LOAD: item.LOAD,
        Cross: item.Cross,
        REMARK: item.REMARK,
        REMARKDETAIL: item.REMARKDETAIL,
      );
    }).toList();
  }

  void _onClearReportData(ClearReportDataEvent event, Emitter<PhInspectionStandardState> emit) {
    final basicData = BasicCommonDATAModel();
    final checklistData = List.generate(7, (index) => FINALCHECKlistCommonClassModel());

    emit(ReportPdfLoaded(
      basicData: basicData,
      checklistData: checklistData,
    ));

    // Clear static variables
    _clearStaticVariables();
  }

  void _onUpdateBasicData(UpdateBasicDataEvent event, Emitter<PhInspectionStandardState> emit) {
    if (state is ReportPdfLoaded) {
      final currentState = state as ReportPdfLoaded;
      
      emit(currentState.copyWith(basicData: event.basicData));
      
      // Update static variables
      _updateBasicStaticVariables(event.basicData);
    }
  }

  void _onUpdateChecklistItem(UpdateChecklistItemEvent event, Emitter<PhInspectionStandardState> emit) {
    if (state is ReportPdfLoaded) {
      final currentState = state as ReportPdfLoaded;
      final updatedList = List<FINALCHECKlistCommonClassModel>.from(currentState.checklistData);
      
      if (event.index >= 0 && event.index < updatedList.length) {
        updatedList[event.index] = event.item;
        
        emit(currentState.copyWith(checklistData: updatedList));
        
        // Update static variables
        _updateChecklistStaticVariables(updatedList);
      }
    }
  }

  // Helper methods to update static variables
  void _updateStaticVariables(BasicCommonDATAModel basicData, List<FINALCHECKlistCommonClassModel> checklistData) {
    _updateBasicStaticVariables(basicData);
    _updateChecklistStaticVariables(checklistData);
  }

  void _updateBasicStaticVariables(BasicCommonDATAModel basicData) {
    ReportPDFCommonvar.PO = basicData.PO;
    ReportPDFCommonvar.CP = basicData.CP;
    ReportPDFCommonvar.FG = basicData.FG;
    ReportPDFCommonvar.CUSTOMER = basicData.CUSTOMER;
    ReportPDFCommonvar.PART = basicData.PART;
    ReportPDFCommonvar.PARTNAME = basicData.PARTNAME;
    ReportPDFCommonvar.MATERIAL = basicData.MATERIAL;
    ReportPDFCommonvar.CUST_FULLNM = basicData.CUST_FULLNM;
    ReportPDFCommonvar.PROCESS = basicData.PROCESS;
    ReportPDFCommonvar.INSPECTIONSTDNO = basicData.INSPECTIONSTDNO;
    ReportPDFCommonvar.CUSLOT = basicData.CUSLOT;
    ReportPDFCommonvar.TPKLOT = basicData.TPKLOT;
    ReportPDFCommonvar.Pimg = basicData.Pimg;
    ReportPDFCommonvar.USER_STATUS = basicData.USER_STATUS;
    ReportPDFCommonvar.reportset = basicData.reportset;
    ReportPDFCommonvar.CusApprovedBySigned = basicData.CusApprovedBySigned;
    ReportPDFCommonvar.CusCheckedBySigned = basicData.CusCheckedBySigned;
    ReportPDFCommonvar.ApprovedByQASigned = basicData.ApprovedByQASigned;
    ReportPDFCommonvar.ApproveSigned = basicData.ApproveSigned;
    ReportPDFCommonvar.CheckedBySigned = basicData.CheckedBySigned;
    ReportPDFCommonvar.IssuedBySigned = basicData.IssuedBySigned;
  }

  void _updateChecklistStaticVariables(List<FINALCHECKlistCommonClassModel> checklistData) {
    ReportPDFCommonvar.datalist = checklistData.map((item) => ReportPDFCommonlist(
      NO: item.NO,
      TYPE: item.TYPE,
      ITEM: item.ITEM,
      ITEMname: item.ITEMname,
      METHOD: item.METHOD,
      METHODname: item.METHODname,
      SCMARK: item.SCMARK,
      PCS: item.PCS,
      FREQUENCY: item.FREQUENCY,
      SPECIFICATIONname: item.SPECIFICATIONname,
      LOAD: item.LOAD,
      Cross: item.Cross,
      REMARK: item.REMARK,
      REMARKDETAIL: item.REMARKDETAIL,
    )).toList();
  }

  void _clearStaticVariables() {
    ReportPDFACTclear();
  }
}