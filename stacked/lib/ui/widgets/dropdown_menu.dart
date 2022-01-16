
import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({ Key? key }) : super(key: key);

  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
       final items =["Item 1","Item 2"];
    String? value;
  @override
  Widget build(BuildContext context) {
    
    return Center(
    child: Container(
      width:300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      child: DropdownButton<String>(
        value:value,
        items: items.map(buildMenuItem).toList(),
        onChanged: (value) => setState(()=>this.value = value),
      ),
    ));
  }
    DropdownMenuItem<String> buildMenuItem(String item)=>
  DropdownMenuItem(
    value:item,
    child: Text(
      item,
      style: TextStyle(fontWeight:FontWeight.bold,fontSize:20)
    )
    );
}
