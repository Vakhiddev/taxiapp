import 'package:flutter/material.dart';
import 'package:ripple_wave/ripple_wave.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

late AnimationController animationController;

void start() {
  animationController.repeat();
}

void stop() {
  animationController.stop();
}

class _DemoPageState extends State<DemoPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RippleWave(
              color: Color(0xFF32ABE0),
              repeat: false,
              waveCount: 4,
              animationController: animationController,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.blue,
                  width: 4,
                )),
                child: ImageIcon(
                  AssetImage(
                    'assets/location1.png',
                  ),
                  color: Colors.white,
                ),
              )),
          const SizedBox(
            height: 200,
          ),
          TextButton(
            onPressed: () {
              start();
            },
            child: const Text(
              'Start animation',
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextButton(
            onPressed: () {
              stop();
            },
            child: const Text(
              'Stop animation',
            ),
          ),
        ],
      ),
    );
  }
}
