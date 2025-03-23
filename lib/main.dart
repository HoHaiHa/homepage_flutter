import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:my_first_app/screens/home/home_controller.dart';
import 'package:my_first_app/screens/home/home_screen.dart';
import 'package:my_first_app/screens/home/home_state.dart';
import 'package:my_first_app/themes/global_light_theme.dart';
import 'package:provider/provider.dart';

import 'di/di.dart';


void main() {
  configureDependencies();
  runApp(
    MultiProvider(
      providers: [
        StateNotifierProvider<HomePageNotifier,HomePageState>(
            create: (_) => HomePageNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: HomeScreen(),
    );
  }
}

// class Test extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     print(123);
//     return  Center(
//       child: Container(
//           width: 300, height: 300, color: Colors.red,
//           child: Center(child: Container(color: Colors.blue))
//       ),
//     );
//
//     // return  Container(
//     //           //alignment: Alignment.topLeft,
//     //           width: 300, height: 300, color: Colors.red,
//     //           child: Container(color: Colors.blue, width: 200, height: 200, child: Center(child: Text('Hello'))
//     //       )
//     // );
//
//     // return Row(
//     //   children: [
//     //     Container(height: 50, width: 50,color:Colors.red ),
//     //     Flexible(child: Container(color:Colors.blue)),
//     //   ],
//     // );
//   }
// }