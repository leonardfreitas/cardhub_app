import '../models/models.dart';
import '../services/services.dart';

class UserProvider {
  HttpClientService api = HttpClientService();

  Future<User> signin(String username) async {
    Map<String, dynamic> response =
        await api.request(url: 'users/$username', method: 'get');
    return User.fromJson(response);
  }
}
