import 'package:thank_daily/globals/thank_factory.dart';

abstract class Thank {
  String title = 'Title';
  String description = 'Description';
  String message = '';
  DateTime date = DateTime.now();
  ThankType type = ThankType.self;

}

class ThankYourself extends Thank {
  late String name;

  ThankYourself(String message, this.name) {
    this.message = message;
    title = 'Thank Yourself';
    description = 'Take a moment to appreciate yourself and your efforts.';
    type = ThankType.self;
    date = date;
  }
}

class ThankOthers extends Thank {
  late String name;

  ThankOthers(String message, this.name) {
    this.message = message;
    title = 'Thank Others';
    description = 'Express your gratitude to someone who has helped you.';
    type = ThankType.others;
    date = date;
  }
}

class ThankGod extends Thank {
  ThankGod(String message) {
    this.message = message;
    title = 'Thank God';
    description = 'Reflect on the blessings in your life and give thanks.';
    type = ThankType.god;
    date = date;
  }
}

class ThankThing extends Thank {
  String name;

  ThankThing(String message, this.name) {
    this.message = message;
    title = 'Thank a Thing';
    description = 'Appreciate an object or item that brings you joy.';
    type = ThankType.thing;
    date = date;
  }
}
