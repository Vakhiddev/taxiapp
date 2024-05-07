import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';

Drawer drawer({required PackageInfo packageInfo, XFile? image,  VoidCallback? onTap }) {
  return Drawer(
    backgroundColor: const Color(0xff1E2127),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 InkWell(
                   onTap: onTap,
                   child: CircleAvatar(
                     radius: 48,
                     backgroundImage: image != null ? FileImage(File(image!.path)) : null,
                   ),
        
                 ),
                 const SizedBox(width: 10),
                 const Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 15),

                     TextContainer(
                       'Дмитрий',
                       fontWeight: FontWeight.w600,
                     ),
                     TextContainer(
                       '+998 93 531 0224',
                       fontWeight: FontWeight.w400,
                     ),
                     TextContainer(
                       'ID 0075',
                       fontWeight: FontWeight.w400,
                     ),
                   ],
                 )
               ],
             ),

            const SizedBox(height: 50),

            ListTile(
              leading:  ImageIcon(const AssetImage("assets/icons/Location.png"), color: Colors.grey.shade700,),
              title: const TextContainer(
                'Мои адреса',
                fontWeight: FontWeight.w400,
              ),
              onTap: () {
                // Handle location button tap
              },
            ),
            ListTile(
              leading:  ImageIcon(const AssetImage("assets/icons/Plagiarism Checker.png"), color: Colors.grey.shade700,),
              title: const TextContainer(
                'История заказов',
                fontWeight: FontWeight.w400,
              ),
              onTap: () {
                // Handle history button tap
              },
            ),
            ListTile(
              leading:  ImageIcon(const AssetImage("assets/icons/Wallet.png"), color: Colors.grey.shade700,),
              title: const TextContainer(
                'Варианты оплаты',
                fontWeight: FontWeight.w400,
              ),
              onTap: () {
                // Handle payment button tap
              },
            ),
            ListTile(
              leading:  ImageIcon(const AssetImage("assets/icons/Setting.png"), color: Colors.grey.shade700,),
              title: const TextContainer(
                'Настройки',
                fontWeight: FontWeight.w400,
              ),
              onTap: () {
                // Handle settings button tap
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.ellipses_bubble, color: Colors.grey.shade700,),
              title: const TextContainer(
                'Служба поддержки',
                fontWeight: FontWeight.w400,
              ),
              onTap: () {
                // Handle chat button tap
              },
            ),
            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: GestureDetector(
                onTap: () {},
                child: const TextContainer(
                  'Выход из аккаунта',
                  fontWeight: FontWeight.w400,
                  textColor: Colors.yellow,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextContainer("Версия ${packageInfo.version}"),
            ),

            const SizedBox(height: 35)
          ],
        ),
      ),
    ),
  );
}
