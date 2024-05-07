import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Note", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700)),
    );
  }
}
