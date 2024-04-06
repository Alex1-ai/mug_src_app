import "package:flutter_test/flutter_test.dart";
import "package:mug_app/models/candidate_model.dart";



void main(){
  group("CandidateModel", (){
    late CandidateModel candidate;

    setUp(() {
      candidate = CandidateModel(
        id: 1,
        name: 'John Doe',
        image: 'john_doe.jpg',
        votes: 100,
        department: 'Engineering',
        position: 'President',
        );
    });


    test('fromJson() construct correct CandidateModel', (){
      final Map<String, dynamic> jsonData = {
        'id': 1,
        'name': 'John Doe',
        'image': 'john_doe.jpg',
        'votes': 100,
        'department': 'Engineering',
        'position': 'President',
      };

      final candidateFromJson = CandidateModel.fromJson(jsonData);

      expect(candidateFromJson.id, jsonData['id']);
      expect(candidateFromJson.name, jsonData['name']);
      expect(candidateFromJson.image, jsonData['image']);
      expect(candidateFromJson.votes, jsonData['votes']);
      expect(candidateFromJson.department, jsonData['department']);
      expect(candidateFromJson.position, jsonData['position']);
    });


    test("selected should be false by default", (){
         expect(candidate.selected, false);
    });

  });
}