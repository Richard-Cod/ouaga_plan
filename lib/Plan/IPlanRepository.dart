import 'package:flutter_app/Plan/Plan.dart';
import 'package:flutter_app/User/User.dart';

class IPlanRepo {
  List<Plan> getAll(){return null;}
  Plan getById(int id){return null;}
  Plan add(Plan plan){return null;}
  bool delete(Plan plan){return false;}
  bool deleteById(int id){return false;}

  void populate(List<Plan> plans) {}

  Plan update(Plan plan) {return null;}

  bool addInvited(Plan plan, User user) {return false;}
}
