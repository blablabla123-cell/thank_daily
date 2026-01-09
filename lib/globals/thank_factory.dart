import 'package:flutter/foundation.dart';
import 'package:thank_daily/entities/thank.dart';

enum ThankType { self, others, god, thing }

@immutable
class ThankFactory {
  const ThankFactory._();

  static Thank thank(ThankType type, String message, {String name = ''}) {
    Thank result = ThankYourself(message, name);

    switch (type) {
      case ThankType.self:
        {
          result = ThankYourself(message, name);
        }
        break;

      case ThankType.others:
        {
          result = ThankOthers(message, name);
        }
        break;

      case ThankType.god:
        {
          result = ThankGod(message);
        }
        break;

      case ThankType.thing:
        {
          result = ThankThing(message, name);
        }
        break;
    }

    return result;
  }
}
