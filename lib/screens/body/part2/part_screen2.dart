import 'package:flutter/material.dart';

import '../../../resourses/app_colors.dart';
import '../../../resourses/part_data.dart';
import '../../../widgets/wparts/wpart2Quiz.dart';

class PartScreen2 extends StatefulWidget {
  // final PartData partData;

  const PartScreen2({Key? key}) : super(key: key);

  @override
  State<PartScreen2> createState() => _PartScreen2State();
}

class _PartScreen2State extends State<PartScreen2> {
  int page = 0;
  int currentColorIndex = -1;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 10,
      child: Scaffold(
        backgroundColor: AppColors.white,
       // appBar: AppBar(
       //    backgroundColor: AppColors.white,
       //    bottom: TabBar(
       //      isScrollable: true,
       //      dividerColor: Colors.transparent,
       //      unselectedLabelColor: AppColors.grey,
       //      indicatorWeight: 0.1,
       //      labelPadding: const EdgeInsets.all(8),
       //      tabAlignment: TabAlignment.center,
       //      padding: const EdgeInsets.only(left: 10, right: 10),
       //      unselectedLabelStyle: TextStyle(color: AppColors.grey),
       //      tabs: <Widget>[
       //        _tariflarW(title: "JAC"),
       //        _tariflarW(title: "BYD"),
       //        _tariflarW(title: "FAW"),
       //        _tariflarW(title: "GAZEL"),
       //      ],
       //    ),
       //  ),
        body: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.83,
                      child: _getProducts(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // _tariflarW({required String title}) => Text(
  //   title,
  // );

  _getProducts() => GridView(
    physics: const BouncingScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 20,
    ),
    children: List.generate(
      part2QData.length,
          (index) => WPart2Quiz(
            part2qData: part2QData[index],
      ),
    ),
  );
}
