// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class Testing extends StatefulWidget {
//   const Testing({super.key});
//
//   @override
//   State<Testing> createState() => _TestingState();
// }
//
// class _TestingState extends State<Testing> {
//   bool sendSms = true;
//   String timerText = '00:59';
//   Timer? timer;
//
//   @override
//   void dispose() {
//     timer?.cancel(); // Cancel the timer when the widget is disposed
//     super.dispose();
//   }
//
//   void startTimer() {
//     const oneSecond = Duration(seconds: 1);
//     timer = Timer.periodic(oneSecond, (timer) {
//       if (timerText == '00:00') {
//         timer.cancel();
//       } else {
//         setState(() {
//           List<String> timeSplit = timerText.split(':');
//           int minutes = int.parse(timeSplit[0]);
//           int seconds = int.parse(timeSplit[1]);
//
//           if (seconds > 0) {
//             seconds--;
//           } else {
//             seconds = 59;
//             minutes--;
//           }
//           timerText =
//               '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 setState(() {
//                   sendSms = true;
//                   timerText = '00:59'; // Reset the timer text
//                 });
//                 startTimer(); // Start the timer
//                 await Future.delayed(Duration(seconds: 60));
//                 setState(() {
//                   sendSms = false;
//                 });
//               },
//               child: Text("Start Timer"),
//             ),
//             SizedBox(height: 50),
//             sendSms
//                 ? Text(
//                     timerText,
//                     style: TextStyle(color: Colors.white),
//                   )
//                 : SizedBox()
//           ],
//         ),
//       ),
//     );
//   }
// }
