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

  test('Should get 0 plans', () async {
    List<Plan> plans = await planRepository.getAll();
    expect(plans, []);
  });

  test('Should get 1 plan', () async{
    planRepository.add(Plan(id: 1 , title: "title", invited: []));
    expect((await planRepository.getById(1)).title, "title");
  });

  test('Should add 1 plan', () async {
    planRepository.add(Plan(id: 1 , title: "title", invited: []));
    List<Plan> plans = await planRepository.getAll();
    expect(plans[0].title, "title");
  });

  test('Should be able to populate repository', () async{
    List<Plan> plans = [
      Plan(id: 1 , title: "title1", invited: []) ,
      Plan(id: 2 , title: "title2", invited: []) ,
      Plan(id: 3 , title: "title3", invited: [])
    ];
    planRepository.populate(plans);

    for(Plan plan in (await planRepository.getAll()) ){
      expect(plans, contains(plan));
    }
  });



  test('Should delete 1 plan', () async {
    planRepository.add(Plan(id: 1 , title: "title", invited: []));

    expect(true,(await planRepository.deleteById(1)));
    expect(null, (await planRepository.getById(1)));
  });

  test('Should not delete 1 plan because not in db', () async {
    expect(false, (await planRepository.deleteById(1)));
  });

  test('Should be able to update 1 plan', ()  async {
    Plan plan = Plan(id: 1 , title: "title" , description: "description", invited: []);
    planRepository.add(plan);

    plan.title = "new title";
    plan.description = "new description";

    planRepository.update(plan);

    Plan planFromDB = await planRepository.getById(1);
    expect("new title", planFromDB.title);
    expect("new description", planFromDB.description);
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

  test('Should be able to add invited to a plan', () async {
    Plan plan = Plan(id: 1 , title: "title" , description: "description", invited: []);
    planRepository.add(plan);

    planRepository.addInvited(plan , User(username: "Toto" ));

    expect("Toto", plan.invited[0].username);
    expect("Toto", (await planRepository.getById(1)).invited[0].username);
  });


  test('Should not be able to add invited because plan does not exist in db', () {
    Plan plan = Plan(id: 1 , title: "title" , description: "description", invited: []);
    expect(false, planRepository.addInvited(plan , User(username: "Toto" )));
  });
}


