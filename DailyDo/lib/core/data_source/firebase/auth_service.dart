import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nti_final_project/features/auth/models/user_model.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🟢 Sign Up
   Future<void> signUp(String email, String password, String name) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(
            UserModel(
              email: email,
              name: name,
            ).toJson(),
          );
    } catch (e) {
      rethrow; 
    }
  }

  // 🔵 Sign In
 Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }


  // 🔴 Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // 🟠 Forget Password
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // 🟣 Sign In With Google
  Future<void> signInWithGoogle() async {
  try {

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();


    if (googleUser == null) return;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );


    final result = await _auth.signInWithCredential(credential);
    User? user = result.user;


    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'name': user.displayName ?? '',
        'email': user.email ?? '',
      }, SetOptions(merge: true));
    }
    


  } catch (e) {
    rethrow; 
  }
}
}
