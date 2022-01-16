import 'package:stacked/stacked.dart';
import 'package:stacked_arch/app/app.router.dart';
import 'package:stacked_arch/app/app.locator.dart';
import 'package:stacked_arch/datamodels/note_model.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_arch/datamodels/todo_model.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_arch/datamodels/todo_model.dart';
import 'package:stacked_arch/api.dart';
import 'package:stacked_arch/services/auth_service.dart';


class StartUpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  // final _api = locator<API>();
  String title = '';

  late List<TodoItemModel> todos = [];
  late List<Note> notes = [];

  void addNote(){
    _navigationService.navigateTo(Routes.newNoteView);
  }
    void goToFiles(){
    _navigationService.navigateTo(Routes.secondView);
  }
    void goToHome(){
    _navigationService.navigateTo(Routes.startUpView);
  }
  
    void noteDetail(Note note){
      // print(todo.title);
      // How do I pass data to the noteViewmodel when I navigate
    _navigationService.navigateTo(Routes.noteView,arguments: NoteViewArguments(edditingNote: note));
  }
  Future getTodos() async{

    var todosResults = await API().getTodos();
    // var notesResults = await API().getNotes(_authService.access_token);
    // print(notesResults);
    // print(todosResults[0].title);
    todos = todosResults;

    notifyListeners();
  }
  Future getNotes() async{

    var notesResults = await API().getNotes(_authService.access_token);
    notes = notesResults;
    // var notesResults = await API().getNotes(_authService.access_token);
    // print(notesResults);
    // print(todosResults[0].title);
    // todos = todosResults;

    notifyListeners();
  }

  // @override
  // Future<TodoItemModel> futureToRun() => locator<API>().getTodos();
}