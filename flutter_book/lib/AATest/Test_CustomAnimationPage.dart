import 'package:flutter_book/public.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: GestureDetector(
        child: Hero(
            tag: 'hero',
            child: Container(
              width: 100,
              height: 100,
              child: FlutterLogo(),
            )),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Page2()));
        },
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hero'),
        ),
        body: Hero(
            tag: 'hero', //设置共享tag
            child: Container(width: 300, height: 300, child: FlutterLogo())));
  }
}
