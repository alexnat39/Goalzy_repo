import 'package:goalzy_app/Models/goal_class.dart';
import 'package:goalzy_app/Repositories/repository.dart';
import 'package:sqflite/sqflite.dart';

class GoalService {
  Repository _repository;

  GoalService() {
    _repository = Repository();
  }


  saveGoal(Goal goal) async {
    return await _repository.insertData('goals', goal.goalMap());
  }

  readGoals() async {
    return await _repository.readData('goals');
  }

  readGoalById(goalId) async {
    return await _repository.readDataById('goals', goalId);
  }

  updateGoal(Goal goal) async {
    return await _repository.updateData('goals', goal.goalMap());
  }
  
  deleteGoal(goalId) async {
    return await _repository.deleteData('goals', goalId);
  }



}