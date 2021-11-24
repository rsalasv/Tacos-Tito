import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UserAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  late bool isAdmin=false;
  //get user => _auth.currentUser;

  bool isAlreadyLogged() {
    print("User: ${this.user?.displayName}");
    return this.user != null;
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
      await _auth.signInWithEmailAndPassword(email: email!, password: password!).then((email) => validateAdmin(email.user!.email));
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

  Future validateAdmin(String? user) async{
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child('/authusers.txt');
    Uint8List? downloaded =  await ref.getData();
    List<String> admins = utf8.decode(downloaded!).split("\r\n");
    for(int i=0;i<admins.length;i++){
      print(admins[i]);
      if(admins[i].compareTo(user!)==0){
        isAdmin = true;
        print("SOY ADMIN!");
        return;
      }
    }
    print("valió cabeza");
  }
}
