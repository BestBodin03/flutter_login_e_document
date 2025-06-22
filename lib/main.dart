// import 'dart:io';
// import 'package:flutter/services.dart';
//---------------------------------------------

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newmaster/bloc/BlocEvent/PhInspectionStandardBloc.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:path_provider/path_provider.dart';

//--------------------------------------

import 'bloc/Observe/appBlocObserver.dart';
import 'bloc/cubit/Rebuild.dart';
import 'mainBody.dart';
import 'package:google_fonts/google_fonts.dart';

//--------------------------------------

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // ByteData data = await PlatformAssetBundle().load('assets/ca/mindmillo.pem');
  // SecurityContext.defaultContext
  //     .setTrustedCertificatesBytes(data.buffer.asInt8List());

  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  // HydratedBloc.storage = await HydratedStorage.build(
  //   storageDirectory: kIsWeb
  //       ? HydratedStorage.webStorageDirectory
  //       : await getTemporaryDirectory(),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<BlocPageRebuild>(
        create: (BuildContext context) =>
            BlocPageRebuild(), //For rebuild only page inside without app bar/left menu
      ),
      BlocProvider<ReportPdfBloc>(  // <-- ✅ เพิ่ม Bloc นี้เข้าไป
        create: (BuildContext context) => ReportPdfBloc(),
      ),
    ], child: const MainContext());
  }
}

class MainContext extends MyApp {
  const MainContext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocPageRebuild, bool>(
      builder: (_, e) {
        return MaterialApp(
          title: 'Flutter Login',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.tinosTextTheme(),
          ),
          debugShowCheckedModeBanner: false,
          home: const MainBlocRebuild(),
        );
      },
    );
  }
}
