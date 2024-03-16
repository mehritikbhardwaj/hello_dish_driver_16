import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_IN': {
          'languageName': 'English',
          'hello': 'Hello',
        },
        'hi_IN': {
          'languageName': 'हिंदी',
          'hello': 'नमस्ते',
        },
        'guj_IN': {
          'languageName': 'ગુજરાતી',
          'hello': 'નમસ્તે',
        },
      };
}
