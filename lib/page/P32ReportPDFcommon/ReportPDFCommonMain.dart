import 'dart:convert';
import 'dart:core';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:newmaster/widget/ReportComponent/ReportImageCard.dart';
import 'package:newmaster/widget/ReportComponent/SignSideWithCustomerInspectionStandard.dart';
import 'package:newmaster/widget/ReportComponent/SingleSelectCheckboxRow.dart';
import 'package:newmaster/widget/common/CheckboxC.dart';
import 'package:newmaster/widget/common/ComBtnImage.dart';
import 'package:newmaster/widget/common/Radiobutton.dart';
import 'package:newmaster/widget/common/imgset.dart';

import '../../Layout/head2.dart';
import '../../data/global.dart';

import '../../widget/GRAPH/LineGraph01.dart';
import '../../widget/ReportComponent/CommonReport.dart';
import '../../widget/ReportComponent/PicSlot.dart';
import '../../widget/ReportComponent/SignSide.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';

import '../../widget/common/IMGview.dart';
import '../../widget/common/Safty.dart';
import 'ReportPDFCommonvar.dart';
import 'classtest.dart';

Uint8List imageBytes = base64Decode(inspectStandarSampleImg);

late BuildContext ReportPDFCommoncontext;

class ReportPDFCommon extends StatefulWidget {
  ReportPDFCommon({
    Key? key,
    this.dataCommon,
  }) : super(key: key);
  CommonReportOutput? dataCommon;
  @override
  State<ReportPDFCommon> createState() => _ReportPDFCommonState();
}

class _ReportPDFCommonState extends State<ReportPDFCommon> {
  @override
  void initState() {
    ReportPDFCommonvar.TPKLOTEDIT = '';
    print("ma rel");
    if (ReportPDFCommonvar.PO != '') {
      ReportPDFCommonvar.canf = false;
      // context
      //     .read<ReportPDFCommon_Cubit>()
      //     .ReportPDFCommonCubit(ReportPDFCommonvar.PO, "");
    }
    super.initState();
  }

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ReportPDFCommoncontext = context;

