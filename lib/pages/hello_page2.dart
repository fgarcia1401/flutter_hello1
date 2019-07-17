

import 'package:flutter/material.dart';

import 'widgets/blue_button.dart';

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
        child: BlueButton("Voltar", onPressed: () => onClickVoltar(context))
    );
  }

  onClickVoltar(context) {
    Navigator.pop(context, "Tela 2");
  }


}
