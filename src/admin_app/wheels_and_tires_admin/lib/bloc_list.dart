import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/bloc/product_bloc.dart';

List<BlocProvider<Cubit<Object>>> blocList(BuildContext context) {
  return <BlocProvider<Cubit<Object>>>[
    BlocProvider<ProductBloc>(create: (BuildContext context) => ProductBloc())
  ];
}
