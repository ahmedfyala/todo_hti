import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/models/task_models.dart';
import 'package:todo/network/firebase/firebase_functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constants/colors.dart';
import 'add_task_bottomsheet.dart';

class TaskItem extends StatefulWidget {
  TaskModel taskModel;

  TaskItem({required this.taskModel, super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  var isClickes = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Theme.of(context).focusColor,
        child: Slidable(
          child: Slidable(
            startActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    FirebaseFunctions.deleteTask(widget.taskModel.id);
                  },
                  borderRadius: const BorderRadius.only(
                      // topLeft: Radius.circular(16),
                      // bottomLeft: Radius.circular(16)
                      ),
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: AppLocalizations.of(context)!.delete,
                ),
                //todo add editing
                SlidableAction(
                  onPressed: (context) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return AddTaskBottomSheet(
                          existingTask: widget.taskModel,
                        );
                      },
                    );
                  },
                  backgroundColor: tdBlue,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: AppLocalizations.of(context)!.edit,
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).focusColor,
              ),
              padding: const EdgeInsets.only(right: 10, left: 10),
              height: 110,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VerticalDivider(
                    color: tdBlue,
                    thickness: 3,
                    endIndent: 25,
                    indent: 25,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.taskModel.title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 220,
                            child: Text(
                              widget.taskModel.description,
                              style: const TextStyle(fontSize: 14),
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: tdBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const ImageIcon(
                        AssetImage("assets/images/icon_check.png"),
                        color: tdBGColor,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
