import 'package:flutter/material.dart';
import 'Second.dart';
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('FirstPage',style: TextStyle(fontSize: 36.0)),
        elevation: 0.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color:Colors.white,
            size: 64.0,
          ),
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context){
                  return SecondPage();
                }
              )
            );
          },
        ),
        
      ),
    );
  }
}