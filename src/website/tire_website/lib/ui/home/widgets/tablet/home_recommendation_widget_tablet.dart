import 'package:flutter/material.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';

class HomeRecommendationWidgetTablet extends StatelessWidget {
  const HomeRecommendationWidgetTablet();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
      height: 200.0,
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: <Widget>[
          const CustomText(
            text: '100,000 CUSTOMERS ARE RECOMMENDING TYRES AND WHEELS',
            fontWeight: FontWeight.w600,
            size: 20,
            textAlign: TextAlign.center,
            color: Colors.white,
          ),
          const SizedBox(height: 20.0),
          const CustomText(
            text: 'Be the first to know about latest products',
            size: 16,
            textAlign: TextAlign.center,
            color: Colors.white,
          ),
          const SizedBox(height: 8.0),
          form(context),
        ],
      ),
    );
  }

  Widget form(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.55,
      height: 30.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width * 0.55,
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const CustomText(
              text: 'Enter Email',
              size: 11.0,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const CustomText(
                text: 'Subscribe',
                color: Colors.white,
                size: 11.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
