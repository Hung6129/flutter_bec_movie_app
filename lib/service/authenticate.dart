import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

import '../main_screens.dart';
import '../screens/authentication/sign_in.dart';
import '../screens/homepage/homepage.dart';

class Authentication {
  handleAuthentication() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext ctx, snapshot) {
        if (snapshot.hasData) {
          return const MainScreens();
        } else {
          return const SignInPage();
        }
      },
    );
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? ggUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication ggAuth = await ggUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: ggAuth.accessToken,
      idToken: ggAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
