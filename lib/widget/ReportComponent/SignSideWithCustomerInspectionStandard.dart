import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../common/imgset.dart';
import 'CommonReport.dart';

class SIGNWITHCUSTOMERSLOT extends StatelessWidget {
  SIGNWITHCUSTOMERSLOT({
    Key? key,
    this.widget01,
    this.widget02,
    this.widget03,
    this.widget04,
    this.widget05,
    this.widget06,
    this.PICS,
    this.PASS,
    this.NAME01,
    this.NAME02,
    this.NAME03,
    this.CUSNAME01,
    this.CUSNAME02,
    this.signs,
  }) : super(key: key);
  
  Widget? widget01;
  Widget? widget02;
  Widget? widget03;
  Widget? widget04;
  Widget? widget05;
  Widget? widget06;
  String? PICS;
  String? PASS;
  String? NAME01;
  String? NAME02;
  String? NAME03;
  String? CUSNAME01;
  String? CUSNAME02;
  bool? signs;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MMM-yyyy');
    String formattedDate = formatter.format(now);

    var formatterDetailsCol = DateFormat('d-MMM-y');
    String formattedDateDetailsCol = formatterDetailsCol.format(now);
    
    return 
    Expanded(
    child: Padding(
      padding: const EdgeInsets.only(
      ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          // Central Spring Section
          Expanded(
  flex: 2,
  child: Container(
    width: 400,
    height: 260,
    child: Column(
      mainAxisSize: MainAxisSize.max, // ยืดให้เต็มความสูง
      children: [
        HEAD1SLOTTINY(
          height: 28,
          ListFlex: const [1],
          widget01: const Center(
            child: Text(
              "CENTRAL SPRING CO., LTD.",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        HEAD2SLOTCUS(
          padd: 8,
          hig: 58,
          ListFlex: const [1, 1],
          widget01: const Center(
            child: Text(
              "APPROVE BY",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),
          widget02: const Center(
            child: Text(
              "CHECKED BY",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),

          BODY2SLOTCUS(
            padd: 8,
            hig: 154, // หรือจะลบทิ้งไปเลยก็ได้เมื่อใช้ Expanded
            ListFlex: const [1, 1],
            widget01: Center(
              child: Text(
                PASS ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            widget02: _buildSignatureColumn(CUSNAME01, formattedDate),
          ),
      ],
    ),
  ),
),

          
          Expanded(
            flex: 3,
            child: SizedBox(
                width: 400,
                height: 260,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(bottom: 8),
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 31,
                      child: HEAD3SLOT(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          ListFlex: const [1, 2, 5],
                          widget01: const Center(
                            child: Text(
                              "NO",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          widget02: const Center(
                            child: Text(
                              "Date",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          widget03: const Center(
                            child: Text(
                              "Revision Details",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                    ),
                    // ไม่มี SizedBox หรือ padding ที่คั่นตรงนี้
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                          child: BODY3SLOT(
                              ListFlex: const [1, 2, 5],
                              widget01: Center(
                                child: Text(
                                  'Milk',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              widget02: Center(
                                child: Text(
                                  formattedDateDetailsCol,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              widget03: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  'Cream',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                        ),
                                      
                        SizedBox(
                          height: 30,
                          child: BODY3SLOT(
                              ListFlex: const [1, 2, 5],
                              widget01: Center(
                                child: Text(
                                  'Milk',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              widget02: Center(
                                child: Text(
                                  formattedDateDetailsCol,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              widget03: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  'Cream',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                        ),
                                      
                                      
                        SizedBox(
                          height: 30,
                          child: BODY3SLOT(
                              ListFlex: const [1, 2, 5],
                              widget01: Center(
                                child: Text(
                                  'Milk',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              widget02: Center(
                                child: Text(
                                  formattedDateDetailsCol,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              widget03: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  'Cream',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                        ),
                                      
                                      
                        SizedBox(
                          height: 30,
                          child: BODY3SLOT(
                              ListFlex: const [1, 2, 5],
                              widget01: Center(
                                child: Text(
                                  'Milk',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              widget02: Center(
                                child: Text(
                                  formattedDateDetailsCol,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              widget03: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  'Cream',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                        ),
                                      
                                      
                        SizedBox(
                          height: 30,
                          child: BODY3SLOT(
                              ListFlex: const [1, 2, 5],
                              widget01: Center(
                                child: Text(
                                  'Milk',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              widget02: Center(
                                child: Text(
                                  formattedDateDetailsCol,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              widget03: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  'Cream',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                        
                            ),
                        ),
                                      
                        SizedBox(
                          height: 30,
                          child: BODY3SLOT(
                              ListFlex: const [1, 2, 5],
                              widget01: Center(
                                child: Text(
                                  'Milk',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              widget02: Center(
                                child: Text(
                                  formattedDateDetailsCol,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              widget03: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  'Cream',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                        ),
                      ],
                    ),
              
                    SizedBox(
                      height: 29,
                      child: BODY3SLOT(
                          ListFlex: const [1, 2, 5],
                          widget01: Center(
                            child: Text(
                              'Milk',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          widget02: Center(
                            child: Text(
                              formattedDateDetailsCol,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          widget03: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'Cream',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                    ),
              
                  ],
                ),

                )
                
              ),
          ),
 // Spacing between sections
          

          Expanded(
            flex: 4,
            child: SizedBox(
                width: 400, // Fixed width for horizontal layout
                height: 260,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(bottom: 8),
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HEAD1SLOTTINY(
                      height: 28,
                      ListFlex: const [1],
                      widget01: const Center(
                        child: Text(
                          "THAI PARKERIZING CO., LTD.",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    HEAD4SLOT(
                      padd: 8,
                      hig: 58,
                      ListFlex: const [1, 1, 1, 1],
                      widget01: const Center(
                        child: Text(
                          "APPROVE BY\nQA MGR.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      widget02: const Center(
                        child: Text(
                          "APPROVED BY",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      widget03: const Center(
                        child: Text(
                          "CHECKED BY",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      widget04: const Center(
                        child: Text(
                          "ISSUE BY",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    BODY4SLOT(
                      padd: 8,
                      hig: 154,
                      ListFlex: const [1, 1, 1, 1],
                      widget01: Center(
                        child: Text(
                          PASS ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      widget02: _buildSignatureColumn(NAME01, formattedDate),
                      widget03: _buildSignatureColumn(NAME02, formattedDate),
                      widget04: _buildSignatureColumn(NAME03, formattedDate),
                    ),
                  ],
                ),
              ),
          ),
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildSignatureColumn(String? name, String date) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(),
            child: (signs ?? false)
                ? SizedBox(
                    height: 120,
                    width: 120,
                    child: PicShowAct(width: 120, height: 120, base64: name ?? ''),
                  )
                : SizedBox(height: 48, width: 100, child: Text(name ?? '')),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(date),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptySignatureColumn(String date) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: const SizedBox(height: 48, width: 100),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(date),
          ),
        ),
      ],
    );
  }
}


class HEAD4SLOTVERTICAL extends StatelessWidget {
  HEAD4SLOTVERTICAL({
    Key? key,
    this.ListFlex,
    this.hig,
    this.padd,
    this.widget01,
    this.widget02,
    this.widget03,
    this.widget04,
  }) : super(key: key);
  List<int>? ListFlex;
  double? hig;
  double? padd;
  Widget? widget01;
  Widget? widget02;
  Widget? widget03;
  Widget? widget04;

  @override
  Widget build(BuildContext context) {
    List<int> _ListFlex = ListFlex ?? [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    return Padding(
      padding: EdgeInsets.only(right: padd ?? 8, left: padd ?? 8),
      child: Column(
        children: [
          Expanded(
            flex: _ListFlex[0],
            child: Container(
              child: widget01 ?? const SizedBox(),
              height: hig ?? 55,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[1],
            child: Container(
              child: widget02 ?? const SizedBox(),
              height: hig ?? 55,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[2],
            child: Container(
              child: widget03 ?? const SizedBox(),
              height: hig ?? 55,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[3],
            child: Container(
              child: widget04 ?? const SizedBox(),
              height: hig ?? 55,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



