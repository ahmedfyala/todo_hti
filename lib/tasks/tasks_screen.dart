import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/network/firebase/firebase_functions.dart';
import 'package:todo/tasks/task_item.dart';

class TasksListTab extends StatefulWidget {
  const TasksListTab({Key? key}) : super(key: key);

  @override
  State<TasksListTab> createState() => _TasksListTabState();
}

class _TasksListTabState extends State<TasksListTab> {
  var selectedValue = DateTime.now();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.todo,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CalendarTimeline(
              initialDate: selectedDate,
              firstDate: DateTime.now().subtract(const Duration(days: 356)),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              onDateSelected: (date) {
                selectedDate = date;
                setState(() {});
              },
              leftMargin: 20,
              monthColor: Colors.blueGrey,
              dayColor: Colors.teal[200],
              activeDayColor: Colors.black,
              activeBackgroundDayColor: Colors.redAccent[100],
              dotsColor: const Color(0xFF333A47),
              locale: 'en',
            ),
            const SizedBox(
              height: 15,
            ),
            StreamBuilder(
              stream: FirebaseFunctions.getTasks(selectedDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                var tasks =
                    snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                if (tasks.isEmpty) {
                  return Center(
                    child: Text(AppLocalizations.of(context)!.notasks),
                  );
                }
                return Expanded(
                    child: ListView.builder(
                  itemBuilder: (context, index) {
                    return TaskItem(
                      taskModel: tasks[index],
                    );
                  },
                  itemCount: tasks.length,
                ));
              },
            ),
          ],
        ));
  }
}
