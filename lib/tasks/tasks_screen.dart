import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
//import 'package:table_calendar/table_calendar.dart';
//import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/services.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:todo/models/task_models.dart';
import 'package:todo/network/firebase/firebase_functions.dart';
import 'package:todo/tasks/task_item.dart';


class TasksListTab extends StatefulWidget {
   TasksListTab({Key? key}) : super(key: key);

  @override
  State<TasksListTab> createState() => _TasksListTabState();
}

class _TasksListTabState extends State<TasksListTab> {
  var selectedValue = DateTime.now();
  DateTime selectedDate=DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Do List",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 356)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              selectedDate=date;
              setState(() {

              });
            },
            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor: Colors.teal[200],
            activeDayColor: Colors.black,
            activeBackgroundDayColor: Colors.redAccent[100],
            dotsColor: Color(0xFF333A47),
            locale: 'en',
          ),
          SizedBox(height: 15,),
          StreamBuilder(stream: FirebaseFunctions.getTasks(selectedDate),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            if(snapshot.hasError){
              return Text("Something went wrong");
            }

            var tasks= snapshot.data?.docs.map((e) => e.data()).toList()??[];
            if(tasks.isEmpty){
             return Center(child: Text("No Tasks"),);
            }
            return Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return TaskItem(taskModel: tasks[index],);
            },
            itemCount: tasks.length,
            ));
          },
          ),
          // DatePicker(
          //
          //   DateTime.now(),
          //   initialSelectedDate: DateTime.now().subtract(Duration(days: 365)),
          //   selectionColor: Colors.black,
          //   selectedTextColor: Colors.white,
          //
          //   onDateChange: (date) {
          //     // New date selected
          //     setState(() {
          //       selectedValue = date;
          //     });
          //   },
          // ),
        ],
      )

    );
  }
}
