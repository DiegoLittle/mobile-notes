import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';


class FilePickerButton extends StatefulWidget {
  const FilePickerButton({ Key? key }) : super(key: key);

  @override
  _FilePickerButtonState createState() => _FilePickerButtonState();
}

class _FilePickerButtonState extends State<FilePickerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width:50,
      // height:50,
      constraints: BoxConstraints(maxWidth:200,maxHeight: 100),
      // decoration: BoxDecoration(color:Colors.blue.shade200),
      child: TextButton(
        child:Text("Pick File"),
        onPressed: ()async{
          final result = await FilePicker.platform.pickFiles();
        },
            )
          );
  }
}