import 'package:chinamotorscar/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resourses/app_colors.dart';
import '../../../resourses/app_styles.dart';
import '../../../resourses/part_data.dart';

class QuizScreen3 extends StatefulWidget {
  final Part3QData part3qData;

  const QuizScreen3({super.key, required this.part3qData});

  @override
  State<QuizScreen3> createState() => _QuizScreen3State();
}

class _QuizScreen3State extends State<QuizScreen3> {
  int page = 0;
  int currentColorIndex = -1;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _appBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Container(
                width: double.infinity,
                height: 230,
                decoration: BoxDecoration(
                  // color: AppColors.carsScreenBg,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  image: DecorationImage(
                    image: AssetImage(widget.part3qData.image),
                  fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.part3qData.title,
                    style: AppStyles.titleStyle(),
                  ),
                  Text(
                    widget.part3qData.about,
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _mainData(title: widget.part3qData.yukvazni, image: Assets.iconsGildirak),
                      _mainData(title: widget.part3qData.uzatishQutisiModeli, image: Assets.iconsGildirak),
                      _mainData(title: widget.part3qData.gildirakVaShinaOlchami, image: Assets.iconsGildirak),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _malumotlar(Assets.iconsBalandlik, "O'lchamlar: ${widget.part3qData.sizes}"),
                      _malumotlar(Assets.iconsOzVazni, "O'z vazni: ${widget.part3qData.ozvazni}"),
                      _malumotlar(Assets.iconsYukVazni, "Yuk ko'tarish vazni: ${widget.part3qData.yukvazni}"),
                      _malumotlar(Assets.iconsDvigatel, "Mator madeli: ${widget.part3qData.dvigitelModel}"),
                      _malumotlar(Assets.iconsMator_xajmi, "Mator xajmi: ${widget.part3qData.dvigitelHajmi}"),
                      _malumotlar(Assets.iconsYoqilgi_bak_hajmi, "Yoqilg'i bak: ${widget.part3qData.yoqilgiBak}"),
                      _malumotlar(Assets.iconsUzatishQutisi, "Uzatma quti madeli: ${widget.part3qData.uzatishQutisiModeli}"),
                      // _malumotlar(Assets.iconsGildirak, widget.part3qData.orqaMost),
                      _malumotlar(Assets.iconsGildirak, "Shina hajmi: ${widget.part3qData.gildirakVaShinaOlchami}"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: const BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Center(
                        child: Text(
                          widget.part3qData.price,
                          style: AppStyles.splashtitle(),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _appBar() => AppBar(
    centerTitle: true,
    backgroundColor: AppColors.white,
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: AppColors.black,
      ),
    ),
    elevation: 0,
  );

  _mainData({required title, required image}) => Column(
    children: [
      Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.carsbg),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: SizedBox(
            width: 30,
            child: SvgPicture.asset(image),
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        title,
        style: AppStyles.mainData(),
      )
    ],
  );

  _malumotlar(image, title) => Column(
    children: [
      const SizedBox(height: 8),
      Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: SvgPicture.asset(image),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: AppStyles.mainData(),
          ),
        ],
      ),
    ],
  );
}
