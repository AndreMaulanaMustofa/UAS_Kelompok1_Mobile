import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BiodataPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Biodata"),
            bottom: const TabBar(
              tabs: [
                Tab(text: "BIODATA"),
                Tab(text: "LIST DATA"),
            ],
          ),
        ),
        body: myBody(),
        ),
      ),
    );
  }
}

class myBody extends StatefulWidget{
  @override
  State<myBody> createState() => _mybody();
}

enum Gender { male, female }

class _mybody extends State<myBody>{

  Gender _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
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
            ),
            margin: EdgeInsets.only(
              left: 100,
              right: 100,
            ),
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(
                label: Text("Alamat :")
              ),
              keyboardType: TextInputType.streetAddress,
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
                        _gender = value;
                      });
                    },
                  ),
                  contentPadding: EdgeInsets.only(left: 150),
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
                        _gender = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: (() {
                  
                }),
                child: Text("Tambah Data"),
                style: ButtonStyle(
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}