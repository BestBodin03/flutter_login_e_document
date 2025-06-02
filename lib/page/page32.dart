import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'P32ReportPDFcommon/ReportPDFCommonMain.dart';

class Page32 extends StatelessWidget {
  const Page32({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page32Body();
  }
}

class Page32Body extends StatelessWidget {
  Page32Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReportPDFCommon();
  }
}
