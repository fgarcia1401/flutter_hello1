import 'package:flutter/material.dart';
import 'package:flutter_hello1/pages/hello_page1.dart';
import 'package:flutter_hello1/pages/hello_page2.dart';
import 'package:flutter_hello1/pages/hello_page3.dart';
import 'package:flutter_hello1/pages/util/nav.dart';
import 'package:flutter_hello1/pages/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'hello_listview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello Flutter",
          ),
          centerTitle: true,
        ),
        body: _body(context),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  _onClickFab();
                }),
            SizedBox(
              width: 8,
            ),
            FloatingActionButton(
                child: Icon(Icons.favorite),
                onPressed: () {
                  _onClickFab();
                }),
          ],
        ));
  }

  _body(context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _text(),
              _pageView(),
              _buttons(),
            ],
          ),
        ),
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  _buttons() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton("Page 2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page 3",
                    onPressed: () => _onClickNavigator(context, HelloPage3()))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", onPressed: () => _onClickSnack(context)),
                BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
                BlueButton("Toast", onPressed: _onClickToast)
              ],
            ),
          ],
        );
      },
    );
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.dotted,
      ),
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);

    print(" >> $s");
  }

  _img(String img) {
    return Container(
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Olá Flutter"),
      action: SnackBarAction(
          label: "Ok",
          onPressed: () {
            print("OK");
          }),
    ));
  }

  _onClickDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Flutter é muito legal!"),
            actions: <Widget>[
              FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context);
                    print("OK!!");
                  }),
            ],
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Flutter é muito legal!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _onClickFab() {
    print("Adicionar");
  }
}
