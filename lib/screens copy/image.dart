///  Testing

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ImagePage extends StatefulWidget {
//   const ImagePage({Key? key}) : super(key: key);
//
//   @override
//   _ImagePageState createState() => _ImagePageState();
// }
//
// class _ImagePageState extends State<ImagePage> {
//   XFile? _image; // Removed 'late'
//
//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedImage != null) { // Check if an image is picked
//       setState(() {
//         _image = pickedImage;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: _pickImage,
//           child: CircleAvatar(
//             backgroundColor: Colors.grey,
//             backgroundImage: _image != null ? FileImage(File(_image!.path)) : null,
//           ),
//         ),
//       ),
//       drawer: Drawer(
//         child: Column(
//           children: [
//             DrawerHeader(
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     // Display the picked image if available
//                     backgroundImage: _image != null ? FileImage(File(_image!.path)) : null,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
