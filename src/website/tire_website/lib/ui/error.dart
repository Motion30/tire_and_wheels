import 'package:flutter/material.dart';
import 'package:tire_website/ui/shared_widgets/custom_button.dart';
import 'package:tire_website/ui/shared_widgets/custom_image_widget.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/utils/eums.dart';
import 'package:url_launcher/url_launcher.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key key}) : super(key: key);

  final String _url = 'https://api.whatsapp.com/send?phone=2347032107251';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            const SizedBox(height: 20.0),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 450,
                maxWidth: 500,
              ),
              child: const CustomImageWidget(
                boxFit: BoxFit.contain,
                imageUrl: 'assets/images/server_down.png',
                imageWidgetType: ImageWidgetType.asset,
              ),
            ),
            const SizedBox(height: 15.0),
            CustomText(
              text:
                  'Website under maintanance, You can contact us via WhatsApp.',
              size: 18,
              color: Colors.grey[700],
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15.0),
            CustomButton(
              onPress: () async {
                await canLaunch(_url)
                    ? await launch(_url)
                    : throw 'Could not launch $_url';
              },
              title: 'Chat With Us',
              buttonColor: Colors.green,
              fontSize: 13,
              fontWeight: FontWeight.w300,
              width: MediaQuery.of(context).size.width * 0.40,
            ),
          ],
        ),
      ),
    );
  }
}
