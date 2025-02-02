import 'package:chinamotorscar/widgets/wparts/wpart3Quiz.dart';
import 'package:flutter/material.dart';

import '../../../resourses/app_colors.dart';
import '../../../resourses/part_data.dart';

class PartScreen3 extends StatefulWidget {
  // final PartData partData;

  const PartScreen3({Key? key}) : super(key: key);

  @override
  State<PartScreen3> createState() => _PartScreen3State();
}

class _PartScreen3State extends State<PartScreen3> {
  int page = 0;
  int currentColorIndex = -1;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
                    height: MediaQuery.of(context).size.height * 0.86,
                    child: _getProducts(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getProducts() => GridView(
    physics: const BouncingScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 20,
    ),
    children: List.generate(
      part3QData.length,
          (index) => WPart3Quiz(
        part3qData: part3QData[index],
      ),
    ),
  );
}
