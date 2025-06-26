import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newmaster/bloc/Cubit/report_pdf_cubit.dart';
import 'package:newmaster/bloc/Cubit/report_pdf_state.dart';
import 'package:newmaster/page/P32ReportPDFcommon/ReportPDFCommonvar.dart';
import 'package:newmaster/widget/ReportComponent/SingleSelectCheckboxRow.dart';

import '../widget/ReportComponent/CommonReport.dart';

class headerreport2 extends StatelessWidget {
  const headerreport2({super.key});
  //   this.CUSTOMER,
  //   this.PARTNAME,
  //   this.PROCESS,
  //   this.PARTNO,
  //   this.MATERIAL,
  //   this.CONTROLPLANNO,
  //   this.INSPECTIONSTDNO

  // });
  //   String ? CUSTOMER;
  //   String ? PARTNAME;
  //   String ? PROCESS;
  //   String ? PARTNO;
  //   String ? MATERIAL;
  //   String ? CONTROLPLANNO;
  //   String ? INSPECTIONSTDNO;
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ReportPDFCubit>().state;

    if (state is ReportPDFLoaded) {
    final data = state.report;
    
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
                                "มาตรฐานการตรวจผลิตภัณฑ์ สำหรับกระบวนการ Phosphate",
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
              ((data.databasic.CUST_FULLNM ?? '').trim().isNotEmpty
                  ? data.databasic.CUST_FULLNM
                  : (data.databasic.CUSTOMER ?? '').trim().isNotEmpty
                      ? data.databasic.CUSTOMER
                      : '-')!,
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
        widget01: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "PART NAME",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // กำหนดขนาดตามต้องการ
                ),
              ),
            ),
        widget02: Center(
              child: Text(
                ((data.databasic.PARTNAME ?? '').trim().isNotEmpty
                  ? data.databasic.PARTNAME
                  : '-') ?? '-',
              style: const TextStyle(
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
                ((data.databasic.PROCESS ?? '').trim().isNotEmpty
                  ? data.databasic.PROCESS
                  : '-') ?? '-',
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
                ((data.databasic.PART ?? '').trim().isNotEmpty
                  ? data.databasic.PART
                  : '-') ?? '-',
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
                ((data.databasic.MATERIAL ?? '').trim().isNotEmpty
                  ? data.databasic.MATERIAL
                  : '-') ?? '-',
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
                ((data.databasic.CP ?? '').trim().isNotEmpty
                  ? data.databasic.CP
                  : '-') ?? '-',
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
                ((data.databasic.INSPECTIONSTDNO ?? '').trim().isNotEmpty
                  ? data.databasic.INSPECTIONSTDNO
                  : '-') ?? '-',
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
  return const SizedBox();
  }
}