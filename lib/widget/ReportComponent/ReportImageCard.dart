import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:newmaster/page/P32ReportPDFcommon/ReportPDFCommonvar.dart';
import 'package:newmaster/widget/ReportComponent/ReportRadioButton.dart';

class ReportedImageCard extends StatefulWidget {
  final Uint8List imageBytes;
  final String description;
  final Function(bool?) onReportedChange;

  const ReportedImageCard({
    super.key,
    required this.imageBytes,
    required this.description,
    required this.onReportedChange,
  });

  @override
  State<ReportedImageCard> createState() => _ReportedImageCardState();
}

class _ReportedImageCardState extends State<ReportedImageCard> {
  bool? _reportedToCustomer;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment.centerLeft,
      height: 496,
      padding: const EdgeInsets.only(top: 32, bottom: 12, right: 8, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          // Header with radio buttons
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        width: 632,
        height: 47,
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: Colors.black
          ),
        ),
      child: ReportedRadioButton(
        onReportedChange: widget.onReportedChange,
      ),
      ),

          const SizedBox(height: 8),
          // Image container
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(54),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 270, // จำกัดความสูงไม่เกิน 288
                  ),
                  child: Image.memory(
                    widget.imageBytes,
                    width: 508,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
