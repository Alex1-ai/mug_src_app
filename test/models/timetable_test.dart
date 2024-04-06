import 'package:flutter_test/flutter_test.dart';
import 'package:mug_app/models/timetable_model.dart';

void main() {
  group('TimetableItemModel', () {
    test('fromJson() constructs correct TimetableItemModel', () {
      final Map<String, dynamic> jsonData = {
        'id': 1,
        'name': 'Timetable',
        'timetableDoc': 'timetable.pdf',
        'department': 'Engineering',
        'updated_at': '2022-04-06T12:00:00Z',
      };

      final timetableItem = TimetableItemModel.fromJson(jsonData);

      expect(timetableItem.id, jsonData['id']);
      expect(timetableItem.name, jsonData['name']);
      expect(timetableItem.timetableDoc, jsonData['timetableDoc']);
      expect(timetableItem.department, jsonData['department']);
      expect(timetableItem.updatedAt, DateTime.parse(jsonData['updated_at']));
    });
  });
}
