import 'package:flutter/foundation.dart';

customLog(String value) {
  if (kDebugMode) {
    debugPrint(value);
  }
}