    CommonReportOutput _dataCOMMON = widget.dataCommon ??
        CommonReportOutput(
          databasic: BasicCommonDATA(),
        );
    int HardnessNO = 1;
    int CoreNO = 1;
    int GraphNO = 1;
    int CompoundNO = 1;
    int RoughnessNO = 1;
    if (_dataCOMMON.datain.isNotEmpty) {
      //
      ReportPDFCommonvar.STATUS = 'REPORT READY';
      ReportPDFCommonvar.CUSTOMERNAME= '';
      ReportPDFCommonvar.PARTNAME = '';
      ReportPDFCommonvar.PARTNO = '';
      ReportPDFCommonvar.CONTROLPLANNO = '';
      ReportPDFCommonvar.PRODUCTSTAGES = '';
      ReportPDFCommonvar.PROCESS = '';
      ReportPDFCommonvar.MATERIAL= '';
      ReportPDFCommonvar.INSPECTIONSTDNO = '';

      ReportPDFCommonvar.PIC01 = _dataCOMMON.databasic.PIC01;
      ReportPDFCommonvar.PIC02 = _dataCOMMON.databasic.PIC02;
      ReportPDFCommonvar.PICstd = _dataCOMMON.databasic.PICstd;

      ReportPDFCommonvar.PASS = _dataCOMMON.databasic.PASS;
      ReportPDFCommonvar.remark = '';
      if (_dataCOMMON.databasic.PARTNAMEref != '') {
        ReportPDFCommonvar.remark =
            'Reference data from\n${_dataCOMMON.databasic.PARTNAMEref}\n${_dataCOMMON.databasic.PARTref}';
      }

      ReportPDFCommonvar.INC01 = _dataCOMMON.databasic.INC01;
      ReportPDFCommonvar.INC02 = _dataCOMMON.databasic.INC02;
//remark

      // print(_dataCOMMON.datain[0]);
      // print(_dataCOMMON.datain.length);
      ReportPDFCommonvar.rawlistHardness = [];
      ReportPDFCommonvar.rawlistCompound = [];
      ReportPDFCommonvar.rawlistRoughness = [];
      ReportPDFCommonvar.rawlistCORE = [];

      ReportPDFCommonvar.graphupper = [];
      ReportPDFCommonvar.graphdata = [];
      ReportPDFCommonvar.graphdata2 = [];
      ReportPDFCommonvar.graphdata3 = [];
      ReportPDFCommonvar.graphdata4 = [];
      ReportPDFCommonvar.graphunder = [];

      for (var i = 0; i < _dataCOMMON.datain.length; i++) {
        String Loadin = '';
        if (_dataCOMMON.datain[i].LOAD != '' &&
            _dataCOMMON.datain[i].LOAD != '-') {
          Loadin = "( Load ${_dataCOMMON.datain[i].LOAD} )";
        }
        ReportPDFCommonvar.datalist[i].ITEMname =
            " ${_dataCOMMON.datain[i].ITEMname} ${Loadin}";
        ReportPDFCommonvar.datalist[i].SCMARK = _dataCOMMON.datain[i].SCMARK;
        ReportPDFCommonvar.datalist[i].METHODname =
            _dataCOMMON.datain[i].METHODname;
        ReportPDFCommonvar.datalist[i].FREQ = _dataCOMMON.datain[i].FREQ;
        ReportPDFCommonvar.datalist[i].SPECIFICATIONname =
            _dataCOMMON.datain[i].SPECIFICATION;
        ReportPDFCommonvar.datalist[i].RESULT = _dataCOMMON.datain[i].RESULT;
        ReportPDFCommonvar.datalist[i].REMARK = _dataCOMMON.datain[i].Remark;
        //print(ReportPDFCommonvar.datalist[i].RESULT.length);
        //Surface Hardness

        if (_dataCOMMON.datain[i].TYPE == 'Number') {
          if (_dataCOMMON.datain[i].SRAWDATA != 'NO') {
            if (_dataCOMMON.datain[i].ITEMname
                    .toUpperCase()
                    .contains('HARDNESS') &&
                _dataCOMMON.datain[i].ITEMname.toUpperCase().contains('CORE') ==
                    false) {
              for (var li = 0;
                  li < _dataCOMMON.datain[i].datapackset.length;
                  li++) {
                // print(_dataCOMMON.datain[i].datapackset[li].dimensionX);

                if (_dataCOMMON.datain[i].datapackset[li].dimensionX == 0) {}
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 1) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '1',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA01,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 2) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '2',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA02,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 3) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '3',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA03,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 4) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '4',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '5',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '6',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '7',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '8',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '9',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '10',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '11',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '12',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '13',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '14',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '15',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '16',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '17',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '18',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '19',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
                  ReportPDFCommonvar.rawlistHardness.add(rawlist(
                    DATANO: HardnessNO.toString(),
                    DATAPCS: '20',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA20,
                  ));
                }
                HardnessNO++;
                // print('>>${HardnessNO}');
              }
            } else if (_dataCOMMON.datain[i].ITEMname
                .toUpperCase()
                .contains('CORE')) {
              for (var li = 0;
                  li < _dataCOMMON.datain[i].datapackset.length;
                  li++) {
                // print(_dataCOMMON.datain[i].datapackset[li].dimensionX);

                if (_dataCOMMON.datain[i].datapackset[li].dimensionX == 0) {}
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 1) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '1',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA01,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 2) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '2',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA02,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 3) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '3',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA03,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 4) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '4',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '5',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '6',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '7',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '8',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '9',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '10',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '11',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '12',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '13',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '14',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '15',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '16',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '17',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '18',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '19',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
                  ));
                }
                if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
                  ReportPDFCommonvar.rawlistCORE.add(rawlist(
                    DATANO: CoreNO.toString(),
                    DATAPCS: '20',
                    DATA: _dataCOMMON.datain[i].datapackset[li].DATA20,
                  ));
                }
                CoreNO++;
                // print('>>${CoreNO}');
              }
            }
          }
          //  CoreNO++;
        }

        if (_dataCOMMON.datain[i].TYPE == 'Graph') {
          ReportPDFCommonvar.rawlistGraph = [];
          if (_dataCOMMON.datain[i].ITEMname.contains('Hardness') ||
                  _dataCOMMON.datain[i].ITEMname.contains('hardness') ||
                  _dataCOMMON.datain[i].ITEMname.contains('Total') ||
                  _dataCOMMON.datain[i].ITEMname.contains('(Graph)')

              //
              ) {
            for (var li = 0;
                li < _dataCOMMON.datain[i].datapackset.length;
                li++) {
              // print(_dataCOMMON.datain[i].datapackset[li].dimensionX);

              if (_dataCOMMON.datain[i].datapackset[li].dimensionX == 0) {}
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 1) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA01p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA01,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA01p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA01))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 2) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA02p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA02,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA02p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA02))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 3) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA03p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA03,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA03p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA03))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 4) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA04p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA04p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA04))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA05p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA05p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA05))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA06p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA06p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA06))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA07p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA07p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA07))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA08p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA08p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA08))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA09p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA09p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA09))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA10p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA10p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA10))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA11p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA11p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA11))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA12p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA12p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA12))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA13p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA13p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA13))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA14p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA14p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA14))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA15p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA15p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA15))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA16p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA16p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA16))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA17p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA17p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA17))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA18p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA18p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA18))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA19p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA19p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA19))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA20p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA20,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA20p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA20))),
                );
              }
              GraphNO++;
              // print('>>${HardnessNO}');
            }
          }

          // ReportPDFCommonvar.rawlistGraphCore = rawlist(
          //   DATAPCS: "Core",
          //   DATA: ReportPDFCommonvar
          //       .rawlistGraph[ReportPDFCommonvar.rawlistGraph.length - 1].DATA,
          // );
          // print(">>>${ReportPDFCommonvar.rawlistGraph.length}");
          // ReportPDFCommonvar.rawlistGraph.removeLast();
          if (ReportPDFCommonvar.rawlistGraph.length > 2) {
            ReportPDFCommonvar.rawlistGraphCore = rawlist(
              DATAPCS: "Core",
              DATA: ReportPDFCommonvar
                  .rawlistGraph[ReportPDFCommonvar.rawlistGraph.length - 1]
                  .DATA,
            );
            // print(">>>${ReportPDFCommonvar.rawlistGraph.length}");

            ReportPDFCommonvar.rawlistGraph
                .removeAt(ReportPDFCommonvar.rawlistGraph.length - 1);
          }

          ReportPDFCommonvar.graphupper = [
            FlSpot(ReportPDFCommonvar.graphdata[0].x, 1000),
            FlSpot(
                ReportPDFCommonvar
                    .graphdata[ReportPDFCommonvar.graphdata.length - 2].x,
                1000)
          ];

          ReportPDFCommonvar.graphdata2 = [
            FlSpot(ReportPDFCommonvar.graphdata[0].x,
                double.parse(ConverstStr(_dataCOMMON.datain[i].Cross))),
            FlSpot(double.parse(ConverstStr(_dataCOMMON.datain[i].RESULT)),
                double.parse(ConverstStr(_dataCOMMON.datain[i].Cross)))
          ];

          ReportPDFCommonvar.graphdata3 = [
            FlSpot(double.parse(ConverstStr(_dataCOMMON.datain[i].RESULT)),
                double.parse(ConverstStr(_dataCOMMON.datain[i].Cross))),
            FlSpot(double.parse(ConverstStr(_dataCOMMON.datain[i].RESULT)), 0)
          ];

          ReportPDFCommonvar.graphdata4 = [
            FlSpot(ReportPDFCommonvar.graphdata[0].x, 1000),
            FlSpot(ReportPDFCommonvar.graphdata[0].x, 0)
          ];

          ReportPDFCommonvar.graphunder = [
            FlSpot(ReportPDFCommonvar.graphdata[0].x, 0),
            FlSpot(
                ReportPDFCommonvar
                    .graphdata[ReportPDFCommonvar.graphdata.length - 2].x,
                0)
          ];
        }

        if (ReportPDFCommonvar.graphupper.length > 1) {
          ReportPDFCommonvar.graphupper;
        }

        if (ReportPDFCommonvar.graphdata2.length > 1) {
          ReportPDFCommonvar.graphdata2;
        }
        if (ReportPDFCommonvar.graphdata3.length > 1) {
          ReportPDFCommonvar.graphdata3;
        }
        if (ReportPDFCommonvar.graphdata4.length > 1) {
          ReportPDFCommonvar.graphdata4;
        }
        if (ReportPDFCommonvar.graphunder.length > 1) {
          ReportPDFCommonvar.graphunder;
        }

        //Compound Layer

        // Roughness
      }
      if (ReportPDFCommonvar.graphdata.length > 1) {
        ReportPDFCommonvar.graphdata.removeLast();
        //     .removeAt(ReportPDFCommonvar.graphdata.length - 1);
      }

      // print(ReportPDFCommonvar.datalist);
    } else {
      ReportPDFCommonvar.STATUS = 'WATTING or NO-DATA';

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

      ReportPDFCommonvar.rawlistHardness = [];
      ReportPDFCommonvar.rawlistCompound = [];
      ReportPDFCommonvar.rawlistRoughness = [];
      ReportPDFCommonvar.rawlistCORE = [];
      ReportPDFCommonvar.INC01 = '';
      ReportPDFCommonvar.INC02 = '';

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

      ReportPDFCommonvar.rawlistGraphCore = rawlist();

      ReportPDFCommonvar.rawlistGraph = [];
      ReportPDFCommonvar.graphupper = [];
      ReportPDFCommonvar.graphdata = [];
      ReportPDFCommonvar.graphdata2 = [];
      ReportPDFCommonvar.graphdata3 = [];
      ReportPDFCommonvar.graphdata4 = [];
      ReportPDFCommonvar.graphunder = [];
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: ComInputText(
                  height: 40,
                  width: 200,
                  isContr: ReportPDFCommonvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFCommonvar.iscontrol = input;
                    });
                  },
                  isEnabled: ReportPDFCommonvar.canf,
                  sValue: ReportPDFCommonvar.PO,
                  returnfunc: (String s) {
                    ReportPDFCommonvar.PO = s;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  onTap: () {
                    if (ReportPDFCommonvar.PO != '') {
                      // context
                      //     .read<ReportPDFCommon_Cubit>()
                      //     .ReportPDFCommonCubit(ReportPDFCommonvar.PO, "cov");
                    }
                  },
                  child: Container(
                    color: Colors.black,
                    height: 40,
                    width: 40,
                    child: const Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  onTap: () {
                    // context.read<ReportPDFCommon_Cubit>().Flush();
                    ReportPDFCommonvar.canf = true;
                    ReportPDFCommonvar.iscontrol = true;
                    ReportPDFCommonvar.PO = '';
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.red,
                    height: 40,
                    width: 100,
                    child: const Center(
                      child: Text("CLEAR"),
                    ),
                  ),
                ),
              ),
              InkWell(
                onDoubleTap: () {
                  //  ReportPDFCommonvar.HIDEDATAPIC
                  if (ReportPDFCommonvar.HIDEDATAPIC) {
                    ReportPDFCommonvar.HIDEDATAPIC = false;
                  } else {
                    ReportPDFCommonvar.HIDEDATAPIC = true;
                  }
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    color: ReportPDFCommonvar.STATUS == 'REPORT READY'
                        ? Colors.green
                        : Colors.yellow,
                    height: 40,
                    width: 200,
                    child: Center(
                      child: Text(ReportPDFCommonvar.STATUS),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  height: 40,
                  width: 150,
                  child: AdvanceDropDown(
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: const [
                      MapEntry("-", "-"),
                      MapEntry("General", "1"),
                      MapEntry("JTEKT", "2"),
                      MapEntry("NTN122-4-7", "3"),
                      MapEntry("TBKK", "4"),
                      MapEntry("GKN", "5"),
                      MapEntry("SIAMADVANCE", "6"),
                      MapEntry("NTN500T850T", "7"),
                    ],
                    onChangeinside: (d, v) {
                      // print(d);
                      ReportPDFCommonvar.TYPE = d;
                    },
                    value: ReportPDFCommonvar.TYPE,
                    height: 40,
                    width: 100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: ComInputText(
                  height: 40,
                  width: 200,
                  isContr: ReportPDFCommonvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFCommonvar.iscontrol = input;
                    });
                  },
                  sPlaceholder: "ทดสอบ ทดสอบ",
                  sValue: ReportPDFCommonvar.SignInsBy,
                  returnfunc: (String s) {
                    setState(() {
                      ReportPDFCommonvar.SignInsBy = s;
                    });
                  },
                ),
              ),
              const Spacer(),
              if (ReportPDFCommonvar.PASS == "PASSED") ...[
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      color: Colors.yellow,
                      height: 50,
                      width: 100,
                      child: const Center(
                        child: Text("Print"),
                      ),
                    ),
                  ),
                ),
              ] else ...[
                if (USERDATA.UserLV > 5 &&
                    _dataCOMMON.databasic.USER_STATUS == 'QCFN') ...[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      onTap: () {
                        // PDFloader(context);
                        // Future.delayed(const Duration(milliseconds: 1000), () {
                        //   // capture(
                        //   captureToback(
                        //     // capture(
                        //     _globalKey,
                        //     ReportPDFCommonvar.PO,
                        //   ).then((value) {
                        //     print(value);

                        //     Navigator.pop(context);
                        //   });
                        // });
                      },
                      child: Container(
                        color: Colors.yellow,
                        height: 50,
                        width: 100,
                        child: const Center(
                          child: Text("Print"),
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ],
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.yellow,
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: Text("UD and QCFN"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                onTap: () {
                  //ReportPDFCommonvar.PO
                },
                child: Container(
                  color: Colors.yellow,
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: Text("QCFN"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                onTap: () {
                  //ReportPDFCommonvar.PO
                  String server = 'http://172.23.10.40:1885/';
                  String sap = "sap_GASHES_GB";

                  Dio().post(
                    server + sap,
                    data: {},
                  ).then((v) {
                    //
                    var databuff = v.data;
                    for (var i = 0; i < databuff.length; i++) {
                      //

                      if (databuff[i]['PO'] == ReportPDFCommonvar.PO) {
                        print(
                            databuff[i]['PO'] + ':' + databuff[i]['FG_CHARG']);
                        // print(databuff[i]);
                        ReportPDFCommonvar.TPKLOTEDIT = databuff[i]['FG_CHARG'];
                        setState(() {});
                      }
                    }
                  });
                },
                child: Container(
                  color: Colors.orange,
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: Text("Re Lot"),
                  ),
                ),
              ),
            ),
          ]),

//QCFN
          //STDreport2
          // Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 60),
          //       child: ComInputText(
          //         sLabel: "Remark",
          //         height: 40,
          //         width: 500,
          //         nLimitedChar: 500,
          //         isContr: ReportPDFCommonvar.iscontrol,
          //         fnContr: (input) {
          //           setState(() {
          //             ReportPDFCommonvar.iscontrol = input;
          //           });
          //         },
          //         // isEnabled: ReportPDFCommonvar.canf,
          //         sValue: ReportPDFCommonvar.remark,
          //         returnfunc: (String s) {
          //           setState(() {
          //             ReportPDFCommonvar.remark = s;
          //           });
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                RepaintBoundary(
                  key: _globalKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // const SizedBox(
                          //   width: 50,
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              height: 2000,
                              width: 1364,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3),
                                // color: Colors.red,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(0)),
                              ),
                              child: Column(
                                children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // Header section
                                            headerreport2(
                                              CUSTOMERNAME: ReportPDFCommonvar.CUSTOMERNAME,
                                              PARTNAME: ReportPDFCommonvar.PROCESS,
                                              PARTNO: ReportPDFCommonvar.PARTNAME,
                                              CONTROLPLANNO: ReportPDFCommonvar.PARTNO,
                                              PRODUCTSTAGES: ReportPDFCommonvar.PRODUCTSTAGES,
                                              PROCESS: ReportPDFCommonvar.PROCESS,
                                              MATERIAL: ReportPDFCommonvar.MATERIAL,
                                              INSPECTIONSTDNO: ReportPDFCommonvar.INSPECTIONSTDNO,
                                            ),

                                            const SizedBox(height: 16), // spacing
                                            
                                          ],
                                        ),


