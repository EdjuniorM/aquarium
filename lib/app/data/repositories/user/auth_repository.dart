import 'package:aquarium/app/interactor/user/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aquarium/app/interactor/user/models/update_user_model.dart';
import 'package:aquarium/app/interactor/user/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:routefly/routefly.dart';

import '../../../../routes.dart';
import '../../../interactor/user/atoms/auth_atoms.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return false;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        authState.value = true;
        Routefly.navigate(routePaths.updateUser);
        return true;
      }

      authState.value = true;
      Routefly.navigate(routePaths.home);
      return true;
    } catch (e) {
      throw Exception("Erro ao atualizar usuário");
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    authState.value = false;
    userState.value = null;
    Routefly.navigate(routePaths.login);
  }

   @override
  Future<void> createDataUser(UpdateUserModel user) async {
    try {

      final userAuth = _firebaseAuth.currentUser;
      await _firebaseFirestore
          .collection('users')
          .doc(userAuth?.uid)
          .set(user.toMap());
        Routefly.navigate(routePaths.home);
    } catch (e) {
      throw Exception("Erro ao atualizar usuário");
    }
  }

@override
Future<UserModel> getDataUser() async {
  final userAuth = _firebaseAuth.currentUser;
  if (userAuth == null) {
    Routefly.navigate(routePaths.login);
    throw Exception("Usuário não está logado.");
  }

  final docSnapshot = await _firebaseFirestore
      .collection('users')
      .doc(userAuth.uid)
      .get();

  if (!docSnapshot.exists) {
    throw Exception("Dados do usuário não encontrados.");
  }

  final user = UserModel.fromMap(docSnapshot.data()!);
  userState.value = user;
  return user;
}
}
