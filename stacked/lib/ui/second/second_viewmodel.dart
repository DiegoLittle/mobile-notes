import 'package:stacked/stacked.dart';
import 'package:stacked_arch/api.dart';
import 'package:stacked_arch/app/app.router.dart';
import 'package:stacked_arch/app/app.locator.dart';
import 'package:stacked_arch/services/auth_service.dart';
import 'package:stacked_services/stacked_services.dart';

class SecondViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  String title = '';

  void addNote(){
    _navigationService.navigateTo(Routes.newNoteView);
  }
    void goToFiles(){
    _navigationService.navigateTo(Routes.secondView);
  }
    void goToHome(){
    _navigationService.navigateTo(Routes.startUpView);
  }
      void goToTask(){
    _navigationService.navigateTo(Routes.newTaskView);
  }

  void doSomething(){
    _navigationService.navigateTo(Routes.startUpView);
  }
  void uploadFile(String path){
    API().uploadFile(_authService.access_token, path);
  }

}