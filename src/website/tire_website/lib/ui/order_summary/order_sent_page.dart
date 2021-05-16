import 'package:flutter/material.dart';
import 'package:tire_website/business_logic/auth/model/route.dart';
import 'package:tire_website/ui/shared_widgets/custom_button.dart';
import 'package:tire_website/ui/shared_widgets/custom_header_sidemenu_widget.dart';
import 'package:tire_website/ui/shared_widgets/custom_image_widget.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/ui/shared_widgets/responsive_widget.dart';
import 'package:tire_website/utils/eums.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderCompletePage extends StatelessWidget {
  const OrderCompletePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomHeaderAndSideMenuWidget(
        child: CustomResponsiveWidget(
          desktopView: body(context),
          tabletView: body(context),
          mobileView: body(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            VxNavigator.of(context).push(Uri.parse(RouteClass.chat)),
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 40.0),
          const SizedBox(
            height: 120,
            width: 120,
            child: CustomImageWidget(
              imageWidgetType: ImageWidgetType.asset,
              imageUrl: 'assets/images/check_mark.png',
            ),
          ),
          const SizedBox(height: 30.0),
          const CustomText(
            text: 'Order Sucessfully sent!',
            fontWeight: FontWeight.bold,
            size: 18,
          ),
          const SizedBox(height: 10.0),
          const CustomText(
            text: 'Your order is pending. You will receive a call/SMS soon. \n '
                'You can pay on delivery or proceed to make a transfer to our account.',
            fontWeight: FontWeight.w300,
            size: 14,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomButton(
                width: 80.0,
                fontSize: 14,
                buttonColor: Theme.of(context).primaryColor.withOpacity(0.7),
                fontWeight: FontWeight.w300,
                onPress: () => VxNavigator.of(context)
                    .clearAndPush(Uri.parse(RouteClass.productTyresPage)),
                title: 'Finish',
              ),
              CustomButton(
                fontSize: 14,
                buttonColor: Theme.of(context).accentColor.withOpacity(0.9),
                fontWeight: FontWeight.w300,
                onPress: () =>
                    VxNavigator.of(context).push(Uri.parse(RouteClass.chat)),
                title: 'Talk to customer care',
              ),
            ],
          )
        ],
      ),
    );
  }
}
