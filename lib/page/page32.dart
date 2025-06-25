import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newmaster/Layout/head2.dart';
import 'package:newmaster/bloc/Cubit/report_pdf_cubit.dart';
import 'package:newmaster/bloc/Cubit/report_pdf_state.dart';

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
      child: Scaffold(
        appBar: AppBar(title: const Text("Report Viewer")),
        body: BlocBuilder<ReportPDFCubit, ReportPDFState>(
          builder: (context, state) {
            if (state is ReportPDFLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ReportPDFError) {
              return Center(child: Text(state.message));
            } else if (state is ReportPDFLoaded) {
              return const SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: headerreport2(), // <-- will use static values already set
              );
            } else {
              return const Center(child: Text("Waiting..."));
            }
          },
        ),
      ),
    );
  }
}
