import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_arch/ui/auth/create_account_viewmodel.dart';
import 'package:stacked_arch/ui/shared/styles.dart';
import 'login_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   onPressed: model.doSomething,
          // ),
          // backgroundColor: Colors.blue.shade200,
          body: Center(
            child: Container(
                color: Colors.red.shade100,
                alignment: Alignment.center,
                child: LoginLayout()),
          )),
      viewModelBuilder: () => CreateAccountViewModel(),
    );
  }
}

class LoginLayout extends HookViewModelWidget<CreateAccountViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, CreateAccountViewModel model) {
    var username = useTextEditingController(text: model.username);
    var password = useTextEditingController(text: model.password);
    var confirmedPassword = useTextEditingController(text: model.confirmedPassword);

    var deviceData = MediaQuery.of(context);
    var deviceHeight = deviceData.size.height;
    var deviceWidth = deviceData.size.width;
    // final TextEditingController _controller = TextEditingController();
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          child: Container(
            height: deviceHeight * .35,
            width: 350,
            color: customGreen,
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top:120),
              padding:EdgeInsets.all(8),
              child: Column(
                
                children: [
                  Text("Welcome Back!",
                  style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize: 25),),
                  Padding(
                    padding: const EdgeInsets.only(left:25,right:25,top:40),
                    child: Text("Welcome to Yuno! Enter all the details below to continue enjoying all Yuno amazing features.",
                    style: GoogleFonts.poppins(textStyle: TextStyle(color:Colors.white,fontSize:16,height:1.5,wordSpacing: 1.5,fontWeight: FontWeight.w400)),
                    textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )
          ),
        ),
        Positioned(
          top: deviceHeight * .35,
          // left:50,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: backgroundGray),
            height: deviceHeight,
            width: deviceWidth,
            // color: Colors.blue,
            child: Column(
              children: [
                Container(
                  // padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(left: 24, right: 24, top: 24),
                  width: deviceWidth,
                  height: deviceHeight * .06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 13, bottom: 16),
                        child: Icon(
                          Icons.email_outlined,
                          color: Colors.black26,
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: TextField(
                          controller: username,
                          onChanged: model.updateUsername,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your email address",
                              hintStyle: TextStyle(color: Colors.black26)),

                          // onChanged: model.updateTitle,
                        ),
                      ))
                    ],
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(left: 24, right: 24, top: 20),
                  width: deviceWidth,
                  height: deviceHeight * .06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 13, bottom: 16),
                        child: Icon(Icons.lock_outline, color: Colors.black26),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: TextField(
                          controller: password,
                          obscureText: true,
                          onChanged: model.updatePassword,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Password",
                            hintStyle: TextStyle(color: Colors.black26),
                          ),

                          // onChanged: model.updateTitle,
                        ),
                      ))
                    ],
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(left: 24, right: 24, top: 20),
                  width: deviceWidth,
                  height: deviceHeight * .06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 13, bottom: 16),
                        child: Icon(Icons.lock_outline, color: Colors.black26),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: TextField(
                          controller: confirmedPassword,
                          obscureText: true,
                          onChanged: model.updateConfirmedPassword,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Confirm Your Password",
                            hintStyle: TextStyle(color: Colors.black26),
                          ),

                          // onChanged: model.updateTitle,
                        ),
                      ))
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.centerRight,
                    child: Text("Forgot Password?")),
                GestureDetector(
                  onTap: model.signUp,
                  child: Container(
                    // padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(left: 24, right: 24, top: 20),
                    width: deviceWidth,
                    height: deviceHeight * .06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: darkerGray),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16))
                      ],
                    ),
                  ),
                ),
                Container(
                    // padding: EdgeInsets.all(8),
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Already have an account?"),
                      TextButton(
                        child: Text("Login"),
                        onPressed: model.goToLogin,
                        )],)
                    ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
