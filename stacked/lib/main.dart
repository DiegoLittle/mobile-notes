import 'package:flutter/material.dart';
import 'package:stacked_arch/app/app.locator.dart';
import 'package:stacked_arch/ui/shared/setup_dialog_ui.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() async {
  await dotenv.load(fileName: ".env");
  setupLocator();
  setupDialogUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
