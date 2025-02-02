import 'package:chinamotorscar/resourses/app_styles.dart';
import 'package:chinamotorscar/screens/body/part3/question_screen3.dart';
import 'package:flutter/material.dart';

import '../../resourses/app_colors.dart';
import '../../resourses/part_data.dart';

class WPart3Quiz extends StatefulWidget {
  final Part3QData part3qData;

  const WPart3Quiz({Key? key, required this.part3qData}) : super(key: key);

  @override
  State<WPart3Quiz> createState() => _WPart3QuizState();
}

class _WPart3QuizState extends State<WPart3Quiz> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => QuizScreen3(
              part3qData: widget.part3qData,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 147,
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.part3qData.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height:4),
              Text(
                widget.part3qData.title,
                style: AppStyles.carsTitleStyle().copyWith(fontSize: 14),
              ),
              Text(
                widget.part3qData.price,
                style: AppStyles.carsPriceStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
