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
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                'https://www.pngkit.com/png/detail/251-2511622_ambulance-drawing-side-view-ambulance-cartoon.png'),
            SizedBox(
              height: Dimensions.height20,
            ),
            Row(
              children: [
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 2,
                    color: AppColors.black,
                  ),
                )),
                BigText(
                  text: 'Last Minute',
                  size: Dimensions.font20 * 1.8,
                ),
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 2,
                    color: AppColors.black,
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
        ),
      )),
    );
  }
}
