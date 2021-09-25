import 'dart:convert';

import 'package:flutter_app/Plan/IPlanRepository.dart';
import 'package:flutter_app/Plan/Plan.dart';
import 'package:flutter_app/User/User.dart';
// ignore: implementation_imports
import 'package:http/src/client.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

class RestPlanRepository implements IPlanRepo {
  // ignore: non_constant_identifier_names

  String API_URL = dotenv.env['API_URL'];

  @override
  Future<Plan> add(Plan plan, {dynamic client}) {
    throw UnimplementedError();
  }

  @override
  bool addInvited(Plan plan, User user, {dynamic client}) {
    // TODO: implement addInvited
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(Plan plan, {dynamic client}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteById(int id, {dynamic client}) async {
    final response = await client.delete(Uri.parse("$API_URL/plans/$id"));

    if (response.statusCode == 200) {
      // var jsonResponse = json.decode(response.body);
      return true;
    } else {
      throw Exception('Failed to delete plan');
    }
  }

  @override
  Future<Plan> getById(int id, {dynamic client}) async {
    final response = await client.get(Uri.parse("$API_URL/plans/$id"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = json.decode(response.body);
      return Plan.fromJson(jsonResponse);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load plan');
    }
  }

  @override
  void populate(List<Plan> plans) {
    // TODO: implement populate
  }

  @override
  Plan update(Plan plan, {dynamic client}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<List<Plan>> getAll({Client client}) async {
    print(dotenv.env);

    final response = await client.get(Uri.parse("$API_URL/plans"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      var jsonResponse = json.decode(response.body);
      List<Plan> result = [];
      for (var jsonProduct in jsonResponse) {
        result.add(Plan.fromJson(jsonProduct));
      }
      return result;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load plan');
    }
  }
}
