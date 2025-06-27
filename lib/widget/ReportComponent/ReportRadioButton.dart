import 'package:flutter/material.dart';
import 'package:newmaster/page/P32ReportPDFcommon/ReportPDFCommonvar.dart';

class ReportedRadioButton extends StatefulWidget {
  final Function(bool?) onReportedChange;

  const ReportedRadioButton({super.key, required this.onReportedChange});

  @override
  State<ReportedRadioButton> createState() => _ReportedRadioButtonState();
}

class _ReportedRadioButtonState extends State<ReportedRadioButton> {
  bool? _reportedToCustomer;
  void initState() {
    super.initState();
    // sync ค่าจาก static variable
    _reportedToCustomer = ReportPDFCommonvar.IsReported;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "REPORTED TO CUSTOMER",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 16),
        Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: _reportedToCustomer,
              onChanged: (val) {
                setState(() => _reportedToCustomer = val);
                ReportPDFCommonvar.IsReported = val!;
                setState(() => _reportedToCustomer = val); // 💾 เก็บไว้
                widget.onReportedChange(val);
              },
              activeColor: Colors.blue,
            ),
            const Text(
              "YES",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Row(
          children: [
            Radio<bool>(
              value: false,
              groupValue: _reportedToCustomer,
              onChanged: (val) {
                setState(() => _reportedToCustomer = val);
                ReportPDFCommonvar.IsReported = val!;
                setState(() => _reportedToCustomer = val); // 💾 เก็บไว้
                widget.onReportedChange(val);
              },
              activeColor: Colors.blueAccent,
            ),
            const Text(
              "NO",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}


