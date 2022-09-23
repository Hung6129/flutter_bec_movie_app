// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoriteData {
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addFavoriteMovie(Map<String, dynamic> data) async {
    users.doc(currentUserId).collection("favorites-movie").add(data);
  }

  Future<void> addFavoriteTVShow(Map<String, dynamic> data) async {
    users.doc(currentUserId).collection("favorites-tvshows").add(data);
  }
}
