import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_curriculo_flutter/app.dart';

void main() {
  test('portfolio app can be instantiated', () {
    expect(const PortfolioApp(), isA<Widget>());
  });
}
