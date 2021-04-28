import 'package:flutter/material.dart';
import 'package:wheels_and_tires_admin/ui/home/pages/orders_page.dart';
import 'package:wheels_and_tires_admin/ui/home/pages/store_page.dart';
import 'package:wheels_and_tires_admin/ui/home/pages/upload_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Icon(Icons.cloud_upload)),
    Tab(icon: Icon(Icons.store_outlined)),
    Tab(icon: Icon(Icons.shopping_cart_outlined)),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {},
            controller: _controller,
            tabs: list,
          ),
          title: Text('Admin App'),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            UploadPage(),
            StorePage(),
            OrdersPage(),
          ],
        ),
      ),
    );
  }
}
