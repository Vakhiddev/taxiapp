import 'package:flutter/material.dart';

Widget customCard({required String image, required String cardNumber, VoidCallback? onPressed}){
  return Card(
    color: const Color.fromRGBO(40, 45, 53, 1), // Changed background color
    child: ListTile(
      contentPadding: const EdgeInsets.all(5), // Added padding to ListTile
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Container(
          width: 57,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8), // Added padding to the container
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0), // Adjusted to keep 5px distance from the container border
            child: Image.asset(
              image,
              fit: BoxFit.cover, // Adjust the fit as per your requirement
            ),
          ),
        ),
      ),
      title:  Text(
        cardNumber,
        style: const TextStyle(
          color: Colors.white, // Changed text color to white for visibility
        ),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.chevron_right,
          color: Colors.grey, // Kept icon color as grey
        ),
      ),
    ),
  );
}
