import 'package:chinamotorscar/resourses/app_styles.dart';
import 'package:chinamotorscar/screens/body/part2/electromobel.dart';
import 'package:flutter/material.dart';

import '../../resourses/app_colors.dart';
import '../../resourses/part_data.dart';
import '../../screens/body/part2/question_screen2.dart';

class WPart2Quiz extends StatefulWidget {
  final Part2QData part2qData;

  const WPart2Quiz({Key? key, required this.part2qData}) : super(key: key);

  @override
  State<WPart2Quiz> createState() => _WPart2QuizState();
}

class _WPart2QuizState extends State<WPart2Quiz> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => widget.part2qData.carType == 1 ? QuizScreen2(
              part2qData: widget.part2qData,
            ) : ElectroCarScreen(
              part2qData: widget.part2qData,
            ),
          ),
        );
      },
      child: Container(
        width: 157,
        height: 157,
        decoration: BoxDecoration(
            color: AppColors.carsbg, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.height * 1,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.part2qData.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.part2qData.title,
                    style: AppStyles.carsTitleStyle().copyWith(fontSize: widget.part2qData.title.length >= 14 ? 12: 16),
                  ),
                  Text(
                    widget.part2qData.price,
                    style: AppStyles.carsPriceStyle().copyWith(fontSize: widget.part2qData.price.length >= 16 ? 13 : 16),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
