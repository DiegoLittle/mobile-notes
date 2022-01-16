import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_arch/services/auth_service.dart';
import 'package:stacked_arch/ui/auth/auth_view.dart';
import 'package:stacked_arch/ui/auth/create_account_view.dart';
import 'package:stacked_arch/ui/auth/login.dart';
import 'package:stacked_arch/ui/new_note/new_note_view.dart';
import 'package:stacked_arch/ui/new_task/new_task_view.dart';
import 'package:stacked_services/stacked_services.dart';
import '../ui/startup/startup_view.dart';
import '../ui/second/second_view.dart';
import '../ui/note/note_view.dart';

@StackedApp(
  routes:[
    MaterialRoute(page: StartUpView),
    CupertinoRoute(page: SecondView),
    CupertinoRoute(page:NoteView),
    CupertinoRoute(page: AuthView),
    CupertinoRoute(page: LoginView,initial:true),
    CupertinoRoute(page: NewNoteView),
    CupertinoRoute(page: CreateAccountView),
    CupertinoRoute(page: NewTaskView)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: DialogService),
    
  ]
)
class AppSetup {
  // Serves no purpose other then annotation
}