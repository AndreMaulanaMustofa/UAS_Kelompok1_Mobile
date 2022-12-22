import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uas_kelompok1_mobile/models/item.dart';

class BiodataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Biodata"),
          ),
          body: myBody(),
        ),
      ),
    );
  }
}

class myBody extends StatefulWidget {
  @override
  State<myBody> createState() => _mybody();
}

enum Gender { male, female }

class _mybody extends State<myBody> {
  Gender _gender = Gender.male;

  Item item;

  TextEditingController nimController     = TextEditingController();
  TextEditingController namaController    = TextEditingController();
  TextEditingController alamatController  = TextEditingController();
  TextEditingController kelaminController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (item != null){
      nimController.text = item.nim.toString();
      namaController.text = item.nama;
      alamatController.text = item.alamat;
      kelaminController.text = item.kelamin;
    }

    return MaterialApp(
      home: Column(
        children: [
          Container(
            child: Text(
              "Add Biodata",
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
              decoration: InputDecoration(
                label: Text("NIM :"),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: nimController,
            ),
            margin: EdgeInsets.only(
              left: 100,
              right: 100,
            ),
          ),
          Container(
            child: TextField(
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
                child: ListTile(
                  title: const Text("Male"),
                  leading: Radio<Gender>(
                    value: Gender.male,
                    groupValue: _gender,
                    onChanged: (Gender value) {
                      setState(() {
                        _gender = kelaminController.text as Gender;
                        _gender = value;
                      });
                    },
                  ),
                  contentPadding: EdgeInsets.only(left: 150, top: 20, bottom: 20),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Female"),
                  leading: Radio<Gender>(
                    value: Gender.female,
                    groupValue: _gender,
                    onChanged: (Gender value) {
                      setState(() {
                        _gender = kelaminController.text as Gender;
                        _gender = value;
                      });
                    },
                  ),
                  contentPadding: EdgeInsets.only(left: 50, top: 20, bottom: 20),
                ),
              ),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
<<<<<<< HEAD
                onPressed: (() { 
=======
                onPressed: (() {
<<<<<<< HEAD
                  // if (Item == null){
                  //   Item = Item(NIM, nama, alamat, kelamin)
                  // }
=======
                  if (Item == null){
>>>>>>> 2a2dee3217d6e36e6f523e16bfc0a26c5b99aa38
                    item = Item(
                      nimController.toString(), 
                      namaController.text, 
                      alamatController.text, 
                      kelaminController.text);
<<<<<<< HEAD
                  
=======
                  }
>>>>>>> 983ff693e03e7ccf48dabd3cb32d3634df1cd6d3
>>>>>>> 2a2dee3217d6e36e6f523e16bfc0a26c5b99aa38
                }),
                child: Text("Tambah Data"),
                style: ButtonStyle(
                  
              ),
          ),
        ],
      )
    );
  }
}
