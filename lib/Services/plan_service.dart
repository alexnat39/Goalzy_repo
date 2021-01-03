import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Repositories/repository.dart';

class PlanService {
  Repository _repository;

  PlanService() {
    _repository = Repository();
  }


  savePlan(Plan plan) async {
    return await _repository.insertData('plans', plan.planMap());
  }

  readPlans() async {
    return await _repository.readData('plans');
  }

  readPlanById(planId) async {
    return await _repository.readDataById('plans', planId);
  }

  updatePlan(Plan plan) async {
    return await _repository.updateData('plans', plan.planMap());
  }

  deletePlan(planId) async {
    return await _repository.deleteData('plans', planId);
  }
}