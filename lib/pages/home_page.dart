import 'package:flutter/material.dart';
import 'package:uas_kelompok1_mobile/DbHelper.dart';
import 'package:uas_kelompok1_mobile/main.dart';
import 'package:uas_kelompok1_mobile/models/item.dart';
import 'package:uas_kelompok1_mobile/pages/biodata_page.dart';

class homePage extends StatelessWidget{

  List<Item> itemList;

  @override
  Widget build(BuildContext context) {
    if (itemList == null){
      itemList = List<Item>();
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("UAS Pemrograman Mobile"),
        ),
      body: myButton(),
      ),
    );
  }
}

class myButton extends StatefulWidget{

  Item item;

  @override
  State<myButton> createState() => _myButton(item);
}

class _myButton extends State<myButton>{
  
  DbHelper dbHelper = DbHelper();

  int count = 0;
  
  _myButton(Item item);
  
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Mulai"),
              onPressed: () async {
                var item  = await navigateToBiodata(context, null);
                if(item != null){
                  addItem(item);
                }
              },
            ),
          ],
        ),
      );
  }
  Future<Item> navigateToBiodata(BuildContext context, Item item) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return MyApp();
      }),
    );
    return result;
  }

  void addItem(Item item) async {
    int result = await dbHelper.insert(item);
    if (result > 0) {
      Navigator.pushNamed(context, '/data');
    }
  }

}