class Item{
  String _nim;
  String _name;
  String _alamat;

String get nim => this._nim;
set nim (String value) => this._nim = value;

String get name => this._name;
set name(String value) => this._name = value;

get alamat => this._alamat;
set alamat (value) => this._alamat = value;


Item(this._nim, this._name, this._alamat);

}