import 'package:stacked/stacked.dart';
import 'package:stacked_arch/app/app.router.dart';
import 'package:stacked_arch/app/app.locator.dart';
import 'package:stacked_arch/datamodels/note_model.dart';
import 'package:stacked_arch/services/auth_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_arch/datamodels/todo_model.dart';
import 'package:stacked_arch/api.dart';
import 'package:uuid/uuid.dart';

class NewTaskViewModel extends BaseViewModel {
  var uuid = Uuid();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  String id = '';
  String title = '';
  String body = '';
  String errorMessage = '';
  // bool isSaved = false;

  void doSomething() {
    _navigationService.navigateTo(Routes.startUpView);
    // print(_navigationService.previousRoute);
  }

  void setTodo(TodoItemModel todo) {
    title = todo.title;
    notifyListeners();
  }

  void setNote(Note note) {
    title = note.title;
    notifyListeners();
  }

  void updateTitle(String value) {
    title = value;
    if (id == '') {
      print("Dbug");
      saveNote();
    } else {
      API().updateNote(_authService.access_token,
          {"id": id, "title": title, "description": body});
    }
    notifyListeners();
  }

  void updateBody(String value) {
    body = value;
    if (id == '') {
      print("Dbug");
      saveNote();
    } else {
      API().updateNote(_authService.access_token,
          {"id": id, "title": title, "description": body});
    }
    notifyListeners();
  }

  void saveNote() {
    if (title != '') {
      id = uuid.v4();
      print("Dbug");
      var postResult = API().postNote(_authService.access_token,
          {"id": id, "title": title, "description": body});
    } else {
      errorMessage = "Can't Post empty note";
    }

    notifyListeners();
  }
}
