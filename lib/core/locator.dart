import 'dart:io';
import 'package:get_it/get_it.dart';
import 'navigation/navigation_service.dart';

GetIt locator = GetIt.instance;

setupLocator() async {
  locator.registerSingleton(HttpClient());
  locator.registerSingleton(NavigationService());

  /*locator
      .registerSingleton(EncText(aesKey: "hh1jukQY77MKtaVWgo6S7J4tXG8qsWQ9"));
  locator.registerSingletonAsync<AppDB>(() => AppDB.getInstance());
  locator.registerSingleton<LoginStore>(LoginStore());
  locator.registerSingleton<HomeStore>(HomeStore());

  locator.registerLazySingleton<UserAuthService>(() => UserAuthService());
  locator.registerLazySingleton<UserAuthRepository>(() => UserAuthRepository());
*/}
