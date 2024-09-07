import 'package:althhimer_app/features/firebaseUtils.dart';
import 'package:althhimer_app/features/today/widgets/task_item_widget.dart';
import 'package:althhimer_app/models/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
class TodayView extends StatelessWidget {
  DateTime focusTime = DateTime.now() ;
   TodayView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Stack(
            alignment: const Alignment(0,2.5),
            clipBehavior: Clip.none,
            children: [
              Container(
                width: mediaQuery.width,
                height: mediaQuery.height * 0.2,
                color: theme.primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 60,
                ),
                child: Text(
                  "Tasks",
                   style: theme.textTheme.titleLarge,
                ),
              ),
              EasyInfiniteDateTimeLine(
                firstDate: DateTime(2023),
                focusDate: focusTime,
                lastDate: DateTime(2025),
                showTimelineHeader: false,
                timeLineProps: const EasyTimeLineProps(
                  separatorPadding: 10 ,
                ),
                dayProps: EasyDayProps(
                  inactiveDayStyle:DayStyle (
                    dayNumStyle: theme.textTheme.bodySmall,
                    dayStrStyle: theme.textTheme.bodySmall,
                    monthStrStyle: theme.textTheme.bodySmall,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  todayStyle: const DayStyle(
                    decoration: BoxDecoration (
                      color: Colors.white,
                    ),
                  ),
                  activeDayStyle: DayStyle(
                      dayNumStyle: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.primaryColor,
                      ),
                      dayStrStyle: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.primaryColor,
                      ),
                      monthStrStyle:theme.textTheme.bodyMedium?.copyWith(
                        color: theme.primaryColor,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white ,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black,
                          )

                      )
                  ),
                  height: 100 ,
                ),

                onDateChange: (selectedDate) {
                  //setState(() {
                  focusTime = selectedDate;
                  //});
                },
              ),
            ],
          ),
        ),
        StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirebaseUtils().getStreamDataFromFireStore(focusTime),
            builder: (context , Snapshot) {
             if  (Snapshot.hasError) {
               return const Column(
                 children: [
                   Text(
                     "something went wrong" ,
                   ),
                   Icon(Icons.refresh),
                 ],
               );
             }
             if (Snapshot.connectionState== ConnectionState.waiting){
               return const Center(child: CircularProgressIndicator());
             }

            var tasksList = Snapshot.data?.docs .map((e) => e.data()).toList()?? [] ;
             return Expanded(

               child: ListView.builder(
                 padding: EdgeInsets.zero,
                 itemBuilder: (context,index) =>
                     TaskItemWidget(taskModel: tasksList[index]) ,
                 itemCount: tasksList.length,
               ),
             );
         },
        ),


       ],
       );
      }
     }
