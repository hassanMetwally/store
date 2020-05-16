import 'package:store/user/user.dart';

class Authenticatable {

  Future<User> register(String email, String password) {}

  Future<bool> logIn(String email, String password) {}

  Future<bool> resetPassword(String email) {}
}
