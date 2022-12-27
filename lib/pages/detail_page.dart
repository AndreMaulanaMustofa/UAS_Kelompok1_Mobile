import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uas_kelompok1_mobile/DbHelper.dart';
import 'package:uas_kelompok1_mobile/models/item.dart';
import 'package:uas_kelompok1_mobile/pages/data_page.dart';

class DetailPage extends StatefulWidget {
  final String appBarTitle = "Detail page";
  final Item item;

  DetailPage(this.item);

  @override
  State<StatefulWidget> createState() {
    return DetailPageState(this.item);
  }
}

enum Gender { male, female }

final nimController = TextEditingController();
final namaController = TextEditingController();
final alamatController = TextEditingController();

class DetailPageState extends State<DetailPage> {
  Item item;

  Gender _gender = Gender.male;

  DbHelper dbHelper;
  DetailPageState(this.item);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text(
              "Edit Biodata",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20),
          ),
          Container(
            child: TextField(
              onChanged: (value) {
                debugPrint('Something changed in Description Text Field');
                updateNim();
              },
              controller: nimController,
              decoration: InputDecoration(
                label: Text("NIM : "),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            margin: EdgeInsets.only(
              left: 100,
              right: 100,
            ),
          ),
          Container(
            child: TextField(
              onChanged: (value) {
                debugPrint('Something changed in Description Text Field');
                updateName();
              },
              decoration: InputDecoration(
                label: Text("Nama :"),
              ),
              keyboardType: TextInputType.name,
              controller: namaController,
            ),
            margin: EdgeInsets.only(
              left: 100,
              right: 100,
            ),
          ),
          Container(
            child: TextField(
              onChanged: (value) {
                debugPrint('Something changed in Title Text Field');
                updateAlamat();
              },
              decoration: InputDecoration(label: Text("Alamat :")),
              keyboardType: TextInputType.streetAddress,
              controller: alamatController,
            ),
            margin: EdgeInsets.only(
              left: 100,
              right: 100,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RadioListTile(
                  title: const Text("Male"),
                  value: Gender.male,
                  groupValue: _gender,
                  onChanged: (Gender value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  contentPadding:
                      EdgeInsets.only(left: 10, top: 20, bottom: 20),
                ),
              ),
              Expanded(
                child: RadioListTile(
                  title: const Text("Female"),
                  value: Gender.female,
                  groupValue: _gender,
                  onChanged: (Gender value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  contentPadding: EdgeInsets.only(top: 20, bottom: 20),
                ),
              ),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  var gender = _gender.toString();

                  if (gender == "Gender.male") {
                    gender = "male";
                  } else {
                    gender = "female";
                  }

                  item = Item(int.parse(nimController.text),
                      namaController.text, alamatController.text, gender);
                  if (item != null) {
                    print('goto here');
                    await editItem(item);
                    if (!mounted) return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DataPage(),
                      ),
                    );
                  }
                },
                child: ElevatedButton(
                  child: Text(
                    'Save',
                    textScaleFactor: 1.5,
                  ),
                  onPressed: () {
                    setState(() {
                      debugPrint("Save button clicked");
                      _save();
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> editItem(Item item) async {
    print('goto here2');
    int result = await DbHelper.update(item);
    if (!mounted) return;
    if (result > 0) {
      showAlertDialog(context);
    }
  }

  // Update the description of Note object
  void updateName() {
    item.nama = namaController.text;
  }

  // Save data to database
  void _save() async {
    int result;
    if (item.nim != null) {
      // Case 1: Update operation
      result = await DbHelper.update(item);
    } else {
      // Case 2: Insert Operation
      // result = await helper.insertNote(note);
    }
  }

  void updateNim() {
    int number = item.nim;
    String number2 = number.toString();
    number2 = nimController.text;
  }

  void updateAlamat() {
    item.alamat = alamatController.text;
  }
}

showAlertDialog(BuildContext context) {
  Item item;
  Widget okButton = MaterialButton(
    child: Text("OK"),
    onPressed: () {},
  );

  AlertDialog alert = AlertDialog(
    title: Text("Success"),
    content: Text("Data Telah di Update"),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
