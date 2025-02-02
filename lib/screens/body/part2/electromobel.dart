import 'package:chinamotorscar/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resourses/app_colors.dart';
import '../../../resourses/app_styles.dart';
import '../../../resourses/part_data.dart';

class ElectroCarScreen extends StatefulWidget {
  final Part2QData part2qData;

  const ElectroCarScreen({super.key, required this.part2qData});

  @override
  State<ElectroCarScreen> createState() => _ElectroCarScreenState();
}

class _ElectroCarScreenState extends State<ElectroCarScreen> {
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
                  color: AppColors.carsScreenBg,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  image: DecorationImage(
                    image: AssetImage(widget.part2qData.image),
                    fit: BoxFit.cover,
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
                    widget.part2qData.title,
                    style: AppStyles.titleStyle(),
                  ),
                  Text(
                    widget.part2qData.about,
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _mainData(
                        title: widget.part2qData.seats,
                        image: Assets.iconsSeats,
                      ),
                      _mainData(
                        title: widget.part2qData.horse,
                        image: Assets.iconsHorse,
                      ),
                      _mainData(
                        title: widget.part2qData.yurish_masofasi,
                        image: Assets.IconsBattery,
                      ),
                      _mainData(
                        title: widget.part2qData.maxspeed,
                        image: Assets.iconsSpead,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Texnik Parametrlari",
                        style: AppStyles.carsTitleStyle(),
                      ),
                      const SizedBox(height: 8),
                      _malumotlar(Assets.iconsKuzof,
                          "Kuzof: ${widget.part2qData.kuzof}"),
                      _malumotlar(Assets.iconsYoqilgi_sari,
                          "Elektr sarfi: ${widget.part2qData.elektr_sarfi}"),
                      const SizedBox(height: 16),
                      Text(
                        "O'lchamlari",
                        style: AppStyles.carsTitleStyle(),
                      ),
                      const SizedBox(height: 4),
                      _malumotlar(Assets.iconsUzunlik,
                          "Uzunligi: ${widget.part2qData.uzunligi}"),
                      _malumotlar(Assets.iconsKengligi,
                          "Kengligi: ${widget.part2qData.kengligi}"),
                      _malumotlar(Assets.iconsGildirak,
                          "G'ildirak bazasi: ${widget.part2qData.gildirak_bazasi}"),
                      _malumotlar(Assets.iconsShina,
                          "Shinalar o'lchami: ${widget.part2qData.gildirak_olchami}"),
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
                      widget.part2qData.price,
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
