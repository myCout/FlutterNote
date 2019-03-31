import 'package:flutter/material.dart';
import 'shopping_item.dart';
// void main() => runApp(MyApp());
class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(//Material 是UI呈现的一张纸
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text('Example Title',style: Theme.of(context).primaryTextTheme.title),
          ),
          Expanded(
            child: Center(
              child: Text('Hello World'),
            ),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: 'my app',
    // home: MyScaffold(),
    // home: TutorialHome(),
    // home: ShoppingList(
    //   products: <Product>[
    //     new Product(name: 'Eggs'),
    //     new Product(name: 'Flour'),
    //     new Product(name: 'Chocolate chips'),
    //   ],
    // ),
    home: Scaffold(
      appBar: AppBar(title: Text('图片显示'),),
      body: TutorialHome(),
    ),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
            child: Image.asset('static/images/image_1.jpg',height: 900,width: 300,),
          )
          // Image.asset('static/images/image_1.jpg'),
        ],
      ),
    );
      
  }
}

class MyButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('按钮点击了');
      },
      child: Container(
        height: 36,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}