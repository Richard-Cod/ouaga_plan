// Import the test package and Counter class
import 'package:flutter_app/Plan/IPlanRepository.dart';
import 'package:flutter_app/Plan/InMemoryPlanRepository.dart';
import 'package:flutter_app/Plan/Plan.dart';
import 'package:flutter_app/User/User.dart';
import 'package:test/test.dart';

void main() {
  IPlanRepo planRepository;

  setUp(() => {
    planRepository = InMemoryPlanRepository()
  });

  test('Should get 0 plans', () {
    expect(planRepository.getAll(), []);
  });

  test('Should get 1 plan', () {
    planRepository.add(Plan(id: 1 , title: "title", invited: []));
    expect(planRepository.getById(1).title, "title");
  });

  test('Should add 1 plan', () {
    planRepository.add(Plan(id: 1 , title: "title", invited: []));
    expect(planRepository.getAll()[0].title, "title");
  });

  test('Should be able to populate repository', () {
    List<Plan> plans = [
      Plan(id: 1 , title: "title1", invited: []) ,
      Plan(id: 2 , title: "title2", invited: []) ,
      Plan(id: 3 , title: "title3", invited: [])
    ];
    planRepository.populate(plans);

    for(Plan plan in planRepository.getAll() ){
      expect(plans, contains(plan));
    }
  });



  test('Should delete 1 plan', () {
    planRepository.add(Plan(id: 1 , title: "title", invited: []));

    expect(true,planRepository.deleteById(1));
    expect(null, planRepository.getById(1));
  });

  test('Should not delete 1 plan because not in db', () {
    expect(false, planRepository.deleteById(1));
  });

  test('Should be able to update 1 plan', () {
    Plan plan = Plan(id: 1 , title: "title" , description: "description", invited: []);
    planRepository.add(plan);

    plan.title = "new title";
    plan.description = "new description";

    planRepository.update(plan);

    expect("new title", planRepository.getById(1).title);
    expect("new description", planRepository.getById(1).description);
  });

  test('Should not be able to update 1 plan because not in db', () {
    Plan plan = Plan(id: 1 , title: "title" , description: "description", invited: []);
    plan.title = "new title";
    plan.description = "new description";
    expect(null,planRepository.update(plan));
  });


  test('Should be able to get invited to a plan', () {
    Plan plan = Plan(id: 1 , title: "title" , description: "description", invited: []);
    planRepository.add(plan);
    expect([], plan.invited);
  });

  test('Should be able to add invited to a plan', () {
    Plan plan = Plan(id: 1 , title: "title" , description: "description", invited: []);
    planRepository.add(plan);

    planRepository.addInvited(plan , User(username: "Toto" ));

    expect("Toto", plan.invited[0].username);
    expect("Toto", planRepository.getById(1).invited[0].username);
  });


  test('Should not be able to add invited because plan does not exist in db', () {
    Plan plan = Plan(id: 1 , title: "title" , description: "description", invited: []);
    expect(false, planRepository.addInvited(plan , User(username: "Toto" )));
  });
}


