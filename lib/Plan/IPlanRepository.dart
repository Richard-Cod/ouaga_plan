import 'package:flutter_app/Plan/Plan.dart';
import 'package:flutter_app/User/User.dart';

class IPlanRepo {
  List<Plan> getAll(){}
  Plan getById(int id){}
  Plan add(Plan plan){}
  bool delete(Plan plan){}
  bool deleteById(int id){}

  void populate(List<Plan> plans) {}

  Plan update(Plan plan) {}

  bool addInvited(Plan plan, User user) {}
}
