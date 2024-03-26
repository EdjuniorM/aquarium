import 'package:aquarium/app/interactor/user/models/update_user_model.dart';
import 'package:aquarium/app/interactor/user/models/user_model.dart';

abstract class AuthRepository {
  Future<bool> signInWithGoogle();
  Future<void> createDataUser(UpdateUserModel user);
  Future<UserModel> getDataUser();
}