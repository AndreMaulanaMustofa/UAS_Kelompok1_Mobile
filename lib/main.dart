import 'package:flutter/material.dart';
import 'package:uas_kelompok1_mobile/pages/biodata_page.dart';
import 'package:uas_kelompok1_mobile/pages/data_page.dart';
import 'package:uas_kelompok1_mobile/pages/detail_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' :(context) => BiodataPage(),
      '/data' :(context) => DataPage(),
      '/detail' :(context) => DetailPage(),
    },
  ));
}

