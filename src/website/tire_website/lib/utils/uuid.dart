import 'dart:convert';
import 'dart:math';

class Uuid {
  static final Random _random = Random.secure();

  String createCryptoRandomString([int length = 32]) {
    final List<int> values =
        List<int>.generate(length, (int i) => _random.nextInt(256));

    return base64Url.encode(values);
  }
}
