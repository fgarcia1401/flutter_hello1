import 'package:flutter/material.dart';

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
    );
  }

  _body(context) {
    return Container(
      color: Colors.white,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _text(),
                _img(),
                _buttons()
              ],
            )
        )
    );
  }

  _buttons() {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _button("ListView"),
          _button("Page 2"),
          _button("Page 3")
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _button("Snack"),
          _button("Dialog"),
          _button("Toast")
        ],
      ),
    ],
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

  _button(String texto) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        texto,
        style:
        TextStyle(
            color: Colors.white,
            fontSize: 20,
        ),
      ),
      onPressed: _onClickOk
    );
  }

  void _onClickOk() {
    print("Clicou no botão!");
  }


  _img() {
    return Image.asset(
      "assets/images/dog1.png",
      fit: BoxFit.cover,
    );
  }
}
