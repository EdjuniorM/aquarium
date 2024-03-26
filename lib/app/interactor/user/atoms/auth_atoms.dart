import 'package:aquarium/app/interactor/user/models/user_model.dart';
import 'package:asp/asp.dart';

final authState = Atom<bool>(false);
final userState = Atom<UserModel?>(null);