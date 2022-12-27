import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uas_kelompok1_mobile/DbHelper.dart';
import 'package:uas_kelompok1_mobile/models/item.dart';
import 'package:uas_kelompok1_mobile/pages/biodata_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uas_kelompok1_mobile/pages/detail_data.dart';

class DataPage extends StatefulWidget {
  const DataPage({
    Key key,
    this.id,
    this.nim,
    this.nama,
  }) : super(key: key);

  final int id;
  final String nim;
  final String nama;

  @override
  State<DataPage> createState() => MyHomePageState();
}

class MyHomePageState extends State<DataPage> {
  List<Item> itemList = [];

  Future<void> _getBiodata() async {
    itemList = await DbHelper.getItemList();
  }

  Future delete(int nim) async {
    await DbHelper.delete(nim);
    setState(() {});
  }

  void navigateToDetail(Item item) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return detailData(item);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
      future: _getBiodata(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: (() {}),
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (() => delete(itemList[index].nim))),
                  title: Text(itemList[index].nama),
                  subtitle: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Text('NIM : ${itemList[index].nim}'),
                        ],
                      )),
                  onTap: () {
                    debugPrint("ListTile Tapped");
                    navigateToDetail(this.itemList[index]);
                  }),
            );
          },
        );
      },
    ));
  }
}
