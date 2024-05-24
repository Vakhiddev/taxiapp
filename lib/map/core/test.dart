import 'package:flutter/material.dart';
import 'package:ripple_wave/ripple_wave.dart';

// class DemoPage extends StatefulWidget {
//   const DemoPage({Key? key}) : super(key: key);
//
//   @override
//   State<DemoPage> createState() => _DemoPageState();
// }
//
// late AnimationController animationController;
//
// void start() {
//   animationController.repeat();
// }
//
// void stop() {
//   animationController.stop();
// }
//
// class _DemoPageState extends State<DemoPage>
//     with SingleTickerProviderStateMixin {
//   @override
//   void initState() {
//     animationController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           RippleWave(
//               color: Color(0xFF32ABE0),
//               repeat: false,
//               waveCount: 4,
//               animationController: animationController,
//               child: Container(
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                   color: Colors.blue,
//                   width: 4,
//                 )),
//                 child: ImageIcon(
//                   AssetImage(
//                     'assets/location1.png',
//                   ),
//                   color: Colors.white,
//                 ),
//               ),
//           ),
//           const SizedBox(
//             height: 200,
//           ),
//           TextButton(
//             onPressed: () {
//               start();
//             },
//             child: const Text(
//               'Start animation',
//             ),
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           TextButton(
//             onPressed: () {
//               stop();
//             },
//             child: const Text(
//               'Stop animation',
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class WaveAnimationCircle extends StatefulWidget {
  final bool isActive;
  const WaveAnimationCircle({super.key, required this.isActive});

  @override
  State<WaveAnimationCircle> createState() => _WaveAnimationCircleState();
}

class _WaveAnimationCircleState extends State<WaveAnimationCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  void start() {
    animationController.repeat();
  }

  void stop() {
    animationController.stop();
  }

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    if (widget.isActive) {
      start();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(WaveAnimationCircle oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        start();
      } else {
        stop();
      }
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RippleWave(
            childTween: Tween(begin: 1.2, end: 1.2),
            color: Color(0xFF32ABE0),
            repeat: false,
            waveCount: 3,
            animationController: animationController,
            child: Stack(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: Color(0xFF32ABE0),
                        width: 4,
                      )),
                ),
              ],
            )),
        Center(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 44),
          child: Positioned(
              child: Image(
            image: AssetImage('assets/point.png'),
            width: 52,
            height: 52,
          )),
        ))
      ],
    );
  }
}


//  