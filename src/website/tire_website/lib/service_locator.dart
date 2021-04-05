import 'package:get_it/get_it.dart';
import 'package:tire_website/business_logic/auth/repo/authentication_repo.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void setup() {
    getIt.registerLazySingleton<AuthenticationRepo>(() => AuthenticationRepo());
  }
}
