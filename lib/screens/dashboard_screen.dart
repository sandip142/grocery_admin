import 'package:flutter/material.dart';
import 'package:grocery_admin/consts/constants.dart';
import 'package:grocery_admin/innerScreen/add_prod.dart';
import 'package:grocery_admin/responsive.dart';
import 'package:grocery_admin/services/utils.dart';
import 'package:grocery_admin/widgets/buttons.dart';
import 'package:grocery_admin/widgets/header.dart';
import 'package:grocery_admin/widgets/order_list.dart';
import 'package:grocery_admin/widgets/product_grid.dart';
import 'package:grocery_admin/widgets/text_widget.dart';

import 'package:provider/provider.dart';
import 'package:grocery_admin/controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    //MenuController menuController =MenuController();
    final Size size = Utils(context).getScreenSize;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              fct: () {
                context.read<AmenuController>().controlDashboarkMenu();
              },
              headTittle: "Dashboard",
            ),
            TextWidget(text: "latest Product", color: color),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                ButtonsWidget(
                  onPressed: () {
                    Navigator.pushNamed(context,UploadProductForm.route);
                  },
                  text: 'view all',
                  icon: Icons.store,
                  backgroundColor: Colors.blue,
                ),
                const Spacer(),
                ButtonsWidget(
                  onPressed: () {},
                  text: 'Add Product',
                  icon: Icons.add,
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Responsive(
                        mobile: ProductGridWidget(
                          crossAxisCount: size.width < 650 ? 2 : 4,
                          isInMain: true,
                          childAspectRatio:
                              size.width < 650 && size.width > 350 ? 1.1 : 0.8,
                        ),
                        desktop: ProductGridWidget(
                          childAspectRatio: size.width < 1400 ? 0.8 : 1.05,
                          isInMain: true,
                        ),
                      ),
                      const OrdersList(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
