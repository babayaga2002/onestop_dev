import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:onestop_dev/globals.dart';
import 'package:onestop_dev/globals/my_colors.dart';
import 'package:onestop_dev/globals/my_fonts.dart';
import 'package:onestop_dev/pages/timetable/ApiCallingTimetable.dart';
import 'package:onestop_dev/stores/login_store.dart';
import 'package:onestop_dev/stores/mapbox_store.dart';
import 'package:onestop_dev/stores/timetable_store.dart';
import 'package:onestop_dev/widgets/home/date_course.dart';
import 'package:onestop_dev/widgets/home/quick_links.dart';
import 'package:onestop_dev/widgets/mapBox.dart';
import 'package:onestop_dev/models/timetable.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../functions/timetable/Functions.dart';

double lat = userlat;
double long = userlong;

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;
  String sel = '';
  Future<RegisteredCourses>? timetable;

  void initState() {
    super.initState();
    print("Init state");
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        context.read<MapBoxStore>().checkTravelPage(false);
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              MapBox(),
              SizedBox(
                height: 10,
              ),
              Observer(builder: (BuildContext context) {
                var timetableStore = context.read<TimetableStore>();
                if (timetableStore.coursesLoaded) {
                  return DateCourse();
                }
                if (timetableStore.coursesError) {
                  return Text("Error",style: MyFonts.w300.setColor(kWhite),);
                }
                    return Shimmer.fromColors(
                        child: Container(
                          decoration: BoxDecoration(
                            color: kHomeTile,
                            borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          height: 110,
                          width: double.infinity,
                        ),
                        period: Duration(seconds: 1),
                        baseColor: kHomeTile,
                        highlightColor: lGrey);
              }),
              SizedBox(
                height: 10,
              ),
              QuickLinks(),
              SizedBox(
                height: 10,
              ),
              // Services(),
              // SizedBox(
              //   height: 10,
              // ),
            ],
          ),
        );
      }
    );
  }
}
