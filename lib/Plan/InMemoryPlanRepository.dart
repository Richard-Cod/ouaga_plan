
import 'package:flutter_app/Plan/IPlanRepository.dart';
import 'package:flutter_app/Plan/Plan.dart';
import 'package:flutter_app/User/User.dart';

class InMemoryPlanRepository implements IPlanRepo {
  List<Plan> plans = [];

  @override
  getAll() {
    return this.plans;
  }

  @override
  Plan add(Plan plan) {
    this.plans.add(plan);
  }

  @override
  getById(int i) {
    return this.plans.firstWhere(
            (element) => element.id == i,
             orElse: () => null,);
  }

  @override
  bool delete(Plan plan) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  bool deleteById(int id) {
    final int index = this.plans.indexWhere((element) => element.id == id);
    if(index == -1) return false;

    this.plans.removeAt(index);
    return true;
  }

  @override
  void populate(List<Plan> plans) {
    this.plans = plans;
  }

  @override
  Plan update(Plan plan) {
    final int index = this.plans.indexWhere((element) => element.id == plan.id);
    if(index == -1) return null;
    this.plans[index] = plan  ;
    return plan;
  }

  @override
  bool addInvited(Plan plan, User user) {
    final int index = this.plans.indexWhere((element) => element.id == plan.id);
    if(index == -1) return false;

    plan.invited.add(user);
    this.plans[index].invited.add(user);
    return true;
  }

}




