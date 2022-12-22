import 'package:flutter/material.dart';

class Item{
  int _nim;
  String _nama;
  String _alamat;
  String _kelamin;

int get nim => this._nim;
set nim (int value) => this._nim = value;

String get nama => this._nama;
set nama(String value) => this._nama = value;

String get alamat => this._alamat;
set alamat (String value) => this._alamat = value;

String get kelamin => this._kelamin;
set kelamin (String value) => this._kelamin = value;

//konstruksi versi 1
Item(this._nim, this._nama, this._alamat, this._kelamin);

//konstruktor versi 2: konversi dari map ke item
Item.fromMap (Map<String, dynamic> map ){
  this._nim = map['nim'];
  this._nama = map['nama'];
  this._alamat = map['alamat'];
  this._kelamin = map['kelamin'];
}

//konversi dari item ke map
Map<String, dynamic> toMap () {
  Map<String, dynamic> map = Map<String, dynamic>();
  map['nim'] = this._nim;
  map['nama'] = nama;
  map['alamat'] = alamat;
  map['kelamin'] = kelamin;
  return map;
}

}