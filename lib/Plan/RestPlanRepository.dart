
import 'dart:convert';

import 'package:flutter_app/Plan/IPlanRepository.dart';
import 'package:flutter_app/Plan/Plan.dart';
import 'package:flutter_app/User/User.dart';

class RestPlanRepository implements IPlanRepo{
  static const String API_URL = "http://192.168.1.102:3000";

  @override
  Plan add(Plan plan) {

    throw UnimplementedError();
  }

  @override
  bool addInvited(Plan plan, User user) {
    // TODO: implement addInvited
    throw UnimplementedError();
  }

  @override
  bool delete(Plan plan) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  bool deleteById(int id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  Future<bool> deleteByIdAsync(int id , dynamic client) async{
    final response =
    await client.delete(Uri.parse("$API_URL/plans/$id"));

    if (response.statusCode == 200) {
      // var jsonResponse = json.decode(response.body);
      return true;
    } else {
      throw Exception('Failed to delete plan');
    }

  }

  @override
  List<Plan> getAll() {
    throw UnimplementedError();
    // return http.get(Uri.parse("$API_URL/plans"));
  }

  Future<List<Plan>> getAllAsync(dynamic client) async {
    final response =
        await client.get(Uri.parse("$API_URL/plans"));

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

  @override
  Plan getById(int id) {
      // return http.get(Uri.parse("$API_URL/plans/$id"));
      throw UnimplementedError();


  }

  @override
  void populate(List<Plan> plans) {
    // TODO: implement populate
  }

  @override
  Plan update(Plan plan) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<Plan> getByIdAsync(int id , dynamic client) async {
    final response =
        await client.get(Uri.parse("$API_URL/plans/$id"));

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

}