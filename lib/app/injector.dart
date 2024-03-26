import 'package:aquarium/app/data/repositories/user/auth_repository.dart';
import 'package:aquarium/app/interactor/user/repositories/auth_repository.dart';
import 'package:auto_injector/auto_injector.dart';

final injector = AutoInjector();

void registerInstances() {
  injector.add<AuthRepository>(FirebaseAuthRepository.new);
}