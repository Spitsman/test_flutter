import 'package:flutter/material.dart';

enum GenderList {male, female}

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  GenderList _gender;
  bool _argreement = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: new Column(
          children: <Widget>[
            new Text('Name:', style: TextStyle(fontSize: 20.0),),
            new TextFormField(
              validator: (value) {
                if (value.isEmpty) return 'Fill name';
              }),
            new SizedBox(height: 20.0,),

            new Text('Email:', style: TextStyle(fontSize: 20.0),),
            new TextFormField(
                validator: (value) {
                  if (value.isEmpty) return 'Fill email';
                }),
            new SizedBox(height: 20.0,),


            new Text('Gender', style: TextStyle(fontSize: 20.0)),
            new RadioListTile(title: Text('Male'), value: GenderList.male, groupValue: _gender, onChanged: (GenderList value){
              setState(() {
                _gender = value;
              });
            }),
            new RadioListTile(title: Text('Female'), value: GenderList.female, groupValue: _gender, onChanged: (GenderList value){
              setState(() {
                _gender = value;
              });
            }),
            new SizedBox(height: 20.0,),

            new CheckboxListTile(value: _argreement, title: new Text('Agreement'), onChanged: (bool value) => setState(() => _argreement = value)),
            new SizedBox(height: 20.0,),

            new RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Color color = Colors.red;
                  String text;

                  if (_gender == null) {
                    text = 'Select gender';
                  } else if (_argreement == false) {
                    text = 'Need agreement';
                  } else {
                    text = 'Form successfully filled';
                    color = Colors.green;
                  }
                  Scaffold.of(context).showSnackBar(new SnackBar(content: Text(text), backgroundColor: color,));
                }
              },
              child: Text('Submit'),
              color: Colors.blue,
              textColor: Colors.white,
            )
          ],
        ),),
    );
  }
}

void main() => runApp(
  new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Scaffold(
      appBar: new AppBar(title: new Text('Biba')),
      body: MyForm()
      )
    )
  );