// INCOMING INSPECTION START
                                    HEAD1SLOT(
                                      padding: 0,
                                      ListFlex: [1],
                                      height: 47,
                                      widget01: const Center(
                                        child: Text(
                                          "INCOMING INSPECTION",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  


                                  HEAD7SLOT(
                                    ListFlex: [6, 1, 2, 2, 2, 4, 2],
                                    widget01: const Center(
                                      child: Text(
                                        "ITEM",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget02: const Center(
                                      child: Text(
                                        "SC",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget03: const Center(
                                      child: Text(
                                        "DOCUMENT",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget04: const Center(
                                      child: Text(
                                        "METHOD",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget05: const Center(
                                      child: Text(
                                        "FREQUENCY",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget06: const Center(
                                      child: Text(
                                        "SPECIFICATION",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget07: const Center(
                                      child: Text(
                                        "REMARK",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),

                                  BODY7SLOT(
                                    ListFlex: [6, 1, 2, 2, 2, 4, 2],
                                    widget01: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC01 != ''
                                            ? "Appearance for Rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget02: const Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC01 != ''
                                            ? "Visual"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC01 != ''
                                            ? "10 pcs/rcv.Lot"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC01 != ''
                                            ? "No Rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC01 != ''
                                            ? "No Rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[0].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[0]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),

                                  BODY7SLOT(
                                    ListFlex: [6, 1, 2, 2, 2, 4, 2],
                                    widget01: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Appearance for scratch"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? ""
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Visual"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "10 pcs/rcv.Lot"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "No Scratch"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "No Scratch"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[0].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[0]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),

                                  BODY7SLOT(
                                    ListFlex: [6, 1, 2, 2, 2, 4, 2],
                                    widget01: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Appearance for rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? ""
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "OP-HQC-03-001"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Visual"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "10 pcs. / Receiving lot"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "No rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[0].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[0]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),
// INCOMING INSPECTION END

//  FINAL INSPECTION START

                                  Padding(
                                    padding: const EdgeInsets.only(top: 64),
                                    child: HEAD1SLOT(
                                      padding: 0,
                                      ListFlex: [1],
                                      height: 47,
                                      widget01: const Center(
                                        child: Text(
                                          "FINAL INSPECTION",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  HEAD7SLOT(
                                    ListFlex: [6, 1, 2, 2, 2, 4, 2],
                                    widget01: const Center(
                                      child: Text(
                                        "ITEM",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget02: const Center(
                                      child: Text(
                                        "SC",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget03: const Center(
                                      child: Text(
                                        "DOCUMENT",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget04: const Center(
                                      child: Text(
                                        "METHOD",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget05: const Center(
                                      child: Text(
                                        "FREQUENCY",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget06: const Center(
                                      child: Text(
                                        "SPECIFICATION",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget07: const Center(
                                      child: Text(
                                        "REMARK",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),

                                  BODY7SLOT(
                                    ListFlex: [6, 1, 2, 2, 2, 4, 2],
                                    widget01: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Appearance for rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? ""
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "OP-HQC-03-001"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Visual"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "10 pcs. / Receiving lot"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "No rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[0].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[0]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),

                                  BODY7SLOT(
                                    ListFlex: [6, 1, 2, 2, 2, 4, 2],
                                    widget01: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Appearance for rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? ""
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "OP-HQC-03-001"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Visual"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "10 pcs. / Receiving lot"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "No rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[0].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[0]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),

                                  BODY7SLOT(
                                    ListFlex: [6, 1, 2, 2, 2, 4, 2],
                                    widget01: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Appearance for rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? ""
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "OP-HQC-03-001"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Visual"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "10 pcs. / Receiving lot"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "No rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[0].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[0]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),

                                  BODY7SLOT(
                                    ListFlex: [6, 1, 2, 2, 2, 4, 2],
                                    widget01: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Appearance for rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? ""
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "OP-HQC-03-001"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Visual"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "10 pcs. / Receiving lot"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "No rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[0].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[0]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),

                                  BODY7SLOT(
                                    ListFlex: [6, 1, 2, 2, 2, 4, 2],
                                    widget01: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Appearance for rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? ""
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "OP-HQC-03-001"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Visual"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "10 pcs. / Receiving lot"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "No rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[0].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[0]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),

                                  BODY7SLOT(
                                    ListFlex: [6, 1, 2, 2, 2, 4, 2],
                                    widget01: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Appearance for rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? ""
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "OP-HQC-03-001"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Visual"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "10 pcs. / Receiving lot"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "No rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[0].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[0]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),

                                  BODY7SLOT(
                                    ListFlex: [6, 1, 2, 2, 2, 4, 2],
                                    widget01: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Appearance for rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? ""
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "OP-HQC-03-001"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "Visual"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "10 pcs. / Receiving lot"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? "No rust"
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[0].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[0]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),

// Final Inspection END

                                    ReportedImageCard(
                                      base64Image: imageTestInspectionStandard,
                                      description: "Weight = 90.8249 g/pc",
                                      onReportedChange: (bool? value) {
                                        print("Reported: $value");
                                      },
                                    ),


                                  SIGNWITHCUSTOMERSLOT(
                                    signs: true,
                                    PASS: ReportPDFCommonvar.PASS,
                                    PICS: _dataCOMMON.databasic.PICstd,
                                    NAME01:
                                        _dataCOMMON.databasic.Inspected_sign,
                                    NAME02: _dataCOMMON.databasic.Check_sign,
                                    NAME03: _dataCOMMON.databasic.Approve_sign,
                                    // NAME01: "",
                                    // NAME02: "",
                                    // NAME03: "",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 80,
                          color: Colors.blue,
                          child: Center(
                            child: Text("Inspected"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 80,
                          color: Colors.blue,
                          child: Center(
                            child: Text("Check"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 80,
                          color: Colors.blue,
                          child: Center(
                            child: Text("Approve"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 50,
          ),
        ],
      ),
    );
  }
}

List<int> S16slot = const [
  3,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1
];
