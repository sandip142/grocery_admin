import 'package:flutter/material.dart';
import 'package:grocery_admin/controller.dart';
import 'package:grocery_admin/responsive.dart';
import 'package:grocery_admin/services/utils.dart';
import 'package:grocery_admin/widgets/header.dart';
import 'package:grocery_admin/widgets/product_grid.dart';
import 'package:grocery_admin/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).getScreenSize;
    return Scaffold(
      key: context.read<AmenuController>().getgridscaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                flex: 1,
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Header(
                      fct: () {
                        context.read<AmenuController>().controlProductsMenu();
                      },
                      headTittle: "All Product",
                    ),
                    Responsive(
                        mobile: ProductGridWidget(
                          crossAxisCount: size.width < 650 ? 2 : 4,
                          isInMain: false,
                          childAspectRatio:
                              size.width < 650 && size.width > 350 ? 1.1 : 0.8,
                        ),
                        desktop: ProductGridWidget(
                          childAspectRatio: size.width < 1400 ? 0.8 : 1.05,
                          isInMain: false,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}
