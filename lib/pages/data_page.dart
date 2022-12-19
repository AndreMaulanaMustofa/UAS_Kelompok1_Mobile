import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DataPage> {
  var lists = List<String>.generate(11, (index) => "List : $index");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List data mahasiswa'),
      ),
      body: ListView.builder(
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(lists[index]),
            trailing: Container(
              width: 60,
              child: TextButton(
                child: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
                onPressed: () {
                  showSnackBar(context, index);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void showSnackBar(BuildContext context, int index) {
    var deletedRecord = lists[index];
    setState(() {
      lists.removeAt(index);
    });
    SnackBar snackBar = SnackBar(
      content: Text('Deleted $deletedRecord'),
      action: SnackBarAction(
        label: "UNDO",
        onPressed: () {
          setState(() {
            lists.insert(index, deletedRecord);
          });
        },
      ),
    );
  }
}
