// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:newmaster/bloc/BlocEvent/AbstractEvent/PhInspectionStandardEvent.dart';
// import 'package:newmaster/bloc/BlocEvent/PhInspectionStandardBloc.dart';
// import 'package:newmaster/bloc/BlocState/PhInspectionStandardState.dart';


// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();

//   test('manual test: load and print loaded data', () async {
//     // Step 1: Override asset bundle
//     const testJson = '''{
//       "databasic": {
//         "PO": "12345",
//         "CP": "A01",
//         "CUSTOMER": "TestCustomer",
//         "PROCESS": "TestProcess",
//         "PARTNAME": "TestPart",
//         "CUSLOT": "L1",
//         "TPKLOT": "L2",
//         "MATERIAL": "Steel",
//         "USER_STATUS": "Passed",
//         "reportset": "R1"
//       },
//       "datain": [{
//         "NO": 1,
//         "TYPE": "Check",
//         "ITEM": "Item-01",
//         "ITEMname": "Man of the Year",
//         "METHOD": "Visual",
//         "METHODname": "Eye",
//         "FINAL": {
//           "SEQ": "1",
//           "PCS": "10",
//           "FREQUENCY": "Daily",
//           "SPECIFICATION": {
//             "name": "Spec A"
//           }
//         },
//         "LOAD": "5kg",
//         "CROSS": "X",
//         "REmARK": "OK",
//         "REMARKDETAIL": "None"
//       }]
//     }''';

//     ServicesBinding.instance.defaultBinaryMessenger.setMockMessageHandler(
//       'flutter/assets',
//       (message) async {
//         final String? key = const StringCodec().decodeMessage(message);
//         if (key == 'assets/mockData/testCP.json') {
//           return const StringCodec().encodeMessage(testJson);
//         }
//         return null;
//       },
//     );

//     // Step 2: Create the BLoC
//     final bloc = PhInspectionStandartBloc();

//     // Step 3: Listen to state changes
//     final subscription = bloc.stream.listen((state) {
//       if (state is PhInspectionLoading) {
//         print('[TEST] Loading...');
//       } else if (state is PhInspectionLoaded) {
//         print('[TEST] Loaded successfully!');
//         print('[TEST] Customer: ${state.report.databasic.CUSTOMER}');
//         print('[TEST] First Item Name: ${state.report.datain.first.ITEMname}');
//       } else if (state is PhInspectionError) {
//         print('[TEST] Error: ${state.message}');
//       }
//     });

//     // Step 4: Trigger the load event
//     bloc.add(LoadPhInspectionEvent());

//     // Step 5: Wait a bit for the Bloc to process
//     await Future.delayed(Duration(milliseconds: 300));

//     // Step 6: Clean up
//     await subscription.cancel();
//     await bloc.close();
//   });
// }
