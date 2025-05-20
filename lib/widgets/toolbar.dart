import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/utils.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback voidCallback;
  final bool showLogoutIcon;
  final VoidCallback? onLogout;

  const Toolbar({
    super.key,
    required this.text,
    required this.voidCallback,
    this.backgroundColor = AppColor.whiteColor,
    this.showLogoutIcon = false,
    this.onLogout,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
      ),
      centerTitle: true,
      title: Text(text,
          textAlign: TextAlign.center,
          style: normalTextStyle(18, FontWeight.w600, AppColor.textColor)),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: AppColor.blackColor),
        onPressed: voidCallback,
      ),
      actions: showLogoutIcon
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                  icon: const Icon(Icons.logout, color: AppColor.blackColor),
                  onPressed: onLogout,
                ),
              ),
            ]
          : [],
    );
  }
}
