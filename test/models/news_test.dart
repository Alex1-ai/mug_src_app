import 'package:flutter_test/flutter_test.dart';
import "package:mug_app/models/mug_news_model.dart";

void main() {
  group('MugNewsModel', () {
    test('fromJson() constructs correct MugNewsModel', () {
      final Map<String, dynamic> jsonData = {
        'id': 1,
        'title': 'Breaking News',
        'description': 'This is a breaking news article.',
        'image': 'breaking_news.jpg',
        'updated_at': '2022-04-06T12:00:00Z',
      };

      final mugNews = MugNewsModel.fromJson(jsonData);

      expect(mugNews.id, jsonData['id']);
      expect(mugNews.title, jsonData['title']);
      expect(mugNews.description, jsonData['description']);
      expect(mugNews.image, jsonData['image']);
      expect(mugNews.updatedAt, jsonData['updated_at']);
    });

    test('toJson() converts MugNewsModel to Map', () {
      final mugNews = MugNewsModel(
        id: 1,
        title: 'Breaking News',
        description: 'This is a breaking news article.',
        image: 'breaking_news.jpg',
        updatedAt: '2022-04-06T12:00:00Z',
      );

      final jsonMap = mugNews.toJson();

      expect(jsonMap['id'], mugNews.id);
      expect(jsonMap['title'], mugNews.title);
      expect(jsonMap['description'], mugNews.description);
      expect(jsonMap['image'], mugNews.image);
      expect(jsonMap['updated_at'], mugNews.updatedAt);
    });
  });
}
