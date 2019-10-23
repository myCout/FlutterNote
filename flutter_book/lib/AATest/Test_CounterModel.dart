import 'package:flutter_book/public.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;
  int get counter => _count;

  void increment() {
    _count++;
    // ToDo 通知听众刷新
    notifyListeners();
  }

}