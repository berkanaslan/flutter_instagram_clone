import 'package:flutter_instagram_clone/repositories/person_repository.dart';
import 'package:flutter_instagram_clone/services/auth/firebase_auth_service.dart';
import 'package:flutter_instagram_clone/services/db/firestore_db_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FirestoreDBService());
  locator.registerLazySingleton(() => PersonRepository());
}
