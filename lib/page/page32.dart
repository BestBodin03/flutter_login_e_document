import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newmaster/Layout/head2.dart';
import 'package:newmaster/bloc/Cubit/ReportPDFCubit.dart';
import 'package:newmaster/bloc/Cubit/ReportPDFState.dart';
import 'package:newmaster/page/P31ReportPDFcommon/ReportPDFCommonMain.dart';

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
    return BlocProvider(
      create: (_) => ReportPDFCubit()..loadReportPDF('assets/mockData/testCP.json'),
      child: BlocBuilder<ReportPDFCubit, ReportPDFState>(
        builder: (context, state) {
          if (state is ReportPDFLoaded) {
            return ReportPDFCommon(); // ส่งข้อมูลไปยังหน้าหลัก
          } else if (state is ReportPDFLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ReportPDFError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('Initializing...'));
          }
        },
      ),
    );
  }

}
