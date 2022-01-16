import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_arch/datamodels/note_model.dart';
import 'package:stacked_arch/datamodels/todo_model.dart';
import 'note_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NoteView extends StatelessWidget {
// final TodoItemModel edittingTodo;
  final Note edditingNote;
  const NoteView({Key? key, required this.edditingNote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NoteViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
        //  floatingActionButton: FloatingActionButton(
        //    onPressed: model.doSomething,
        //  ),
        // backgroundColor: Colors.blue.shade100,
        body: Column(
          children: [
            Row(
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
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 40, right: 20, bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      model.deleteNote();
                    },
                    child: Icon(
                      Icons.delete_outline_outlined,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: _HookForm(),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => NoteViewModel(),
      onModelReady: (viewModel) => viewModel.setNote(edditingNote),
    );
  }
}

// Form that makes use of the ViewModel provided above but also makes use of hooks
class _HookForm extends HookViewModelWidget<NoteViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, NoteViewModel model) {
    var title = useTextEditingController(text: model.title);
    var body = useTextEditingController(text: model.body);

    // final TextEditingController _controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: title,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter title",
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            onChanged: model.updateTitle,
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            minLines: 3,
            maxLines: null,
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
