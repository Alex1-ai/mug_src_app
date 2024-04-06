import 'package:flutter_test/flutter_test.dart';
import 'package:mug_app/models/position_model.dart';

void main() {
  group('Position', () {
    test('fromJson() constructs correct Position', () {
      final Map<String, dynamic> jsonData = {
        'id': 1,
        'name': 'Manager',
        'description': 'Responsible for managing operations.',
      };

      final position = Position.fromJson(jsonData);

      expect(position.id, jsonData['id']);
      expect(position.name, jsonData['name']);
      expect(position.description, jsonData['description']);
    });
  });
}
