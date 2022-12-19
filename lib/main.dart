import 'package:flutter/material.dart';
import 'package:uas_kelompok1_mobile/pages/biodata_page.dart';
import 'package:uas_kelompok1_mobile/pages/data_page.dart';
import 'package:uas_kelompok1_mobile/pages/detail_page.dart';

void main() => runApp(MyApp());

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
                Tab(icon: Icon(Icons.home), text: "Tab 1"),
                Tab(icon: Icon(Icons.contacts), text: "Tab 2")
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
