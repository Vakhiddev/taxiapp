import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Setting", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700)),
    );
  }
}
