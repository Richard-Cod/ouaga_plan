import 'package:flutter_app/Plan/Plan.dart';
import 'package:flutter_app/User/User.dart';
import 'package:http/http.dart' as http;

class IPlanRepo {
  Future<List<Plan>> getAll({http.Client client}) async {
    return null;
  }

  Future<Plan> getById(int id, {dynamic client}) async {
    return null;
  }

  Future<Plan> add(Plan plan, {dynamic client}) async {
    return null;
  }

  Future<bool> delete(Plan plan, {dynamic client}) async {
    return false;
  }

  Future<bool> deleteById(int id, {dynamic client}) async {
    return false;
  }

  void populate(List<Plan> plans) {}

  Plan update(Plan plan, {dynamic client}) {
    return null;
  }

  bool addInvited(Plan plan, User user, {dynamic client}) {
    return false;
  }
}
