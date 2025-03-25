import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:abayati/assets/resources.dart';

void main() {
  test('vectors assets test', () {
    expect(File(Vectors.add).existsSync(), isTrue);
    expect(File(Vectors.ai).existsSync(), isTrue);
    expect(File(Vectors.apple).existsSync(), isTrue);
    expect(File(Vectors.compass).existsSync(), isTrue);
    expect(File(Vectors.edit).existsSync(), isTrue);
    expect(File(Vectors.eye).existsSync(), isTrue);
    expect(File(Vectors.facebook).existsSync(), isTrue);
    expect(File(Vectors.favFill).existsSync(), isTrue);
    expect(File(Vectors.fav).existsSync(), isTrue);
    expect(File(Vectors.filt).existsSync(), isTrue);
    expect(File(Vectors.filter).existsSync(), isTrue);
    expect(File(Vectors.google).existsSync(), isTrue);
    expect(File(Vectors.home).existsSync(), isTrue);
    expect(File(Vectors.location).existsSync(), isTrue);
    expect(File(Vectors.lock).existsSync(), isTrue);
    expect(File(Vectors.maestro).existsSync(), isTrue);
    expect(File(Vectors.mail).existsSync(), isTrue);
    expect(File(Vectors.measureCheck).existsSync(), isTrue);
    expect(File(Vectors.mic).existsSync(), isTrue);
    expect(File(Vectors.paypal).existsSync(), isTrue);
    expect(File(Vectors.searchAi).existsSync(), isTrue);
    expect(File(Vectors.search).existsSync(), isTrue);
    expect(File(Vectors.settings).existsSync(), isTrue);
    expect(File(Vectors.shoppingCart).existsSync(), isTrue);
    expect(File(Vectors.signApple).existsSync(), isTrue);
    expect(File(Vectors.sort).existsSync(), isTrue);
    expect(File(Vectors.splashBgg).existsSync(), isTrue);
    expect(File(Vectors.splashB1).existsSync(), isTrue);
    expect(File(Vectors.splashB2).existsSync(), isTrue);
    expect(File(Vectors.splashB3).existsSync(), isTrue);
    expect(File(Vectors.splashB4).existsSync(), isTrue);
    expect(File(Vectors.splashBG).existsSync(), isTrue);
    expect(File(Vectors.successCheck).existsSync(), isTrue);
    expect(File(Vectors.traingleRuler).existsSync(), isTrue);
    expect(File(Vectors.user).existsSync(), isTrue);
    expect(File(Vectors.visa).existsSync(), isTrue);
    expect(File(Vectors.wishlist).existsSync(), isTrue);
  });
}
