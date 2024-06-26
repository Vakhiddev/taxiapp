import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';
import 'package:taxiapp/drawer_menu/myadress.dart';
import 'package:taxiapp/drawer_menu/payment.dart';
import 'package:taxiapp/screens%20copy/history_order.dart';
import 'package:taxiapp/theme/colors.dart';

import '../screens copy/settings.dart';

Drawer drawer(
    {required PackageInfo packageInfo,
    required double height,
    required BuildContext context,
    XFile? image,
    VoidCallback? avatarPressed,
    VoidCallback? iconPressed}) {
  return Drawer(
    backgroundColor: Theme.of(context).customColor.containerColor,
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
                        backgroundImage:
                            AssetImage("assets/images/user_foto.png"),
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
                                child: SvgPicture.asset(
                                  "assets/icons/edit_pensil.svg",
                                  color: Theme.of(context)
                                      .customColor
                                      .mainTextColor,
                                  fit: BoxFit.cover,
                                ))
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
                leading: ImageIcon(
                  const AssetImage("assets/icons/Location.png"),
                  color: Colors.grey.shade700,
                ),
                title: const TextContainer(
                  'Мои адреса',
                  fontWeight: FontWeight.w400,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyAdress(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: ImageIcon(
                  const AssetImage("assets/icons/Plagiarism Checker.png"),
                  color: Colors.grey.shade700,
                ),
                title: const TextContainer(
                  'История заказов',
                  fontWeight: FontWeight.w400,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoryOrder(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: ImageIcon(
                  const AssetImage("assets/icons/Wallet.png"),
                  color: Colors.grey.shade700,
                ),
                title: const TextContainer(
                  'Варианты оплаты',
                  fontWeight: FontWeight.w400,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Payment(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: ImageIcon(const AssetImage("assets/icons/Setting.png"),
                    color: Colors.grey.shade700),
                title: const TextContainer(
                  'Настройки',
                  fontWeight: FontWeight.w400,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.ellipses_bubble,
                  color: Colors.grey.shade700,
                ),
                title: const TextContainer(
                  'Служба поддержки',
                  fontWeight: FontWeight.w400,
                ),
                onTap: () {},
              ),
              SizedBox(height: height * 0.3),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                child: GestureDetector(
                  onTap: () {},
                  child: TextContainer(
                    'Выход из аккаунта',
                    fontWeight: FontWeight.w400,
                    textColor: Theme.of(context).customColor.thirdTextColor,
                  ),
                ),
              ),
              SizedBox(height: height * 0.028),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextContainer(
                  "Версия ${packageInfo.version}",
                  fontSize: 12,
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    ),
  );
}
