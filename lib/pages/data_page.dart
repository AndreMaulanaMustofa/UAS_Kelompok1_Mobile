import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uas_kelompok1_mobile/DbHelper.dart';
import 'package:uas_kelompok1_mobile/models/item.dart';
import 'package:uas_kelompok1_mobile/pages/detail_page.dart';

class DataPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DataPage> {
  List<Item> itemList;

  int count = 0;

  DbHelper dbHelper = DbHelper();
  
  @override
  Widget build(BuildContext context) {
    
    if(itemList == null){
      itemList = List<Item>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('List data mahasiswa'),
      ),
      body: createListView(),
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
  
  ListView createListView() {
  TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
  return ListView.builder(
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
            onTap: () async {
              var item = await navigateToDetail(context, this.itemList[index]);
              if(item != null){
                editItem(item);
              }
            },
          ),
        );
      },
    );
  }
  
  Future<Item> navigateToDetail(BuildContext context, Item item) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return DetailPage();
        }
      ),
    );
    return result;
  }

  void editItem(Item item) async {
    int result = await dbHelper.update(item);
    if(result > 0){
      updateListView();
    }
  }
}
