import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Register(),
    ));

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: MyCustomForm(),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  //variables
  List _campus = ["Campus 1", "Campus 2", "Campus 3", "Campus 4"];

  late List<DropdownMenuItem<String>> _dropDownMenuItems;
  late String _selectedCampus;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_campus);
    _selectedCampus = _dropDownMenuItems[0].value!;
    super.initState();
  }

  //function
  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List campus) {
    List<DropdownMenuItem<String>> items = [];
    for (String Campus in campus) {
      items.add(new DropdownMenuItem(value: Campus, child: new Text(Campus)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your full name',
              labelText: 'Name',
            ),
//            validator: (value) {
//              if (value.) {
//                return 'Please enter some text';
//              }
//              return null;
//            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.account_balance_outlined),
              hintText: 'Enter a Class',
              labelText: 'Class',
            ),
//            validator: (value) {
//              if (value.isEmpty) {
//                return 'Please enter valid phone number';
//              }
//              return null;
//            },
          ),
          SizedBox(height: 50.0),
          new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Please choose a Campus: "),
                new DropdownButton(
                  value: _selectedCampus,
                  items: _dropDownMenuItems,
                  onChanged: (selectedCampus) {
                    setState(() {
                      _selectedCampus = selectedCampus.toString();
                    });
                  },
                )
              ],
            ),
          ),
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: new RaisedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    // It returns true if the form is valid, otherwise returns false
//                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Data is in processing.')));
                  })),
        ],
      ),
    );
  }
}
