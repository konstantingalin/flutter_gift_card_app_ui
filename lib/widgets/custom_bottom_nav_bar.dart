import 'package:flutter/material.dart';
import 'package:flutter_gift_card_app_ui/screens/home_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavBarIcon(
              iconPath: Assets.icons.home,
              isSelected: index == 0,
              onTap: index != 0
                ?() {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const HomeScreen())
                    ),
                  );
                }
              : null,
            ),
            _NavBarIcon(
              iconPath: Assets.icons.discover,
            ),
            _NavBarIcon(
              iconPath: Assets.icons.gift,
            ),
            _NavBarIcon(
              iconPath: Assets.icons.card,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarIcon extends StatelessWidget {
  const _NavBarIcon({
    Key? key,
    required this.iconPath,
    this.onTap,
    this.isSelected =  false,
  }) : super(key: key);

  final String iconPath;
  final Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color =  isSelected ? ColorName.primaryColor : ColorName.dissabledGrey;
    return InkWell(
      onTap: onTap,
      child: Center(
        child: SvgPicture.asset(iconPath, color: color),
      ),
    );
  }
}