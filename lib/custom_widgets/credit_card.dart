
import 'package:flutter/material.dart';

Widget customCard({required String image, required String cardNumber, VoidCallback? onPressed}){
  return Card(
    color: Colors.white10,
    child: ListTile(
      leading: Container(
        width: 55,
        decoration: BoxDecoration(
            color: Colors.grey.shade700,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: AssetImage(image)
            )
        ),
      ),
      title:  Text(cardNumber, style: const TextStyle(color: Colors.white)),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Icons.chevron_right, color: Colors.grey,)),
    ),
  );
}
