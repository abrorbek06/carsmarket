import 'package:chinamotorscar/resourses/app_colors.dart';
import 'package:chinamotorscar/resourses/app_styles.dart';
import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  late final TextEditingController realCostCtrl,
      initialPaymentCtrl,
      yearCtrl,
      monthCtrl,
      monthPriceCtrl,
      GeneralPriceCtrl,
      startPriceCtrl;

  @override
  void initState() {
    realCostCtrl = TextEditingController();
    initialPaymentCtrl = TextEditingController();
    yearCtrl = TextEditingController();
    monthCtrl = TextEditingController();
    monthPriceCtrl = TextEditingController();
    GeneralPriceCtrl = TextEditingController();
    startPriceCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    realCostCtrl.dispose();
    initialPaymentCtrl.dispose();
    yearCtrl.dispose();
    monthCtrl.dispose();
    monthPriceCtrl.dispose();
    GeneralPriceCtrl.dispose();
    startPriceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 39),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DecoratedTextField2(
                label: "Tan narx",
                controller: realCostCtrl,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DecoratedTextField(
                    label: "Bosh to'lov %",
                    controller: startPriceCtrl,
                    width: 87,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        int start = int.parse(value);
                        int realCost = int.parse(realCostCtrl.text);
                        initialPaymentCtrl.text = (realCost / 100 * start).toString().priceFormat;
                      }
                    },
                  ),
                  DecoratedTextField(
                    label: "Yillik to'lov %",
                    controller: yearCtrl,
                    width: 87,
                  ),
                  DecoratedTextField(
                    label: "Oy",
                    controller: monthCtrl,
                    width: 87,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        int month = int.parse(value);
                        int start = int.parse(startPriceCtrl.text);
                        int realCost = int.parse(realCostCtrl.text);
                        int years = int.parse(yearCtrl.text);
                        var balancePrice = (realCost / 100 * (100 - start)); // qoldiq summa 177 100 000
                        var generalPrice = balancePrice + ((balancePrice / 100 * years) * (month / 12)); // 177 100 000 + 26% * 1 = 223 146 000
                        GeneralPriceCtrl.text = (balancePrice + ((balancePrice / 100 * years) * (month / 12))).toStringAsFixed(2).priceFormat;
                        monthPriceCtrl.text = (generalPrice / month).toStringAsFixed(2).priceFormat; // 223 146 000 / 12 = 18 595 500
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 65),
              DecoratedTextField2(
                label: "Oylik to'lov",
                controller: monthPriceCtrl,
                readOnly: true,
              ),
              const SizedBox(height: 20),
              DecoratedTextField2(
                label: "Boshlang'ich narx",
                controller: initialPaymentCtrl,
                width: double.infinity,
                readOnly: true,
              ),
              const SizedBox(height: 20),
              DecoratedTextField2(
                label: "Umumiy narx",
                controller: GeneralPriceCtrl,
                width: double.infinity,
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DecoratedTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final double? width;
  final void Function(String)? onChanged;
  final bool readOnly;

  const DecoratedTextField({
    required this.label,
    required this.controller,
    this.readOnly = false,
    this.onChanged,
    this.width,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.calculateTitleStyle(),
        ),
        const SizedBox(height: 4),
        Container(
          width: width ?? double.maxFinite,
          height: 50,
          decoration: const BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: AppColors.white,
                offset: Offset(-4, -4),
                spreadRadius: 1,
              ),
              BoxShadow(
                blurRadius: 4,
                color: AppColors.greyBlack,
                offset: Offset(4, 2),
                spreadRadius: 1,
              ),
            ],
          ),
          child: TextField(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            controller: controller,
            onChanged: onChanged,
            readOnly: readOnly,
            style: AppStyles.carsTitleStyle().copyWith(color: AppColors.calculateNumber),
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }
}
class DecoratedTextField2 extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final double? width;
  final void Function(String)? onChanged;
  final bool readOnly;

  const DecoratedTextField2({
    required this.label,
    required this.controller,
    this.readOnly = false,
    this.onChanged,
    this.width,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.calculateTitleStyle(),
        ),
        const SizedBox(height: 8),
        Container(
          width: width ?? double.maxFinite,
          height: 50,
          decoration: const BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: AppColors.white,
                offset: Offset(-4, -4),
                spreadRadius: 1,
              ),
              BoxShadow(
                blurRadius: 4,
                color: AppColors.greyBlack,
                offset: Offset(4, 2),
                spreadRadius: 1,
              ),
            ],
          ),
          child: TextField(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.end,
            controller: controller,
            onChanged: onChanged,
            readOnly: readOnly,
            style: AppStyles.carsTitleStyle().copyWith(color: AppColors.calculateNumber),
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }
}


extension StringExtensions on String {
  String? get extractFirstNumbers {
    final match = RegExp(r'^\d+').firstMatch(this);
    return match?.group(0);
  }

  String get priceFormat {
    bool hasDecimalPoint = contains('.');

    List<String> parts = split('.');

    String integralPart = parts[0];

    String formattedIntegral = _formatWithThousandSeparators(integralPart);

    if (hasDecimalPoint) {
      String fractionalPart = parts.length > 1 ? parts[1] : '';
      return '$formattedIntegral.$fractionalPart';
    } else {
      return formattedIntegral;
    }
  }

  String _formatWithThousandSeparators(String numberString) {
    String value = '';
    int index = 0;
    final regexp = RegExp(r'\d');

    numberString.split('').reversed.forEach((element) {
      if (regexp.hasMatch(element)) {
        if (index == 3) {
          value = ' $value';
          index = 0;
        }
        value = '$element$value';
        index++;
      }
    });
    return value;
  }
}
