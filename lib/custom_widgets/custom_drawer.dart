import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';

Drawer drawer({required PackageInfo packageInfo}) {
  return Drawer(
    backgroundColor: Color(0xff1E2127),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const DrawerHeader(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 48,
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: TextContainer(
              'Мои адреса',
              fontWeight: FontWeight.w400,
            ),
            onTap: () {
              // Handle location button tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const TextContainer(
              'История заказов',
              fontWeight: FontWeight.w400,
            ),
            onTap: () {
              // Handle history button tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const TextContainer(
              'Варианты оплаты',
              fontWeight: FontWeight.w400,
            ),
            onTap: () {
              // Handle payment button tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const TextContainer(
              'Настройки',
              fontWeight: FontWeight.w400,
            ),
            onTap: () {
              // Handle settings button tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const TextContainer(
              'Служба поддержки',
              fontWeight: FontWeight.w400,
            ),
            onTap: () {
              // Handle chat button tap
            },
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: const TextContainer(
              'Выход из аккаунта',
              fontWeight: FontWeight.w400,
              textColor: Colors.yellow,
            ),
          ),
          Text("App version ${packageInfo.version}"),
          const SizedBox(height: 35)
        ],
      ),
    ),
  );
}
