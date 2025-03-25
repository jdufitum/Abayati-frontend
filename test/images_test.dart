import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:abayati/assets/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.abaya).existsSync(), isTrue);
    expect(File(Images.abaya100).existsSync(), isTrue);
    expect(File(Images.abaya101).existsSync(), isTrue);
    expect(File(Images.abaya105).existsSync(), isTrue);
    expect(File(Images.avatar).existsSync(), isTrue);
    expect(File(Images.frontBody).existsSync(), isTrue);
    expect(File(Images.jalabiya).existsSync(), isTrue);
    expect(File(Images.latest).existsSync(), isTrue);
    expect(File(Images.maestro).existsSync(), isTrue);
    expect(File(Images.paypal).existsSync(), isTrue);
    expect(File(Images.shayla).existsSync(), isTrue);
    expect(File(Images.sideBody).existsSync(), isTrue);
    expect(File(Images.signInApple).existsSync(), isTrue);
    expect(File(Images.storeBg).existsSync(), isTrue);
    expect(File(Images.undercap).existsSync(), isTrue);
    expect(File(Images.visa).existsSync(), isTrue);
  });
}
