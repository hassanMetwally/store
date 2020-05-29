import 'package:store/authentication/authenticatable.dart';
import 'package:store/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationController implements Authenticatable {
  FirebaseAuth _firebaseAuth =FirebaseAuth.instance;

  @override
  Future<FirebaseUser> register(String email, String password) async{
    AuthResult authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return authResult.user;
  }

  @override
  Future<FirebaseUser>  signIn(String email, String password) async{
    AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return authResult.user;
  }
  @override
  Future<FirebaseUser> getCurrentUser() async{
    FirebaseUser currentUser = await _firebaseAuth.currentUser();
    return currentUser;
  }

  @override
  Future<bool> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> updateProfile(User user) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  signOut() async{
   await _firebaseAuth.signOut();
  }




}

class LaravelAuthenticationController implements Authenticatable {
  @override
  Future<bool> signIn(String email, String password) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<User> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<bool> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<User> updateProfile(User user) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}

