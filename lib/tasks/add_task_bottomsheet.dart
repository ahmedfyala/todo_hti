import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/models/task_models.dart';
import 'package:todo/network/firebase/firebase_functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskBottomSheet extends StatefulWidget {
  final TaskModel? existingTask;

  const AddTaskBottomSheet({this.existingTask, super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //var selectedDate = DateTime.now();
  var tittleController = TextEditingController();
  var descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.existingTask != null) {
      tittleController.text = widget.existingTask!.title;
      descriptionController.text = widget.existingTask!.description;
      selectedDate =
          DateTime.fromMillisecondsSinceEpoch(widget.existingTask!.date);
    }
  }

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
                margin: const EdgeInsets.only(top: 5),
                alignment: Alignment.center,
                child: Text(AppLocalizations.of(context)!.addnewtask)),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: tittleController,
              validator: (value) {
                if (value.toString().length < 4) {
                  return AppLocalizations.of(context)!.taskvalidate;
                }
                return null;
              },
              decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.tasktitle),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: tdBlue),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              child: TextFormField(
                maxLines: 4,
                controller: descriptionController,
                decoration: InputDecoration(
                  label: Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.taskdescriptiob,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: tdBlue),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(AppLocalizations.of(context)!.selectdate),
            InkWell(
                onTap: () {
                  ChooseDateTime();
                },
                child: Container(
                    alignment: Alignment.center,
                    child: Text(selectedDate.toString().substring(0, 10)))),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: tdBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    TaskModel task = TaskModel(
                        title: tittleController.text,
                        description: descriptionController.text,
                        date: DateUtils.dateOnly(selectedDate)
                            .millisecondsSinceEpoch);
                    FirebaseFunctions.addTask(task);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  AppLocalizations.of(context)!.clickadd,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void ChooseDateTime() async {
    DateTime? chooseDate = await showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(
            data: ThemeData(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: tdBlue,
                  ),
            ),
            child: child!);
      },
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (chooseDate != null) {
      selectedDate = chooseDate;
      setState(() {});
    }
  }
}
