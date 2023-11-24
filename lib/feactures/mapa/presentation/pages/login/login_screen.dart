import 'package:driver_ambulance/feactures/core/utils/dimensions.dart';
import 'package:driver_ambulance/feactures/mapa/presentation/widgets/big_text.dart';
import 'package:driver_ambulance/feactures/mapa/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/colors.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            'assets/1.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 2,
                    color: AppColors.white,
                  ),
                )),
                BigText(
                  text: 'Swiftcare',
                  size: Dimensions.font20 * 1.8,
                  color: AppColors.white,
                ),
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                )),
              ],
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Button(
              boxBorder: Border.all(color: colors.primaryColor, width: 2),
              width: double.maxFinite,
              height: Dimensions.height40 * 1.5,
              radius: Dimensions.radius20 * 2,
              on_pressed: () {
                context.go('/login_page');
              },
              text: 'Conductor',
              color: AppColors.white,
              textColor: AppColors.black,
            ),
            SizedBox(
              height: Dimensions.height15,
            ),
            Button(
              width: double.maxFinite,
              height: Dimensions.height40 * 1.5,
              radius: Dimensions.radius20 * 2,
              on_pressed: () {
                context.go('/login_page');
              },
              text: 'Medical Staff',
              color: colors.primaryColor,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
          ],
        )
      ]),
    );
  }
}
