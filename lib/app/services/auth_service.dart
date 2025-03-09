import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Rxn<User> firebaseUser = Rxn<User>();
  Rx<Map<String, dynamic>?> userData = Rx<Map<String, dynamic>?>(null);

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, (_) async {
      await Future.delayed(Duration(milliseconds: 500));
      fetchUserData();
    });
  }

  Future<String?> registerUser({
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required String address,
    required String username,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "fullName": fullName,
        "phone": phone,
        "email": email,
        "address": address,
        "username": username,
        "createdAt": FieldValue.serverTimestamp(),
      });

      await fetchUserData();
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> loginUser(String username, String password) async {
    try {
      QuerySnapshot userSnapshot = await _firestore
          .collection("users")
          .where("username", isEqualTo: username)
          .limit(1)
          .get();

      if (userSnapshot.docs.isEmpty) {
        return "Username not found";
      }

      String email = userSnapshot.docs.first["email"];

      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await Future.delayed(Duration(milliseconds: 500));
      await fetchUserData();
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    userData.value = null;
  }

  Future<void> fetchUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot =
          await _firestore.collection("users").doc(user.uid).get();
      if (snapshot.exists && snapshot.data() != null) {
        userData.value = snapshot.data() as Map<String, dynamic>;
      } else {
        userData.value = {};
      }
    } else {
      userData.value = null;
    }
  }
}
