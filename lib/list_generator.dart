import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:RaceHub/event.dart';
import 'package:RaceHub/series.dart';
import 'package:RaceHub/widgets/create_list_item.dart';
import 'package:RaceHub/widgets/create_list_label.dart';

class list_generator extends StatelessWidget {
  List<int> seriesNums = [];
  List<Series> seriesList = [];
  String listName = 'Undefined';
  Color listColor = Colors.black;
  Image seriesLogo;
  Image seriesImage;
  bool addHeader;
  BuildContext context;

  list_generator(this.seriesNums, this.listName, this.listColor,
      this.seriesLogo, this.seriesImage, this.addHeader, this.context,
      {Key? key})
      : super(key: key);

  Future<List<Widget>> getEvents() async {
    final response = await rootBundle.loadString('json/event_list.json');
    final json = jsonDecode(response);

    for (var index in seriesNums) {
      final newSeries = Series.fromJson(json[index]);
      seriesList.add(newSeries);
    }

    DateTime eventStartTime;
    DateTime eventEndTime;
    Color eventColor;

    List<Widget> widgetList = []; //Holds final list

    List<Event_Object> upcomingEvents = [];
    List<Event_Object> pastEvents = [];
    List<Event_Object> happeningNowEvents = [];

    for (var series_obj in seriesList) {
      for (var event_obj in series_obj.Events) {
        eventStartTime = DateTime.parse(event_obj.EventStart);
        eventEndTime = DateTime.parse(event_obj.EventEnd);
        eventColor = Color(int.parse(event_obj.EventColorCode));

        if (eventEndTime.difference(DateTime.now()).isNegative) {
          pastEvents.add(event_obj);
        } else if (eventStartTime.difference(DateTime.now()).isNegative && !eventEndTime.difference(DateTime.now()).isNegative) {
          happeningNowEvents.add(event_obj);
        } else {
          upcomingEvents.add(event_obj);
        }
      }
    }

    if (addHeader) {
      widgetList.add(Stack(
        children: [
          seriesImage,
          _buildGradient(),
          Positioned(
            left: 20,
            bottom: 15,
            width: 180,
            child: seriesLogo,
          ),
        ],
      ));
    }

    //Sorting lists before adding to widgetList
    pastEvents.sort(((a, b) {
      return DateTime.parse(b.EventStart)
          .compareTo(DateTime.parse(a.EventStart));
    }));
    upcomingEvents.sort(((a, b) {
      return DateTime.parse(a.EventStart)
          .compareTo(DateTime.parse(b.EventStart));
    }));
    happeningNowEvents.sort(((a, b) {
      return DateTime.parse(b.EventStart)
          .compareTo(DateTime.parse(a.EventStart));
    }));

    //Adding happeningNowEvents & label to widgetList IF NOT EMPTY
    if (happeningNowEvents.isNotEmpty) {
      widgetList.add(create_list_label(label: "Happening Now:"));
      for (var index in happeningNowEvents) {
        widgetList.add(
          create_list_item(
            event: index,
            name: index.EventName,
            image: Image.asset("images/${index.EventLogo}", width: 60, height: 80,),
            dateCurrent: DateTime.now(),
            dateEventStart: DateTime.parse(index.EventStart),
            dateEventEnd: DateTime.parse(index.EventEnd),
            color: Color(int.parse(index.EventColorCode)),
            itemContext: context,
          ),
        );
      }
    }

    //Adding upcomingEvents & label to widgetList
    widgetList.add(create_list_label(label: "Upcoming:"));
    for (var index in upcomingEvents) {
      widgetList.add(
        create_list_item(
          event: index,
          name: index.EventName,
          image: Image.asset("images/${index.EventLogo}", width: 60, height: 80),
          dateCurrent: DateTime.now(),
          dateEventStart: DateTime.parse(index.EventStart),
          dateEventEnd: DateTime.parse(index.EventEnd),
          color: Color(int.parse(index.EventColorCode)),
          itemContext: context,
        ),
      );
    }

    //Adding pastEvents & label to widgetList
    widgetList.add(create_list_label(label: "Past:"));
    for (var index in pastEvents) {
      widgetList.add(
        create_list_item(
          event: index,
          name: index.EventName,
          image: Image.asset("images/${index.EventLogo}", width: 60, height: 80),
          dateCurrent: DateTime.now(),
          dateEventStart: DateTime.parse(index.EventStart),
          dateEventEnd: DateTime.parse(index.EventEnd),
          color: Color(int.parse(index.EventColorCode)),
          itemContext: context,
        ),
      );
    }

    return Future.delayed(Duration(seconds: 1), () {
      return widgetList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<Widget>>(
          builder: (ctx, snapshot) {
            // Checking if future is resolved or not
            if (snapshot.connectionState == ConnectionState.done) {
              // If we got an error
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: TextStyle(fontSize: 18),
                  ),
                );

                // if we got our data
              } else if (snapshot.hasData) {
                // Extracting data from snapshot object
                final data = snapshot.data as List<Widget>;
                return Center(child: ListView(children: data));
              }
            }

            // Displaying LoadingSpinner to indicate waiting state
            return Center(
              child: CircularProgressIndicator(
                color: listColor,
              ),
            );
          },

          // Future that needs to be resolved
          // in order to display something on the Canvas
          future: getEvents(),
        ),
      ),
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.white.withOpacity(1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.99],
          ),
        ),
      ),
    );
  }
}
