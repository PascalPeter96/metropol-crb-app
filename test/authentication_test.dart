import 'package:flutter_test/flutter_test.dart';
import 'package:metropol_mawanda_peter/services/authentication_service.dart';

void main() {
  group('Authentication tests', () {
    final authService = AuthenticationService();

    test('should authenticate with valid credentials', () async {
      final result = await authService.authenticate(
        email: 'man@gmail.com',
        password: 'manman',
      );
      expect(result, isTrue);
    });

    test('should fail with invalid email', () async {
      final result = await authService.authenticate(
        email: 'invalid@example.com',
        password: 'manman',
      );
      expect(result, isFalse);
    });

    test('should fail with invalid password', () async {
      final result = await authService.authenticate(
        email: 'man@gmail.com',
        password: 'wrongpassword',
      );
      expect(result, isFalse);
    });

    test('should handle null credentials', () async {
      final result = await authService.authenticate(
        email: null,
        password: null,
      );
      expect(result, isFalse);
    });
  });
}
