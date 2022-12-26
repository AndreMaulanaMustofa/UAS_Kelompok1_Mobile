import 'package:flutter/material.dart';
import 'package:uas_kelompok1_mobile/models/item.dart';
import 'package:uas_kelompok1_mobile/pages/biodata_page.dart';
import 'package:uas_kelompok1_mobile/pages/data_page.dart';
import 'package:uas_kelompok1_mobile/pages/detail_page.dart';
import 'package:uas_kelompok1_mobile/pages/home_page.dart';

void main(){
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' :(context) => homePage(),
      '/home' :(context) => MyApp(),
      '/data' :(context) => DataPage(),
      '/detail' :(context) => DetailPage(),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Tabs Demo'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: "Tambah Data"),
                Tab(icon: Icon(Icons.contacts), text: "Data List"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BiodataPage(),
              DataPage(),
            ],
          ),
        ),
      ),
    );
  }
}
