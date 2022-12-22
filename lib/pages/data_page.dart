import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uas_kelompok1_mobile/DbHelper.dart';
import 'package:uas_kelompok1_mobile/models/item.dart';

class DataPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DataPage> {

  Item item;

  List<Item> itemList;

  int count = 0;

  DbHelper dbHelper = DbHelper();
  
  @override
  Widget build(BuildContext context) {
    if(itemList == null){
      itemList = List<Item>();
    }
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      appBar: AppBar(
        title: Text('List data mahasiswa'),
      ),
      body: ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index){
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.account_circle),
              ),
              title: Text(this.itemList[index].nama, style: textStyle,),
              subtitle: Text(this.itemList[index].kelamin),
              trailing: GestureDetector(
                child: Icon(Icons.delete),
                onTap: (){
                  deleteItem(itemList[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void updateListView(){
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database){
      Future<List<Item>> itemListFuture = dbHelper.getItemList();
      itemListFuture.then((itemList){
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }

  void deleteItem(Item item) async {
    int result = await dbHelper.delete(item.nim);
    if(result > 0){
      updateListView();
    }
  }
}
