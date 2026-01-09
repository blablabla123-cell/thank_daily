import 'package:flutter/foundation.dart';

// Product: Immutable user representation
@immutable
class User {
  final String name;
  final String? otherName; // Optional for AppUser

  const User({required this.name, this.otherName});

  User copyWith({
    String? name,
    String? otherName,
  }) {
    return User(
      name: name ?? this.name,
      otherName: otherName ?? this.otherName,
    );
  }

  @override
  String toString() => 'User(name: $name, otherName: $otherName)';
}

// Abstract Builder: Defines construction steps
abstract class UserBuilder {
  @protected
  late User _user;

  // Step 1: Initialize base product
  @protected
  void createUser() {
    _user = const User(name: '');
  }

  // Abstract steps
  void buildName(String name);
  void buildThankOther(String? otherName);

  // Get final product
  User getUser() => _user;
}

// Concrete Builder: AppUser (name only)
class AppUserBuilder extends UserBuilder {
  @override
  void buildName(String name) {
    _user = User(name: name);
  }

  @override
  void buildThankOther(String? name) {
    // No-op for AppUser
  }
}

// Concrete Builder: ThankUser (name + ID)
class ThankUserBuilder extends UserBuilder {
  @override
  void buildName(String name) {
    _user = User(name: name);
  }

  @override
  void buildThankOther(String? otherName) {
    _user = _user.copyWith(otherName: otherName);
  }
}

@immutable
class UserDirector {
  late final UserBuilder _builder;

  void setBuilder(UserBuilder builder) {
    _builder = builder;
  }

  User createUser(String name, {String? otherName}) {
    _builder.createUser();
    _builder.buildName(name);

    switch (_builder) {
      case AppUserBuilder():
        break;
      case ThankUserBuilder():
        _builder.buildThankOther(otherName);
        break;
    }
    return _builder.getUser();
  }
}
