import 'package:app_12_01_firebase/firebase/response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

String firebaseUserUid = "";

class FirebaseService
{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<dynamic> loginGoogle() async
  {
    try
    {
      // Login com o Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      print("Google User: ${googleUser.email}");

      // Credenciais para o Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Login no Firebase
      UserCredential result = await _auth.signInWithCredential(credential);
      final User? fUser = result.user;
      print("Firebase Nome: ${fUser!.displayName}");
      print("Firebase Email: ${fUser.email}");
      print("Firebase Foto: ${fUser.photoURL}");

      // Resposta genérica
      return Response.ok();
    }
    catch (error) {
      print("Firebase error $error");
      return Response.error(msg: "Não foi possível fazer o login");
    }
  }


}
