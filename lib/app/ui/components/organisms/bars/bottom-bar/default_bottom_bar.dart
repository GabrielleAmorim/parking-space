import 'package:flutter/material.dart';

import '../../../../theme/color_theme.dart';

class DefaultBottomBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItens;
  final Color bottomBarColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final int index;
  final Function(int) onTap;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;

  DefaultBottomBar(
      {required this.onTap,
      required this.bottomBarItens,
      this.bottomBarColor = ColorTheme.white,
      this.selectedItemColor = ColorTheme.primaryColor,
      this.unselectedItemColor = Colors.black,
      this.index = 0,
      this.selectedLabelStyle,
      this.unselectedLabelStyle});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: this.index,
      onTap: this.onTap,
      items: this.bottomBarItens,
      backgroundColor: this.bottomBarColor,
      selectedItemColor: this.selectedItemColor,
      unselectedItemColor: this.unselectedItemColor,
      selectedLabelStyle: this.selectedLabelStyle,
      unselectedLabelStyle: this.unselectedLabelStyle,
    );
  }
}
