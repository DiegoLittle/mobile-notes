import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
 const StartUpView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
       var deviceData = MediaQuery.of(context);
    final Size size = deviceData.size;
    var deviceHeight = deviceData.size.height;
    var deviceWidth = deviceData.size.width;
   return ViewModelBuilder<StartUpViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
 
      //  floatingActionButton: FloatingActionButton(
      //    backgroundColor: Colors.blue.shade200,
      //    onPressed: model.doSomething,
      //    child: Icon(Icons.add,size: 30,color:Colors.white)
      //  ),
       
       body: Stack(
         fit: StackFit.expand,
         children: [
           ListView.builder(
                shrinkWrap: true,
                itemCount: model.notes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: DecoratedBox(
                        decoration: BoxDecoration(color:Colors.blue.shade50,borderRadius:BorderRadius.circular(10)),
                        child:ListTile(
                      onTap: (){
                        model.noteDetail(model.notes[index]);
                      },
                      title: Text(model.notes[index].title,style:TextStyle(fontSize: 17,fontWeight: FontWeight.w600)),
                      // subtitle: Text(model.notes[index].description)
                      
                      )
                      ),
                  );
                }
              ),
         Positioned(
      bottom:0,
      left:0,
      child: Container(
        height: 80,
        width:deviceWidth,
       //  color: Colors.white,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width,80),
              painter: BNBCustomPainter()
            ),
            Center(
              heightFactor: .6,
              child: FloatingActionButton(
                onPressed: model.addNote,
                backgroundColor: Colors.blue.shade200,
                child: Icon(Icons.add,color: Colors.white,),elevation: 0.1,
              )
            ),
            Container(
              width:size.width,
              height:80,
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  IconButton(
                   icon:Icon(Icons.home),
                   onPressed: (){},),
                 IconButton(
                   icon:Icon(Icons.folder),
                   onPressed: model.goToFiles,),
                   Container(width:size.width*.2),
                 IconButton(
                   icon:Icon(Icons.bookmark),
                   onPressed: (){},),
                 IconButton(
                   icon:Icon(Icons.notifications),
                   onPressed: (){},)
                ]
              )
            )
          ],
        )
      )
       //  decoration: BoxDecoration(color:Colors.red)),
    )
         ],
         
       )
      //  Center(
      //    child: Column(children: [
      //      Text(model.title),
      //      ElevatedButton(onPressed: model.getTodos,child: Text("Hello World"),),
      //     // for(var item in model.todos )Text(item.title)
      //      ],)
      //  ),
     ),
     viewModelBuilder: () => StartUpViewModel(),
     onModelReady: (viewModel) => viewModel.getNotes(),
   );
 }
}

class BNBCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas,Size size){
    Paint paint= Paint()..color = Colors.white..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width*.2, 0, size.width*.35, 0);
    path.quadraticBezierTo(size.width*.4, 0, size.width*.40, 20);
    path.arcToPoint(Offset(size.width*.6,20),
    radius:Radius.circular(10.0),
    clockwise: false);
    path.quadraticBezierTo(size.width*.6, 0, size.width*.65, 0);
    path.quadraticBezierTo(size.width*.8, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0,size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path,paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return false;
  }
}