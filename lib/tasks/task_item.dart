import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/models/task_models.dart';
import 'package:todo/network/firebase/firebase_functions.dart';

import '../constants/colors.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;
   var isClickes=false;
  TaskItem({required this.taskModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Slidable(
          startActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  FirebaseFunctions.deleteTask(taskModel.id);
                },
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16)),
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: (context) {
                },
                backgroundColor: tdBlue,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'edit',
              ),
            ],
          ),
          child: Container(
            //margin: EdgeInsets.all(12),
            //padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

            height: 120,
            child: Row(
              children: [
                VerticalDivider(
                  color: tdBlue,
                  thickness: 3,
                  endIndent: 22,
                  indent: 22,
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(taskModel.title,textAlign: TextAlign.start,style: TextStyle(fontSize: 16),),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // ImageIcon(AssetImage("assets/images/Group 21.png"),),
                        // SizedBox(width: 5,),
                        Text(
                          taskModel.description,style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    isClickes!=isClickes;
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 15),
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: taskModel.isDone ? Colors.black : tdBlue),
                      child: ImageIcon(
                        AssetImage("assets/images/icon_check.png"),
                        color: tdBGColor,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
