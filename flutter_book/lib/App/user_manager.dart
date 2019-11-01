import 'package:flutter_book/public.dart';

class UserManager {
  Future<bool> checkUserLoginStatus() async {
    String token = await getUserToken();
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  saveUserToken(String token) {
    Utils.sharedAddAndUpdate(AppStrings.STRING_TOKEN, String, token);
  }

  saveUserId(int Id) {
    Utils.sharedAddAndUpdate(AppStrings.STRING_USER_ID, int, Id);
  }

  getUserId() {
    var userId = Utils.sharedGetData(AppStrings.STRING_USER_ID);
    return userId;
  }

  Future<String> getUserToken() async {
    var token = await Utils.sharedGetData(AppStrings.STRING_TOKEN);
    return token;
  }
}
