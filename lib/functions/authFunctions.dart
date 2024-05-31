import 'package:firebase_auth/firebase_auth.dart';

bool isLoginned = false;
String loginMessage = "";

// signup(String email, String password) async {
//   try {
//     UserCredential credential = await FirebaseAuth.instance
//         .createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     print('-----------Success Registration-------------');
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'weak-password') {
//       print('The password provided is too weak.');
//     } else if (e.code == 'email-already-in-use') {
//       print('The account already exists for that email.');
//     }
//   } catch (e) {
//     print(e);
//   }
// }

// signin(String email, password) async {
//   try {
//     UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password
//     );
//     print('-----------Success Login-------------');
//     isLoginned = true;
//   }
//   on FirebaseAuthException catch (e) {
//     if (e.code == 'user-not-found') {
//       print('No user found for that email.');
//       loginMessage = 'Akun tidak ada!.';
//     } else if (e.code == 'wrong-password') {
//       print('Wrong password provided for that user.');
//       loginMessage = 'Password Salah!.';
//     }
//   }
// }