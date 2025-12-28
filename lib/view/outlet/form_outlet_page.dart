import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/repository/outlet_repository.dart';

class FormOutletPage extends StatefulWidget {
  final String idDoc;
  FormOutletPage(this.idDoc, {super.key});

  @override
  State<FormOutletPage> createState() => _FormOutletPageState();
}

class _FormOutletPageState extends State<FormOutletPage> {
  TextEditingController nameField = TextEditingController();

  TextEditingController openField = TextEditingController();

  TextEditingController closeField = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialData();
  }

  void initialData() async {
    if (widget.idDoc != "0") {
      var result = await OutletRepository().detailOutlet(widget.idDoc);
      nameField.text = result['name'];
      openField.text = result['hour_operation']['open'];
      closeField.text = result['hour_operation']['close'];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form New Outlet")),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: nameField,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Name Outlet',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: openField,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Open Outlet',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: closeField,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Close Outlet',
              ),
            ),
          ),
          ElevatedButton(
            onPressed:
                () =>
                    widget.idDoc == "0"
                        ? actionInsert(context)
                        : actionUpdate(context, widget.idDoc),
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }

  void actionInsert(BuildContext context) async {
    Map<String, dynamic> request = {
      'name': nameField.text,
      'position': '',
      'hour_operation': {'open': openField.text},
    };
    await OutletRepository().insertOutlet(request);
    Navigator.pop(context);
  }

  void actionUpdate(BuildContext context, String idDoc) async {
    Map<String, dynamic> request = {
      'name': nameField.text,
      'position': '',
      'hour_operation': {'open': openField.text, 'close': closeField.text},
    };
    await OutletRepository().updateOutlet(idDoc, request);
    Navigator.pop(context);
  }
}
