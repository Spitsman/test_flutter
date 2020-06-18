import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';


class NewsBoxFavorite extends StatefulWidget {
 final int _num;
 final bool _like;

 NewsBoxFavorite(this._num, this._like);

  @override
  createState() => new NewsBoxFavoriteState(_num, _like);
}

class NewsBoxFavoriteState extends State<NewsBoxFavorite> {
  int num;
  bool like = false;

  NewsBoxFavoriteState(this.num, this.like);

  void pressButton() {
    setState(() {
      like = !like;

      like ? num++ : num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new Text('В избранном\n$num', textAlign: TextAlign.center),
      new IconButton(
        icon: new Icon(like ? Icons.star : Icons.star_border, size: 30.0, color: Colors.blue[500]),
        onPressed: pressButton
      )
    ],);
  }
}

class NewsBox extends StatelessWidget {
  final String _title;
  final String _text;
  String _imageurl;
  int _num;
  bool _like;

  NewsBox(this._title, this._text, {String imageurl, int num = 0, bool like = false}) {
    _imageurl = imageurl;
    _num = num;
    _like = like;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: 100.0,
      child: new Row(children: <Widget>[
        new Image.network(_imageurl, width: 100.0, height: 100.0, fit: BoxFit.cover),
        new Expanded(child:
          new Container(
            padding: EdgeInsets.all(5.0),
            child: new Column(
              children: <Widget>[
                new Text(_title, style: new TextStyle(fontSize: 20.0)),
                new Text(_text, softWrap: true, textAlign: TextAlign.justify,)
              ],
            )
          )
        ),
        new NewsBoxFavorite(_num, _like)
      ],)
    );
  }
}

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Biba')),
        body: new NewsBox(
          'Lorem Ipsum',
          'Quia officia rerum. Quasi ducimus et. Repellat cum autem.',
          imageurl: 'https://297228.selcdn.ru/backend/uploads/profile/avatar/580/%D1%88%D0%B0%D1%83%D1%80%D0%BC%D0%B0.webp',
          like: true,
          num: 101
        )
      )
    )
  );
}



// Stateless

class MyBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Center(
        child: new Column(
          children: <Widget>[
            new Text('hello'),
            new FlatButton(
              onPressed: () async {
                const url = 'https://google.com';

                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Error $url';
                }
              },
              child: new Text('qwert'),
              color: Colors.amber,
              textColor: Colors.white,
            )
          ],
        )
    );
  }
}