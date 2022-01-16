import 'package:stacked/stacked.dart';
import 'package:stacked_arch/app/app.router.dart';
import 'package:stacked_arch/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_arch/api.dart';
import 'package:stacked_arch/services/auth_service.dart';


class AuthViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  String username = '';
  String password = '';
  String access_token='';

  void doSomething(){
    _navigationService.navigateTo(Routes.startUpView);
  }
  void updateUsername(value){
    username = value;
  }
  void updatePassword(value){
    password = value;
  }
  Future login() async{
    var token = await _authService.postLogin(username, password);
    access_token = _authService.access_token;
    if(_authService.is_authenticated){
      _navigationService.navigateTo(Routes.startUpView);
    }
  }

}