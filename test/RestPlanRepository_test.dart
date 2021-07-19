

import 'package:flutter_app/Plan/Plan.dart';
import 'package:flutter_app/Plan/RestPlanRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';

const String API_URL = "http://192.168.1.102:3000";

@GenerateMocks([http.Client])
void main() {
  RestPlanRepository planRepository;

  setUp(() =>
  {
    planRepository = RestPlanRepository()
  });
  group('fetchPlans', () {
    test('returns plans if the http call completes successfully', () async {
      var resultBody = '''[
      {
        "id": 1,
      "title": "title1"
      },
      {
      "id": 2,
      "title": "title2"
      },
      {
      "id": 3,
      "title": "title3"
      }
      ]''';

      final client = MockClient((request) async {
        return Response(resultBody, 200);
      });

      expect(await planRepository.getAllAsync(client), isA<List<Plan>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient((request) async {
        return Response('Not Found', 404);
      });

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      expect(planRepository.getAllAsync(client), throwsException);
    });

  });

  group('fetch One Plan', () {
    test('returns the plan if the http call completes successfully', () async {
      var resultBody = '''
      {
        "id": 1,
      "title": "title1POK"
      }
 ''';
      final client = MockClient((request) async {
        return Response(resultBody, 200);
      });

      expect(await planRepository.getByIdAsync(1 , client), isA<Plan>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient((request) async {
        return Response('Not Found', 404);
      });

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      expect(planRepository.getByIdAsync(1 , client), throwsException);
    });

  });

  group('deletePlans', () {

    test('successfully delete a plan', () async {
      final client = MockClient((request) async {
        return Response("true", 200);
      });
      final bool result = await planRepository.deleteByIdAsync(1 , client);
      expect(result, true);
    });

    test('cannot delete plan because not exist', ()  {
      final client = MockClient((request) async {
        return Response("Not found", 404);
      });

      expect(planRepository.deleteByIdAsync(1 , client), throwsException);
    });

  });



  // test('Should get plans ', () async {
  //   List<Plan> plans = await planRepository.getAllAsync();
  //
  //   print(plans);
  //
  //   expect(plans, isNot(equals(null)) );
  // });


}