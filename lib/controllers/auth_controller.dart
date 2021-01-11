import 'package:flutter/foundation.dart';

import '../models/models.dart';
import '../services/services.dart';
import '../providers/providers.dart';

class AuthController with ChangeNotifier {
  final UserProvider userProvider = UserProvider();

  User user;

  Future<User> signin(String username) async {
    try {
      user = await userProvider.signin(username);
    } on HttpError catch (error) {
      print(error.description);
    }
    notifyListeners();
  }
}
