import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_arch/ui/auth/auth_viewmodel%20copy.dart';
import 'login_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: model.doSomething,
        ),
        backgroundColor: Colors.blue.shade200,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
          child: Container(
            alignment: Alignment.center,
            child: AuthLayout()
          ),
        )
        ),
      ),
      viewModelBuilder: () => AuthViewModel(),
    );
  }
}



class AuthLayout extends HookViewModelWidget<AuthViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, AuthViewModel model) {
     var username = useTextEditingController(text:model.username);
    var password = useTextEditingController(text:model.password);
      
    // final TextEditingController _controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
              children: [
                TextField(
                  controller: username,
                  onChanged: model.updateUsername,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Enter Username",
                      labelStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  // onChanged: model.updateTitle,
                ),
                TextField(
                  controller: password,
                  onChanged: model.updatePassword,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  // controller: body,
                  decoration: InputDecoration(
                    // icon: Icon(Icons.lock,color:Colors.white),
                    border: InputBorder.none,
                    labelText: "Enter Password",
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  // onChanged: model.updateBody,
                ),
                TextButton(
                    onPressed: model.login,
                    style:TextButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text("Login",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)))
              ],
            ),
    );
  }
}