import 'dart:convert';
import 'dart:core';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:newmaster/bloc/BlocEvent/PhInspectionStandardBloc.dart';
import 'package:newmaster/page/P32ReportPDFcommon/entities_models/ReportPDF.dart';
import 'package:newmaster/page/P32ReportPDFcommon/entities_models/ReportPDFModels.dart';
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
  super.initState();
  ReportPDFCommonvar.TPKLOTEDIT = '';
  print("ma rel");
  
  if (ReportPDFCommonvar.PO != '') {
    ReportPDFCommonvar.canf = false;
    // context
    //     .read<ReportPDFCommon_Cubit>()
    //     .ReportPDFCommonCubit(ReportPDFCommonvar.PO, "");
  }
}

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ReportPDFCommoncontext = context;
    create: (context) => ReportPdfBloc();
    child: const headerreport2();
    CommonReportOutput _dataCOMMON = widget.dataCommon ??
        CommonReportOutput(
          databasic: BasicCommonDATA(),
        );
    if (_dataCOMMON.datain.isNotEmpty) {
      //
      ReportPDFCommonvar.STATUS = 'REPORT READY';
      ReportPDFCommonvar.CP = '';
      ReportPDFCommonvar.FG = '';
      ReportPDFCommonvar.CUSTOMER = '';
      ReportPDFCommonvar.PART = '';
      ReportPDFCommonvar.PARTNAME = '';
      ReportPDFCommonvar.MATERIAL = '';
      ReportPDFCommonvar.CUST_FULLNM = '';

      ReportPDFCommonvar.PASS = _dataCOMMON.databasic.PASS;

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
        ReportPDFCommonvar.datalist[i].FREQUENCY = _dataCOMMON.datain[i].FREQUENCY;
        ReportPDFCommonvar.datalist[i].SPECIFICATIONname =
            _dataCOMMON.datain[i].SPECIFICATIONname;
        ReportPDFCommonvar.datalist[i].REMARK = _dataCOMMON.datain[i].REMARK;
        //print(ReportPDFCommonvar.datalist[i].RESULT.length);
        //Surface Hardness

          }

      // print(ReportPDFCommonvar.datalist);
    } else {
      ReportPDFCommonvar.STATUS = 'WATTING or NO-DATA';

      ReportPDFCommonvar.CP = '';
      ReportPDFCommonvar.FG = '';
      ReportPDFCommonvar.CUSTOMER = '';
      ReportPDFCommonvar.PART = '';
      ReportPDFCommonvar.PARTNAME = '';
      ReportPDFCommonvar.MATERIAL = '';
      ReportPDFCommonvar.CUST_FULLNM = '';

      ReportPDFCommonvar.datalist = [
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        // ReportPDFCommonlist(),
        // ReportPDFCommonlist(),
        // ReportPDFCommonlist(),
        // ReportPDFCommonlist(),
        // ReportPDFCommonlist(),
        // ReportPDFCommonlist(),
      ];

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
                                            headerreport2(),

                                            const SizedBox(height: 16), // spacing
                                            
                                          ],
                                        ),


// INCOMING INSPECTION START
                                    HEAD1SLOTSMALL(
                                      padding: 8,
                                      height: 47,
                                      width: 500,
                                      widget01: const Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                          "INCOMING INSPECTION",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                          
                                        )
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

                                  Column(
                                  children: ReportPDFCommonvar.datalist
                                      .asMap()
                                      .entries
                                      .take(3) // ✅ จำกัดให้เอาแค่ 3 รายการแรก
                                      .map((entry) {
                                        final index = entry.key;
                                        final item = entry.value;
                                        final remark = item.REMARK;

                                      return BODY7SLOT(
                                        ListFlex: [6, 1, 2, 2, 2, 4, 2],
                                        widget01: Center(
                                          child: Text(
                                            "${index + 1}",
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        widget02: const Center(
                                          child: Text(
                                            "",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        widget03: Center(
                                          child: Text(
                                            "2", // แก้ไขตามจริง
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        widget04: Center(
                                          child: Text(
                                            "3", // แก้ไขตามจริง
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        widget05: Center(
                                          child: Text(
                                            item.FREQUENCY,
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        widget06: Center(
                                          child: Text(
                                            "5", // แก้ไขตามจริง
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        widget07: Center(
                                          child: Text(
                                            "remark,",
                                            style: TextStyle(
                                              fontSize: remark.length > 30 ? 12 : 16,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),



// INCOMING INSPECTION END

//  FINAL INSPECTION START

                                  Padding(
                                    padding: const EdgeInsets.only(top: 64),
                                    child: HEAD1SLOTSMALL(
                                      padding: 8,
                                      height: 47,
                                      width: 500,
                                      widget01: const Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                          "FINAL INSPECTION",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                          
                                        )
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

                                  Column(
                                    children: List.generate(7, (index) {
                                      final remark = ReportPDFCommonvar.datalist[index].REMARK;
                                      return BODY7SLOT(
                                        ListFlex: [6, 1, 2, 2, 2, 4, 2],
                                        widget01: Center(
                                          child: Text(
                                            "${index + 1}", // Dynamic Label
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        widget02: Center(
                                          child: Text(
                                            "2", // replace if needed with dynamic content
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        widget03: Center(
                                          child: Text(
                                            "3", // replace if needed
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        widget04: Center(
                                          child: Text(
                                            "4", // replace if needed
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        widget05: Center(
                                          child: Text(
                                            "5", // replace if needed
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        widget06: Center(
                                          child: Text(
                                            "6", // replace if needed
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        widget07: Center(
                                          child: Text(
                                            remark,
                                            style: TextStyle(
                                              fontSize: remark.length > 30 ? 12 : 16,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
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
                                    NAME01:_dataCOMMON.databasic.ApproveSigned,
                                    NAME02: _dataCOMMON.databasic.CheckedBySigned,
                                    NAME03: _dataCOMMON.databasic.IssuedBySigned,
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
