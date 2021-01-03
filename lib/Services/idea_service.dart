import 'package:goalzy_app/Models/idea_class.dart';
import 'package:goalzy_app/Repositories/repository.dart';

class IdeaService {
  Repository _repository;


  IdeaService() {
    _repository = Repository();
  }


  saveIdea(Idea idea) async {
    return await _repository.insertData('ideas', idea.ideaMap());
  }

  readIdeas() async {
    return await _repository.readData('ideas');
  }

  readIdeaById(ideaId) async {
    return await _repository.readDataById('ideas', ideaId);
  }

  updateIdea(Idea idea) async {
    return await _repository.updateData('ideas', idea.ideaMap());
  }

  deleteIdea(ideaId) async {
    return await _repository.deleteData('ideas', ideaId);
  }

}