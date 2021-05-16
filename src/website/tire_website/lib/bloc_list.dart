import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/auth/bloc/product_bloc.dart';
import 'business_logic/auth/bloc/shop_bloc/bloc/shop_bloc.dart';

List<BlocProvider<Cubit<Object>>> blocList(BuildContext context) {
  return <BlocProvider<Cubit<Object>>>[
    BlocProvider<ProductBloc>(create: (BuildContext context) => ProductBloc()),
    BlocProvider<ShopBloc>(create: (BuildContext context) => ShopBloc())
  ];
}
