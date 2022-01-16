import 'dart:convert';

import 'package:stacked/stacked.dart';
import 'package:stacked_arch/app/app.router.dart';
import 'package:stacked_arch/app/app.locator.dart';
import 'package:stacked_arch/enums/basic_dialog_status.dart';
import 'package:stacked_arch/enums/dialog_type.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_arch/api.dart';
import 'package:stacked_arch/services/auth_service.dart';

class CreateAccountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  String username = '';
  String password = '';
  String confirmedPassword = '';
  String access_token = '';

  void doSomething() {
    _navigationService.navigateTo(Routes.startUpView);
  }

  void goToLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }

  void updateUsername(value) {
    username = value;
  }

  void updatePassword(value) {
    password = value;
  }
    void updateConfirmedPassword(value) {
    confirmedPassword = value;
  }

  Future signUp() async {
    if (password!=confirmedPassword){
          await _dialogService.showCustomDialog(
          variant: DialogType.basic,
          // data: BasicDialogStatus.error,
          title: "The password confirmation doesn't match",
          description:"Make sure the password and confirmation password match",
          mainButtonTitle:"Ok"
    );
    }else{
      var authResponse = await _authService.postSignup(username, password);
      if (authResponse.statusCode ==200){
        _navigationService.navigateTo(Routes.loginView);
          await _dialogService.showCustomDialog(
              variant: DialogType.basic,
              // data: BasicDialogStatus.error,
              title: "Account Succesfully Created",
              description:"Login to access your account",
              mainButtonTitle:"Ok"
        );
      }
      if (authResponse.statusCode ==409){
         await _dialogService.showCustomDialog(
              variant: DialogType.basic,
              data: BasicDialogStatus.error,
              title: jsonDecode(authResponse.body)["detail"],
              description:"Please enter a different email address",
              mainButtonTitle:"Ok"
        );
      }
      
    }
    // await _dialogService.showDialog(
    //     title: 'Test Dialog Title',
    //     description: 'Test Dialog Description',
    //     dialogPlatform: DialogPlatform.Cupertino,
    // );

    // var token = await _authService.postLogin(username, password);
    // access_token = _authService.access_token;
    if (_authService.is_authenticated) {
      _navigationService.navigateTo(Routes.startUpView);
    }
  }
}
