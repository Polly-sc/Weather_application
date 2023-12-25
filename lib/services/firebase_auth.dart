import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//
// // Генерирует случайную строку соли
// String generateSalt() {
//   var rng = Random.secure();
//   var bytes = List<int>.generate(32, (_) => rng.nextInt(256));
//   return base64.encode(bytes);
// }
//
// // Хеширует пароль с помощью SHA-256 и соли
// String hashPassword(String password, String salt) {
//   var bytes = utf8.encode(password + salt);
//   var digest = sha256.convert(bytes).bytes;
//   return base64.encode(digest);
// }
//
// // Проверяет, совпадает ли введенный пароль с сохраненным
//   bool verifyPassword(String enteredPassword, String storedHash, String storedSalt) {
//     var calculatedHash = hashPassword(enteredPassword, storedSalt);
//     return calculatedHash == storedHash;
//   }
//
//   // Хеширует пароль пользователя
//   Future<void> hashPassword(User user) async {
//     // Генерируем случайную соль
//     String salt = generateSalt();
//
//     // Хешируем пароль
//     String hashedPassword = hashPassword(user.email, salt);
//
//     // Сохраняем хеш и соль в Firestore
//     await FirebaseAuth.instance
//         .collection("users")
//         .doc(user.uid)
//         .set({"password": hashedPassword, "salt": salt});
//   }
//
//   // Проверяет пароль пользователя
//   Future<bool> verifyPassword(User user, String enteredPassword) async {
//     // Получаем хеш и соль из Firestore
//     DocumentSnapshot<Map<String, dynamic>> userDoc =
//     await FirebaseAuth.instance.collection("users").doc(user.uid).get();
//     String storedHash = userDoc.data()!["password"];
//     String storedSalt = userDoc.data()!["salt"];
//
//     // Проверяем пароль
//     return verifyPassword(enteredPassword, storedHash, storedSalt);
//   }
// }