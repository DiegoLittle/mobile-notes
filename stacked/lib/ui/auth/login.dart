import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_arch/ui/shared/styles.dart';
import 'login_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(

          // floatingActionButton: FloatingActionButton(
          //   onPressed: model.doSomething,
          // ),
          // backgroundColor: Colors.blue.shade200,
          // resizeToAvoidBottomInset: true,
          body: Center(
            child: Container(
                color: Colors.red.shade100,
                alignment: Alignment.center,
                child: LoginLayout()),
          )),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}

class LoginLayout extends HookViewModelWidget<LoginViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel model) {
    var username = useTextEditingController(text: model.username);
    var password = useTextEditingController(text: model.password);

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
                    child: Text("Login to your account by entering your email and password below, we are really happy to see you come back!",
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
          bottom: deviceHeight * .35,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: darkBlue),
            height: 200,
            width: deviceWidth,
          ),
        ),
        Positioned(
          // top: deviceHeight * .55,
          bottom: 0,
          // left:50,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft:Radius.circular(40),topRight:Radius.circular(40) ), color: backgroundGray),
            height: deviceHeight * .45,
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
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.centerRight,
                    child: Text("Forgot Password?")),
                GestureDetector(
                  onTap: model.login,
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
                        Text("Login",
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
                      Text("Doesn’t have an account yet?"),
                      TextButton(
                        child: Text("Sign Up"),
                        onPressed: model.goToSignUp,
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
