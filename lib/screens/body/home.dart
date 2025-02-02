import 'package:chinamotorscar/resourses/app_colors.dart';
import 'package:chinamotorscar/resourses/app_styles.dart';
import 'package:chinamotorscar/screens/body/calculate.dart';
import 'package:chinamotorscar/screens/body/part2/part_screen2.dart';
import 'package:chinamotorscar/screens/body/part3/part_screen3.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexx = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("China Motors", style: AppStyles.AppBar()),
              // const SizedBox(width: 70),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Calculate(),
                    ),
                  );
                },
                icon: const Icon(Icons.calculate_rounded),
              ),
            ],
          ),
          bottom: TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            labelColor: AppColors.black,
            indicatorColor: AppColors.black,
            unselectedLabelColor: AppColors.grey,
            indicatorWeight: 1,
            labelPadding: const EdgeInsets.all(8),
            tabAlignment: TabAlignment.center,
            padding: const EdgeInsets.only(left: 10, right: 10),
            unselectedLabelStyle: const TextStyle(color: AppColors.grey),
            tabs: <Widget>[
              _tariflarW(title: "Yengil"),
              _tariflarW(title: "Maxsus texnika"),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            PartScreen2(),
            PartScreen3(),
          ],
        ),
      ),
    );
  }

  _tariflarW({required String title}) => Text(
        title,
      );
}
