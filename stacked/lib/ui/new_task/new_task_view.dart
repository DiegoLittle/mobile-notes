import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_arch/datamodels/note_model.dart';
import 'package:stacked_arch/datamodels/todo_model.dart';
import 'new_task_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_arch/ui/widgets/date_picker.dart';

class NewTaskView extends StatelessWidget {
// final TodoItemModel edittingTodo;
// final Note edditingNote;
  const NewTaskView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<NewTaskViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
        //  floatingActionButton: FloatingActionButton(
        //    onPressed: model.doSomething,
        //  ),
        // backgroundColor: Colors.blue.shade100,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40, left: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        model.doSomething();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: 40, left: width * .22, bottom: 10),
                      child: Text("Create new task",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)))
                ],
              ),
            ),
            Center(
              child: _HookForm(),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => NewTaskViewModel(),
      //  onModelReady: (viewModel) => viewModel.setNote(edditingNote),
    );
  }
}

// Form that makes use of the ViewModel provided above but also makes use of hooks
class _HookForm extends HookViewModelWidget<NewTaskViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, NewTaskViewModel model) {
    double height = MediaQuery.of(context).size.width;
    double width = MediaQuery.of(context).size.width;
    var title = useTextEditingController(text: model.title);
    var body = useTextEditingController(text: model.body);

    // final TextEditingController _controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(bottom: 8),
              child: Text("Task Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
          Container(
            alignment: Alignment.centerLeft,
            height: height * .12,
            child: TextField(
              controller: title,
              onChanged: model.updateTitle,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                  hintText: "Reading a book",
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF000000),
                        width: 5,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  contentPadding: EdgeInsets.only(left: 16)),
              // labelText: "Task Name",),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              // onChanged: model.updateTitle,
            ),
          ),
          Container(
              padding: EdgeInsets.only(bottom: 8),
              child: Text("Task Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                  DatePicker(),
          
          TextField(
            controller: body,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter description",
                hintStyle: TextStyle(
                  fontSize: 17,
                )),
            style: TextStyle(
              fontSize: 17,
            ),
            onChanged: model.updateBody,
          ),
        ],
      ),
    );
  }
}
