import 'package:flutter/material.dart';
import 'package:uas_kelompok1_mobile/main.dart';
import 'package:uas_kelompok1_mobile/models/item.dart';
import 'package:uas_kelompok1_mobile/pages/data_page.dart';
import 'package:uas_kelompok1_mobile/pages/home_page.dart';

class detailData extends StatelessWidget{

  Item item;
  
  detailData(this.item);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Detail " + item.nama),),
        body: Column(
          children: [
            Container(
              child: Text("Detail Data",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              ),
              padding: EdgeInsets.only(left: 160, bottom: 20, top: 20)
            ),
            Container(
              child: Text("NIM :"),
              
            ),
            Container(
              child: Text(item.nim.toString()),
              padding: EdgeInsets.only(left: 155, top: 10, bottom: 20),
            ),
            Container(
              child: Text("Nama :"),
            ),
            Container(
              child: Text(item.nama),
              padding: EdgeInsets.only(left: 155, top: 10, bottom: 20),
            ),
            Container(
              child: Text("Alamat :"),
            ),
            Container(
              child: Text(item.alamat),
              padding: EdgeInsets.only(left: 155, top: 10, bottom: 20),
            ),
            Container(
              child: Text("Kelamin :"),
            ),
            Container(
              child: Text(item.kelamin),
              padding: EdgeInsets.only(left: 155, top: 10, bottom: 20),
            ),
            Container(
              child: ElevatedButton(
              onPressed:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => homePage()
                  ),
                );
              }, 
              child: Text("Back"),
            ),
            padding: EdgeInsets.only(left: 155),
            ),
          ],
        ),
      ),
    );
  }
}