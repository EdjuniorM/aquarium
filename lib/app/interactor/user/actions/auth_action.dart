

import 'package:aquarium/app/interactor/user/models/update_user_model.dart';
import 'package:aquarium/app/interactor/user/models/user_model.dart';
import 'package:aquarium/app/interactor/user/repositories/auth_repository.dart';

import '../../../injector.dart';

Future<void> createUser() async {
  final repository = injector.get<AuthRepository>();
  await repository.signInWithGoogle();
}

Future<void> createDataUser(UpdateUserModel user) async {
  final repository = injector.get<AuthRepository>();
  await repository.createDataUser(user);
}

Future<UserModel> getDataUser() async {
  final repository = injector.get<AuthRepository>();
  return await repository.getDataUser();
}

Future<void> signOut() async {
  final repository = injector.get<AuthRepository>();
  await repository.signOut();
}