import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uas_kelompok1_mobile/DbHelper.dart';
import 'package:uas_kelompok1_mobile/models/item.dart';
import 'package:uas_kelompok1_mobile/pages/biodata_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  Future<void> _delete(int id) async {
    print(id);
    await DbHelper.delete(id);
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
                  onPressed: (() {
                    Fluttertoast.showToast(
                      msg: "Success Delete",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
                    // _delete(_biodata[index].id);
                  }),
                ),
                title: Text(itemList[index].nama),
                subtitle: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text('NIM : ${itemList[index].nim}'),
                      ],
                    )),
              ),
            );
          },
        );
      },
    ));
  }
}
