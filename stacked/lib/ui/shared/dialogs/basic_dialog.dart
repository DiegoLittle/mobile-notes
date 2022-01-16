import 'package:flutter/material.dart';
import 'package:stacked_arch/enums/basic_dialog_status.dart';
import 'package:stacked_arch/ui/shared/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';

class BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const BasicDialog({ 
    Key? key,
    required this.request,
    required this.completer
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: _BasicDialogContent(request:request,completer:completer),
    );
  }
}

class _BasicDialogContent extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _BasicDialogContent({ 
    Key? key,
    required this.request,
    required this.completer
     }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior:Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidthPercentage(context,percentage: 0.04)
          ),
          padding: const EdgeInsets.only(
            top:32,
            left:16,
            right:16,
            bottom:12
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpaceSmall,
              Text(request.title??'',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              verticalSpaceSmall,
              Text(request.description??'',textAlign: TextAlign.center,),
              verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if(request.secondaryButtonTitle != null)
                    TextButton(
                      onPressed: ()=>
                      completer(DialogResponse(confirmed:false)),
                      child: Text(request.secondaryButtonTitle??'',textAlign: TextAlign.center,),

                    ),
                    TextButton(onPressed: ()=> completer(DialogResponse(confirmed:true)),
                    child: Text(request.mainButtonTitle??"",))
                ],
              )
            ],
          )
        ),
        Positioned(
          top: -28,
          child: CircleAvatar(
            minRadius: 16,
            maxRadius: 28,
            backgroundColor: _getStatusColor(request.data),
            child: Icon(
              _getStatusIcon(request.data),
              size:28,
              color:Colors.white
              )
          )
        )
      ],
    );
  }

  Color _getStatusColor(dynamic data){
    switch (data) {
      case BasicDialogStatus.error:
      return Colors.red;
      case BasicDialogStatus.warning:
      return Colors.orange;
      default:
      return Colors.blue.shade200;
    }
  }
}

  IconData _getStatusIcon(dynamic data){
    switch (data) {
      case BasicDialogStatus.error:
      return Icons.close;
      case BasicDialogStatus.warning:
      return Icons.warning_amber;
      default:
      return Icons.check;
    }
  }