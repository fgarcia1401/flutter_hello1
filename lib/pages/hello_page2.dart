

import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
        child: RaisedButton(
          color: Colors.blue,
          child: Text(
            "Voltar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
          ),
          onPressed: () => onClickVoltar(context),
        ),
    );
  }

  onClickVoltar(context) {
    Navigator.pop(context, "Tela 2");
  }


}
