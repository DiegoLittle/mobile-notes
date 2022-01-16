import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'second_viewmodel.dart';

class SecondView extends StatelessWidget {
 const SecondView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<SecondViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
       floatingActionButton: FloatingActionButton(
         onPressed: model.doSomething,
       ),
       body: Center(
         child: Container(
           alignment: Alignment.topLeft,
           width:100,
           height: 100,
           color: Colors.red,
           child: Text(model.title),
         )
       ),
     ),
     viewModelBuilder: () => SecondViewModel(),
   );
 }
}