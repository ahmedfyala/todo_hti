import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/models/task_models.dart';
import 'package:todo/network/firebase/firebase_functions.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var selectedDate = DateTime.now();
  var tittleController = TextEditingController();
  var descriptionController = TextEditingController();

  // var dateController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                margin: EdgeInsets.only(top: 5),
                alignment: Alignment.center, child: Text("Add New Task")),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: tittleController,
              validator: (value) {
                if (value.toString().length < 4) {
                  return "Please enter title at least 4 character";
                }
                return null;
              },
              decoration: InputDecoration(
                label: Text("Text Title"),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: tdBlue),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              maxLines: 4,

              controller: descriptionController,
              decoration: InputDecoration(
                label: Text("Text Describtion",
                maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: tdBlue),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text("Select Date"),
            InkWell(
                onTap: () {
                  ChooseDateTime();
                },
                child: Container(alignment: Alignment.center,
                    child: Text(selectedDate.toString().substring(0, 10)))),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: tdBlue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))
                ),
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    TaskModel task = TaskModel(title: tittleController.text,
                        description: descriptionController.text,
                        date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
                    FirebaseFunctions.addTask(task);
                        Navigator.pop(context);
                  }

                },
                child: Text("Add Task", style: TextStyle(fontSize: 20),),),
            ),
          ],
        ),
      ),
    );
  }

  void ChooseDateTime() async {
    DateTime? chooseDate =
    await showDatePicker(

      context: context,

      builder: (context, child) {
        return Theme(data: ThemeData(
          colorScheme: Theme
              .of(context)
              .colorScheme
              .copyWith(
            primary: tdBlue,
          ),
        ), child: child!);
      },
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),);
    if (chooseDate != null) {
      selectedDate = chooseDate;
      setState(() {

      });
    }
  }
}
