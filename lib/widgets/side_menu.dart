import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_admin/innerScreen/Add_product.dart';
import 'package:grocery_admin/innerScreen/all_order.dart';
import 'package:grocery_admin/providers/dark_theme_provider.dart';
import 'package:grocery_admin/services/utils.dart';
import 'package:grocery_admin/widgets/text_widget.dart';

import 'package:provider/provider.dart';

import '../screens/main_screen.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final themeState = Provider.of<DarkThemeProvider>(context);

    final color = Utils(context).color;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/images/groceries.png",
            ),
          ),
          DrawerListTile(
            title: "Main",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
            },
            icon: Icons.home_filled,
          ),
          DrawerListTile(
            title: "View all product",
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllProduct(),
                ),
              );
            },
            icon: Icons.store,
          ),
          DrawerListTile(
            title: "View all order",
            press: () {
               // Navigator.pushNamed(context,AllOrdersScreen.route);
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllOrdersScreen(),
                ),
              );
            },
            icon: IconlyBold.bag2,
          ),
          SwitchListTile(
              title: const Text('Theme'),
              secondary: Icon(themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              value: theme,
              onChanged: (value) {
                setState(() {
                  themeState.setDarkTheme = value;
                });
              })
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final color = theme == true ? Colors.white : Colors.black;

    return ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: Icon(
          icon,
          size: 18,
        ),
        title: TextWidget(
          text: title,
          color: color,
        ));
  }
}
