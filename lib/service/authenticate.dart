import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bec_movie_app/screens/drawer/drawer_page.dart';
import 'package:flutter_bec_movie_app/screens/homepage/homepage.dart';

import 'package:google_sign_in/google_sign_in.dart';

import '../screens/authentication/sign_in.dart';

class Authentication {
  handleAuthentication() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext ctx, snapshot) {
        if (snapshot.hasData) {
          return const DrawerPage();
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

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
}
