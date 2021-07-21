
import 'package:flutter_app/Plan/IPlanRepository.dart';
import 'package:flutter_app/Plan/Plan.dart';
import 'package:flutter_app/User/User.dart';

class InMemoryPlanRepository implements IPlanRepo {
  List<Plan> plans = [];
  static const Duration duration = Duration(milliseconds: 100);

  @override
  Future<List<Plan>>getAll({dynamic client}) {
   return Future.delayed(
      duration,
          () => this.plans ,
    );
  }

  @override
  Future<Plan> add(Plan plan ,{dynamic client}) {
    this.plans.add(plan);
    return Future.delayed(
      duration,
          () => plan ,
    );
  }

  @override
  getById(int i , {dynamic client}) {
   Plan plan =  this.plans.firstWhere(
          (element) => element.id == i,
      orElse: () => null,);

    return Future.delayed(
      duration,
          () => plan ,
    );

  }

  @override
  Future<bool> delete(Plan plan , {dynamic client}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteById(int id , {dynamic client}) {
    final int index = this.plans.indexWhere((element) => element.id == id);
    if(index == -1) return Future.delayed(
      duration, () => false );

    this.plans.removeAt(index);
    return Future.delayed(duration, () => true);
  }

  @override
  void populate(List<Plan> plans) {
    this.plans = plans;
  }

  @override
  Plan update(Plan plan ,{dynamic client}) {
    final int index = this.plans.indexWhere((element) => element.id == plan.id);
    if(index == -1) return null;
    this.plans[index] = plan  ;
    return plan;
  }

  @override
  bool addInvited(Plan plan, User user ,{dynamic client}) {
    final int index = this.plans.indexWhere((element) => element.id == plan.id);
    if(index == -1) return false;

    plan.invited.add(user);
    this.plans[index].invited.add(user);
    return true;
  }

}




