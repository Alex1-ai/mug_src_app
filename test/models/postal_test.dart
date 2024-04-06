import 'package:flutter_test/flutter_test.dart';
import 'package:mug_app/models/post_model.dart';

void main() {
  group('PostalModel', () {
    test('fromJson() constructs correct PostalModel', () {
      final Map<String, dynamic> jsonData = {
        'id': 1,
        'poster_img': 'image.jpg',
        'updated_at': '2022-04-06T12:00:00Z',
      };

      final postalModel = PostalModel.fromJson(jsonData);

      expect(postalModel.id, jsonData['id']);
      expect(postalModel.posterImg, jsonData['poster_img']);
      expect(postalModel.updatedAt, jsonData['updated_at']);
    });

    test('toJson() converts PostalModel to Map', () {
      final postalModel = PostalModel(
        id: 1,
        posterImg: 'image.jpg',
        updatedAt: '2022-04-06T12:00:00Z',
      );

      final jsonMap = postalModel.toJson();

      expect(jsonMap['id'], postalModel.id);
      expect(jsonMap['poster_img'], postalModel.posterImg);
      expect(jsonMap['updated_at'], postalModel.updatedAt);
    });
  });
}
