import 'package:flutter_test/flutter_test.dart';
import 'package:metropol_mawanda_peter/models/credit_score.dart';

void main() {
  group('CreditScore parsing tests', () {
    test('should parse valid credit score JSON', () {
      final json = {
        'score': 750,
        'status': 'EXCELLENT',
        'history': [
          {'date': '2024-01-01', 'score': 740},
          {'date': '2024-02-01', 'score': 750},
        ],
      };

      final creditScore = CreditScore.fromJson(json);
      expect(creditScore.score, equals(750));
      expect(creditScore.status, equals('EXCELLENT'));
      expect(creditScore.history.length, equals(2));
      expect(creditScore.history.first.score, equals(740));
    });

    test('should handle null values gracefully', () {
      final json = {
        'score': null,
        'status': null,
        'history': null,
      };

      final creditScore = CreditScore.fromJson(json);
      expect(creditScore.score, equals(0));
      expect(creditScore.status, isNull);
      expect(creditScore.history, isEmpty);
    });
  });
}
