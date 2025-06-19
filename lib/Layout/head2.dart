import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newmaster/bloc/BlocEvent/PhInspectionStandardBloc.dart';
import 'package:newmaster/bloc/BlocState/PhInspectionStandardState.dart';
import 'package:newmaster/page/P32ReportPDFcommon/ReportPDFCommonvar.dart';
import 'package:newmaster/page/P32ReportPDFcommon/entities_models/ReportPDF.dart';
import 'package:newmaster/widget/ReportComponent/SingleSelectCheckboxRow.dart';

import '../widget/ReportComponent/CommonReport.dart';

class headerreport2 extends StatelessWidget {
  const headerreport2({Key? key}) : super(key: key);
  // headerreport2({
  //   super.key,
  //   this.CUSTOMER,
  //   this.PARTNAME,
  //   this.PART,
  //   this.CP,
  //   this.CUST_FULLNM,
  //   this.MATERIAL,
  //   this.CONTROLPLANNO,
  //   this.PRODUCTSTAGES,
  //   this.PROCESS,
  //   this.INSPECTIONSTDNO,
  // });
  // String? CUSTOMER;
  // String? PARTNAME;
  // String? PART;
  // String? CP;
  // String? CUST_FULLNM;
  // String? MATERIAL;
  // String? CONTROLPLANNO;
  // String? PRODUCTSTAGES;
  // String? PROCESS;
  // String? INSPECTIONSTDNO;

  // factory headerreport2.fromBasicData(BasicCommonDATA data) {
  //   return headerreport2(
  //       // 'CUSTOMER': String CUSTOMERNAME,
  //       // 'PARTNAME': String PARTNAME,
  //       // 'PARTNO': String PARTNO,
  //       // 'CONTROLPLANNO': String CONTROLPLANNO,
  //       // 'PRODUCTSTAGES': String PRODUCTSTAGES,
  //       // 'PROCESS': String PROCESS,
  //       // 'MATERIAL': String MATERIAL,
  //       // 'INSPECTIONSTDNO': String INSPECTIONSTDNO,

  //       CUSTOMER: data.CUSTOMER,
  //       PARTNAME: data.PARTNAME,
  //       PART: data.PART,
  //       CP: data.CP,
  //       CUST_FULLNM: data.CUST_FULLNM,
  //       MATERIAL: data.MATERIAL,
  //       CONTROLPLANNO: data.USER_STATUS ?? 'N/A',
  //       PRODUCTSTAGES: data.USER_STATUS ?? 'N/A',
  //       PROCESS: data.PROCESS,
  //       INSPECTIONSTDNO: data.INSPECTIONSTDNO
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportPdfBloc, PhInspectionStandardState>(
    builder: (context, state) {
      return Column(
        children: [
          HEAD2SLOTNEW(
            ListFlex: const [5, 5],
            widget01: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 120,
                    width: 180,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logoonly_tpkpng.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                // เพิ่มระยะห่างเพิ่มเติมถ้าต้องการ

                SizedBox(
                  height: 120,
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "THAI PARKERIZING CO.,LTD.",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Heat & Surface Treatment Division",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            widget02: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 120,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                            color: Colors.black,
                            width: 3,
                            style: BorderStyle.solid),
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 3,
                          style: BorderStyle.solid),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround, // ✅ บนสุด-ล่างสุด
                            crossAxisAlignment: CrossAxisAlignment.center, // ปรับชิดกลาง (หรือใช้ .start เพื่อชิดซ้าย)
                            children: const [
                              Text(
                                "INSPECTION STANDARD",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "(มาตรฐานการตรวจผลิตภัณฑ์ สำหรับกระบวนการ Phosphate)",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                flex: 1,
                child: Container(
                  height: 60,
                  decoration:  const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.black,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "SD-HQC-03/002-03-20/09/21",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),

          HEAD3SLOTWITHCHECKBOX(
            ListFlex: [2, 3, 5],
            widget01: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "CUSTOMER NAME",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // กำหนดขนาดตามต้องการ
                ),
              ),
            ),

            widget02: Center(
              child: Text(
                // ReportPDFCommonvar.CUSTOMER !=''
                // ? ReportPDFCommonvar.CUSTOMER
                // : "No data",
                ReportPDFCommonvar.CUSTOMER != '' ?
                ReportPDFCommonvar.CUSTOMER :
                "No data",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
              ),
            ),

            widget03: SingleSelectCheckboxRow(
              options: ['Prototype', 'Pre-Launch', 'Mass Production'],
              onChanged: (index) {
                print('Selected Option Index: $index');
              },
            ),
          ),
      BODY4SLOT(
        ListFlex: [4, 6, 4, 6],
        widget01: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ReportPDFCommonvar.PARTNAME != '' ?
                ReportPDFCommonvar.PARTNAME :
                "No data",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // กำหนดขนาดตามต้องการ
                ),
              ),
            ),
        widget02: const Center(
              child: Text(
                "CENTRAL SPRING CO., LTD.",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
              ),
            ),
        widget03: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "PROCESS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // กำหนดขนาดตามต้องการ
                ),
              ),
            ),
        widget04: Center(
              child: Text(
                ReportPDFCommonvar.PROCESS != '' ?
                ReportPDFCommonvar.PROCESS :
                "No data",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
              ),
            ),
        hig: 47,

      ),
      BODY4SLOT(
        ListFlex: [4, 6, 4, 6],
        widget01: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "PART NO.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // กำหนดขนาดตามต้องการ
                ),
              ),
            ),
        widget02:  Center(
              child: Text(
                ReportPDFCommonvar.PART != '' ?
                ReportPDFCommonvar.PART :
                "No data",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
              ),
            ),
        widget03: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "MATERIAL",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // กำหนดขนาดตามต้องการ
                ),
              ),
            ),
        widget04: Center(
              child: Text(
                ReportPDFCommonvar.MATERIAL != '' ?
                ReportPDFCommonvar.MATERIAL :
                "No data",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
              ),
            ),
        hig: 47,

      ),
          BODY4SLOT(
        ListFlex: [4, 6, 4, 6],
        widget01: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "CONTROL PLAN NO.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // กำหนดขนาดตามต้องการ
                ),
              ),
            ),
        widget02: Center(
              child: Text(
                ReportPDFCommonvar.CUSTOMER != '' ?
                ReportPDFCommonvar.CUSTOMER :
                "No data",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
              ),
            ),
        widget03: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "INSPECTION STD NO.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // กำหนดขนาดตามต้องการ
                ),
              ),
            ),
        widget04: Center(
              child: Text(
                ReportPDFCommonvar.INSPECTIONSTDNO != '' ?
                ReportPDFCommonvar.INSPECTIONSTDNO :
                "No data",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
              ),
            ),
        hig: 47,
      ),
        ],
      );
    }
    );
  }
}