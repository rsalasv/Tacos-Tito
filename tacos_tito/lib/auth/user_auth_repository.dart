import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class UserAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //get user => _auth.currentUser;

  bool isAlreadyLogged() {
    var user = _auth.currentUser;
    print("User: ${user?.displayName}");
    return user != null;
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
  }

  Future<void> signOutFirebase() async {
    await _auth.signOut();
  }

  //anonimo
  //Future<void> anonymousSignIn() async {
  //  final anonymousUser = (await _auth.signInAnonymously()).user;
  //  await anonymousUser!.updateDisplayName(
  //    "${anonymousUser.uid.substring(0, 5)}_invitado",
  //  );
  //  await anonymousUser.reload();
  //}

  //Usuario y contraseña
  Future signUpWithMail({String? email, String? password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      print("Can't login");
      return e.message;
    }
  }

  Future signInWithMail({String ?email, String ?password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email!, password: password!);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOutWithMail() async {
    await _auth.signOut();

    print('signout');
  }

  Future<void> signInWithGoogle() async {
    // Google sign in
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;

    print("User: ${googleUser.displayName}");
    print("User: ${googleUser.email}");
    print("User: ${googleUser.photoUrl}");

    // credenciales para firebase
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // firebase sign in

    final authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user!;
    final firebaseToken = await user.getIdToken();
    assert(!user.isAnonymous);
    assert(firebaseToken != null);
    final User currentUser = _auth.currentUser!;
    assert(user.uid == currentUser.uid);

    print("Firebase Token:  $firebaseToken");
  }
}
