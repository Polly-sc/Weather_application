import 'package:connectivity/connectivity.dart';

Future<bool> checkConnectivity() async {
  // Получить состояние подключения
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    // Проверить наличие подключения
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      return true;
      // Есть подключение к сети
    } else {
      return false;
      // Нет подключения к сети
    }
}