import 'package:stacked/stacked.dart';
import 'package:stacked_arch/app/app.router.dart';
import 'package:stacked_arch/app/app.locator.dart';
import 'package:stacked_arch/datamodels/note_model.dart';
import 'package:stacked_arch/services/auth_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_arch/datamodels/todo_model.dart';
import 'package:stacked_arch/api.dart';


class NoteViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  String id='';
  String title = '';
  String body = '';

  void doSomething(){
    _navigationService.navigateTo(Routes.startUpView);
  }
  void deleteNote(){
    API().deleteNote(_authService.access_token, {"id":id,"title":title,"description":body});
    _navigationService.navigateTo(Routes.startUpView);
  }

void setTodo(TodoItemModel todo){
  title = todo.title;
  notifyListeners();
}
void setNote(Note note){
  title = note.title;
  body = note.description;
  id = note.id;
  notifyListeners();
}
    void updateTitle(String value) {
    title = value;
    API().updateNote(_authService.access_token, {"id":id,"title":title,"description":body});
    notifyListeners();
  }


  void updateBody(String value) {
    body = value;
    API().updateNote(_authService.access_token, {"id":id,"title":title,"description":body});
    notifyListeners();
  }
}