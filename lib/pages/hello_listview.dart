

import 'package:flutter/material.dart';
import 'package:flutter_hello1/pages/dog_page.dart';
import 'package:flutter_hello1/pages/util/nav.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);

}

class HelloListView extends StatefulWidget {

  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed:() {
            setState(() {
              gridView = false;
            });
            print("Lista");
          },
          ),
          IconButton(icon: Icon(Icons.grid_on), onPressed:() {
            setState(() {
              gridView = true;
            });
            print("Grid");
          },
          ),
        ],
        title: Text("ListView"),
      ),
      body: _body(),
    );
  }

  _body() {

    List<Dog> dogs = [
      Dog("Jack Russel","assets/images/dog1.png"),
      Dog("Labrador","assets/images/dog2.png"),
      Dog("Pug","assets/images/dog3.png"),
      Dog("Vira Lata","assets/images/dog4.png"),
      Dog("Pastor","assets/images/dog5.png"),

    ];

    if (gridView) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    } else {
      return ListView.builder(
        itemExtent: 350,
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    }


  }

 _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];
    return GestureDetector(
      onTap: () {
        push(context, DogPage(dog));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(dog.foto),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius:  BorderRadius.circular(16)
              ),
              child: Text(
                dog.nome, style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _img(String img) {
    return  Image.asset(
        img,
        fit: BoxFit.cover,
    );
  }
}
