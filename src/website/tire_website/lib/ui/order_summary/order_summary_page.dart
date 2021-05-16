import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tire_website/business_logic/auth/bloc/product_bloc.dart';
import 'package:tire_website/business_logic/auth/bloc/shop_bloc/bloc/shop_bloc.dart';
import 'package:tire_website/business_logic/auth/model/order_model.dart';
import 'package:tire_website/business_logic/auth/model/product_model.dart';
import 'package:tire_website/business_logic/auth/model/route.dart';
import 'package:tire_website/business_logic/auth/model/user_details_model.dart';
import 'package:tire_website/ui/shared_widgets/custom_button.dart';
import 'package:tire_website/ui/shared_widgets/custom_dialog.dart';
import 'package:tire_website/ui/shared_widgets/custom_header_sidemenu_widget.dart';
import 'package:tire_website/ui/shared_widgets/custom_image_widget.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/ui/shared_widgets/custom_textfield.dart';
import 'package:tire_website/ui/shared_widgets/responsive_widget.dart';
import 'package:tire_website/utils/eums.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderSummaryPage extends StatefulWidget {
  const OrderSummaryPage({Key key}) : super(key: key);

  @override
  _OrderSummaryPageState createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ShopBloc>(context).add(GetAllCartItemEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomHeaderAndSideMenuWidget(
        child: CustomResponsiveWidget(
          desktopView: desktop(context),
          tabletView: tablet(context),
          mobileView: tablet(context),
        ),
      ),
    );
  }

  Widget desktop(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height,
      child: Material(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30.0),
            Row(
              children: const <Widget>[
                SizedBox(),
                CustomText(
                  text: '    Billing Address',
                  size: 14,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            BlocConsumer<ShopBloc, ShopState>(
              listener: (BuildContext context, ShopState state) {
                if (state is ErrorShopState) {
                  CustomWarningDialog.showSnackBar(
                    context: context,
                    message: state.message,
                  );
                }
              },
              builder: (BuildContext context, ShopState state) {
                if (state is LoadingShopState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoadedShopState) {
                  return CustomCardDesktop(
                    userData: state.userData,
                    cartList: state.cartList,
                  );
                } else if (state is ErrorShopState) {
                  return CustomText(
                    text: state.message,
                    fontWeight: FontWeight.w300,
                    size: 14,
                    color: Colors.red,
                    textAlign: TextAlign.center,
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget tablet(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height,
      child: Material(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30.0),
            Row(
              children: const <Widget>[
                SizedBox(),
                CustomText(
                  text: '    Billing Address',
                  size: 14,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            BlocConsumer<ShopBloc, ShopState>(
              listener: (BuildContext context, ShopState state) {
                if (state is ErrorShopState) {
                  CustomWarningDialog.showSnackBar(
                    context: context,
                    message: state.message,
                  );
                }
              },
              builder: (BuildContext context, ShopState state) {
                if (state is LoadingShopState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoadedShopState) {
                  return CustomCardTablet(
                    userData: state.userData,
                    cartList: state.cartList,
                  );
                } else if (state is ErrorShopState) {
                  return CustomText(
                    text: state.message,
                    fontWeight: FontWeight.w300,
                    size: 14,
                    color: Colors.red,
                    textAlign: TextAlign.center,
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomCardTablet extends StatelessWidget {
  CustomCardTablet({this.userData, this.cartList});

  final UserDetails userData;
  final List<CartModel> cartList;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void validate(BuildContext context) {
    final FormState formState = formKey.currentState;
    if (formState.validate()) {
      final String fullName = fullNameController.text.trim();
      final String phone = phoneController.text.trim();
      final String _address = addressController.text.trim();
      final String state = stateController.text.trim();
      final String city = cityController.text.trim();

      final Map<String, dynamic> userData = <String, dynamic>{
        'fullname': fullName,
        'phone': phone,
      };

      final Map<String, dynamic> address = <String, dynamic>{
        'address': _address,
        'state': state,
        'city': city,
      };

      final OrderModel order = OrderModel(
        userData: userData,
        address: address,
        products: cartList.map((CartModel e) => e.toMap()).toList(),
        status: 'pending',
      );

      BlocProvider.of<ProductBloc>(context).add(AddOrderEvent(order));
    } else {
      CustomWarningDialog.showSnackBar(
        context: context,
        message: 'Please fill all form input',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    phoneController.text = userData.phoneNumber.toString() ?? '';
    fullNameController.text = userData.fullName ?? '';

    int total = 0;

    for (final CartModel e in cartList) {
      total += e.price;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            elevation: 5.0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CustomText(
                      text: 'Full Name',
                      size: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(height: 5.0),
                    CustomTextField(
                      controller: fullNameController,
                      title: 'Full Name',
                      length: 5,
                    ),
                    const SizedBox(height: 15.0),
                    const CustomText(
                      text: 'Phone number',
                      size: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(height: 5.0),
                    CustomTextField(
                      controller: phoneController,
                      title: 'Phone number',
                      length: 10,
                    ),
                    const SizedBox(height: 15.0),
                    const CustomText(
                      text: 'Address',
                      size: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(height: 5.0),
                    CustomTextField(
                      controller: addressController,
                      title: 'Address',
                      length: 10,
                    ),
                    const SizedBox(height: 15.0),
                    const CustomText(
                      text: 'State',
                      size: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                      controller: stateController,
                      title: 'State',
                      length: 2,
                    ),
                    const SizedBox(height: 15.0),
                    const CustomText(
                      text: 'City',
                      size: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                      controller: cityController,
                      title: 'City',
                      length: 2,
                    ),
                    const SizedBox(height: 15.0),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40.0),
          const CustomText(
            text: '   Order Summary',
            size: 14,
            fontWeight: FontWeight.bold,
          ),
          Card(
            elevation: 5.0,
            margin: const EdgeInsets.all(10.0),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cartList.length,
              itemBuilder: (BuildContext context, int index) {
                final CartModel cartItem = cartList[index];

                return Row(
                  children: <Widget>[
                    SizedBox(
                      height: 120.0,
                      width: 150.0,
                      child: CustomImageWidget(
                        imageWidgetType: ImageWidgetType.network,
                        imageUrl: cartItem.images.first,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CustomText(
                          text: cartItem.productName,
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: cartItem.productBrand,
                          size: 12,
                        ),
                        CustomText(
                          text: '# ${cartItem.price}',
                          size: 13,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).accentColor,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              const CustomText(
                text: '   TOTAL: ',
                size: 16,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                color: Theme.of(context).accentColor,
                text: '# $total',
                size: 16,
                fontWeight: FontWeight.w300,
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          BlocConsumer<ProductBloc, ProductState>(
            listener: (BuildContext context, ProductState state) {
              if (state is ErrorAddOrderState) {
                CustomWarningDialog.showSnackBar(
                  context: context,
                  message: state.message,
                );
              } else if (state is LoadedAddOrderState) {
                VxNavigator.of(context)
                    .replace(Uri.parse(RouteClass.orderComplete));
              }
            },
            builder: (BuildContext context, ProductState state) {
              if (state is LoadingAddOrderState) {
                return const Center(child: CircularProgressIndicator());
              }
              return Center(
                child: CustomButton(
                  buttonColor: Colors.green,
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 50.0,
                  onPress: () => validate(context),
                  title: 'Continue to payment',
                ),
              );
            },
          ),
          const SizedBox(height: 100.0),
        ],
      ),
    );
  }
}

class CustomCardDesktop extends StatelessWidget {
  CustomCardDesktop({this.userData, this.cartList});

  final UserDetails userData;
  final List<CartModel> cartList;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void validate(BuildContext context) {
    final FormState formState = formKey.currentState;
    if (formState.validate()) {
      final String fullName = fullNameController.text.trim();
      final String phone = phoneController.text.trim();
      final String _address = addressController.text.trim();
      final String state = stateController.text.trim();
      final String city = cityController.text.trim();

      final Map<String, dynamic> userData = <String, dynamic>{
        'fullname': fullName,
        'phone': phone,
      };

      final Map<String, dynamic> address = <String, dynamic>{
        'address': _address,
        'state': state,
        'city': city,
      };

      final OrderModel order = OrderModel(
        userData: userData,
        address: address,
        products: cartList.map((CartModel e) => e.toMap()).toList(),
        status: 'pending',
      );

      BlocProvider.of<ProductBloc>(context).add(AddOrderEvent(order));
    } else {
      CustomWarningDialog.showSnackBar(
        context: context,
        message: 'Please fill all form input',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    phoneController.text = userData.phoneNumber.toString() ?? '';
    fullNameController.text = userData.fullName ?? '';

    int total = 0;

    for (final CartModel e in cartList) {
      total += e.price;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            elevation: 5.0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CustomText(
                      text: 'Full Name',
                      size: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(height: 5.0),
                    CustomTextField(
                      controller: fullNameController,
                      title: 'Full Name',
                      length: 5,
                    ),
                    const SizedBox(height: 15.0),
                    const CustomText(
                      text: 'Phone number',
                      size: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(height: 5.0),
                    CustomTextField(
                      controller: phoneController,
                      title: 'Phone number',
                      length: 10,
                    ),
                    const SizedBox(height: 15.0),
                    const CustomText(
                      text: 'Address',
                      size: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(height: 5.0),
                    CustomTextField(
                      controller: addressController,
                      title: 'Address',
                      length: 10,
                    ),
                    const SizedBox(height: 15.0),
                    const CustomText(
                      text: 'State',
                      size: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                      controller: stateController,
                      title: 'State',
                      length: 2,
                    ),
                    const SizedBox(height: 15.0),
                    const CustomText(
                      text: 'City',
                      size: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                      controller: cityController,
                      title: 'City',
                      length: 2,
                    ),
                    const SizedBox(height: 15.0),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40.0),
          const CustomText(
            text: '   Order Summary',
            size: 14,
            fontWeight: FontWeight.bold,
          ),
          Card(
            elevation: 5.0,
            margin: const EdgeInsets.all(10.0),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cartList.length,
              itemBuilder: (BuildContext context, int index) {
                final CartModel cartItem = cartList[index];

                return Row(
                  children: <Widget>[
                    SizedBox(
                      height: 120.0,
                      width: 150.0,
                      child: CustomImageWidget(
                        imageWidgetType: ImageWidgetType.network,
                        imageUrl: cartItem.images.first,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CustomText(
                          text: cartItem.productName,
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: cartItem.productBrand,
                          size: 12,
                        ),
                        CustomText(
                          text: '# ${cartItem.price}',
                          size: 13,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).accentColor,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              const CustomText(
                text: '   TOTAL: ',
                size: 16,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                color: Theme.of(context).accentColor,
                text: '# $total',
                size: 16,
                fontWeight: FontWeight.w300,
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          BlocConsumer<ProductBloc, ProductState>(
            listener: (BuildContext context, ProductState state) {
              if (state is ErrorAddOrderState) {
                CustomWarningDialog.showSnackBar(
                  context: context,
                  message: state.message,
                );
              } else if (state is LoadedAddOrderState) {
                VxNavigator.of(context)
                    .replace(Uri.parse(RouteClass.orderComplete));
              }
            },
            builder: (BuildContext context, ProductState state) {
              if (state is LoadingAddOrderState) {
                return const Center(child: CircularProgressIndicator());
              }
              return Center(
                child: CustomButton(
                  buttonColor: Colors.green,
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 50.0,
                  onPress: () => validate(context),
                  title: 'Continue to payment',
                ),
              );
            },
          ),
          const SizedBox(height: 100.0),
        ],
      ),
    );
  }
}
