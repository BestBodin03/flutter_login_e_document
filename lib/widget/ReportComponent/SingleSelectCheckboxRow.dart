import 'package:flutter/material.dart';
import 'package:newmaster/page/P32ReportPDFcommon/ReportPDFCommonvar.dart';

class SingleSelectCheckboxRow extends StatefulWidget {
  final List<String> options;
  final Function(int?) onChanged;

  const SingleSelectCheckboxRow({
    super.key,
    required this.options,
    required this.onChanged,
  });

  @override
  State<SingleSelectCheckboxRow> createState() => _SingleSelectCheckboxRowState();
}

class _SingleSelectCheckboxRowState extends State<SingleSelectCheckboxRow> {
  int? _selectedIndex;
  void initState() {
    super.initState();
    // sync ค่าจาก static variable
    _selectedIndex = ReportPDFCommonvar.ProductStage;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.options.length, (index) {
        return Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = (_selectedIndex == index) ? null : index;
              });
              ReportPDFCommonvar.ProductStage = index;
              widget.onChanged(_selectedIndex);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  activeColor: Colors.blue,
                  value: _selectedIndex == index,
                  onChanged: (val) {
                    setState(() {
                      _selectedIndex = val! ? index : null;
                    });
                    ReportPDFCommonvar.ProductStage = index;
                    widget.onChanged(_selectedIndex);
                  },
                ),
                Text(widget.options[index]),
              ],
            ),
          ),
        );
      }),
    );
  }
}
