import 'package:flutter/material.dart';

class MyBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyBodyState();
}

class MyBodyState extends State<MyBody> {
  List<String> _array = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, i) {
      print('num $i : нечетное = ${i.isOdd}');

      if (i.isOdd) return new Divider();
      final int index = i ~/ 2;

      if (index >= _array.length) {
        print('index $index');
        print('length ${_array.length}');
        _array.addAll(['${index + 1}', '${index + 2}', '${index + 3}']);
      }

      return new ListTile(title: new Text(_array[index]),);
    });
  }
}

void main() => runApp(
  new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Scaffold(
        body: MyBody()
      )
    )
  );
