import 'package:flutter_book/public.dart';

class CustomNotification extends Notification {
  final String msg;

  CustomNotification(this.msg);
}

//抽离出一个子widget用来发通知
class CustomChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => CustomNotification('Hello').dispatch(context),
      child: Text('Fire Notification'),
    );
  }
}
