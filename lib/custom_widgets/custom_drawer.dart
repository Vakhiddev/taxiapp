import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';

Drawer drawer({required PackageInfo packageInfo,required double height,  XFile? image,  VoidCallback? avatarPressed,  VoidCallback? iconPressed }) {
  return Drawer(
    backgroundColor: const Color(0xff1E2127),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 24),

               Padding(
                 padding: const EdgeInsets.only(left: 12.0),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     InkWell(
                       onTap: avatarPressed,
                       child: const CircleAvatar(
                         radius: 40,
                         backgroundImage:AssetImage("assets/images/user_foto.png"),
                       ),

                     ),
                     const SizedBox(width: 10),

                      Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const SizedBox(height: 12),

                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             const TextContainer(
                               'Дмитрий',
                               fontWeight: FontWeight.w600,
                             ),
                             const SizedBox(width: 36),

                             InkWell(
                               onTap: iconPressed,
                                 child: SvgPicture.asset("assets/icons/edit_pensil.svg", fit: BoxFit.cover,))
                           ],
                         ),

                         const TextContainer(
                           '+998 93 531 0224',
                           fontWeight: FontWeight.w400,
                         ),
                         const TextContainer(
                           'ID 0075',
                           fontWeight: FontWeight.w400,
                         ),
                       ],
                     )
                   ],
                 ),
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
                leading:  ImageIcon(const AssetImage("assets/icons/Setting.png"), color: Colors.grey.shade700),
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

              SizedBox(height: height * 0.3),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                child: GestureDetector(
                  onTap: () {},
                  child: const TextContainer(
                    'Выход из аккаунта',
                    fontWeight: FontWeight.w400,
                    textColor: Colors.yellow,
                  ),
                ),
              ),

              SizedBox(height: height * 0.028),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextContainer("Версия ${packageInfo.version}", fontSize: 12,),
              ),

             const Spacer()
            ],
          ),
        ),
      ),
    ),
  );
}
