import 'package:firebase_auth/firebase_auth.dart';

class FireHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;
  get user => auth.currentUser;
  Future<String?> signup({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return null; // Success
    } on FirebaseAuthException catch (e) {
      // Specific error handling for email already in use
      if (e.code == 'email-already-in-use') {
        return "User already exists with this email";
      }
      return e.message; // Return any other error messages
    } catch (e) {
      // General error handling (unexpected errors)
      return e.toString();
    }
  }



  Future<String?> signIn({required String mail, required String pass}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: pass);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      }else if(e.code == 'wrong password'){
        print('wrong password');
      }
      return e.message;
    }
  }
}
