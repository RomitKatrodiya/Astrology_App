import 'package:astrology_app/models/astrology.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/astrology_controller.dart';
import '../../helpers/api_helper.dart';
import '../../utils/change_theme.dart';
import '../../utils/check_connectivity.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final AstrologyController astrologyController = Get.find();

  String day = "today";
  TextStyle? textStyle;
  TextStyle? textStyle1;
  TextStyle? textStyle2;

  @override
  Widget build(BuildContext context) {
    textStyle = Theme.of(context).textTheme.bodyLarge?.merge(
          const TextStyle(),
        );
    textStyle1 = Theme.of(context).textTheme.titleMedium?.merge(
          TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          ),
        );
    textStyle2 = Theme.of(context).textTheme.titleLarge?.merge(
          TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
          ),
        );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(
          () => Text(
            "${astrologyController.selectedSunSign}",
            style: Theme.of(context).textTheme.titleLarge?.merge(
                  TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          ),
        ),
        actions: [
          changeThem(astrologyController),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Obx(
              () => Image.asset(
                "${astrologyController.selectedImage}",
                height: 120,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              icon: const Icon(Icons.calendar_month),
              value: day,
              items: const [
                DropdownMenuItem(value: "yesterday", child: Text("Yesterday")),
                DropdownMenuItem(value: "today", child: Text("Today")),
                DropdownMenuItem(value: "tomorrow", child: Text("Tomorrow")),
              ],
              onChanged: (val) async {
                bool connectivity = await checkConnectivityNow();
                if (connectivity) {
                  day = val!;
                  setState(() {});
                } else {
                  noNetworkSnackBar();
                }
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                future: ApiHelper.apiHelper.getAstrologyData(
                    sunShine: astrologyController.selectedSunSign.value,
                    day: day),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Astrology astrology = snapshot.data;
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Text(astrology.currentDate, style: textStyle2),
                            const SizedBox(height: 20),
                            row("Color", astrology.color),
                            const SizedBox(height: 5),
                            row("Lucky Number", astrology.luckyNumber),
                            const SizedBox(height: 5),
                            row("Lucky Time", astrology.luckyTime),
                            const SizedBox(height: 5),
                            row("Mood", astrology.mood),
                            const SizedBox(height: 20),
                            Text(astrology.description, style: textStyle),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  row(title, val) {
    return Row(
      children: [
        Text("$title : ", style: textStyle1),
        Text(val, style: textStyle),
      ],
    );
  }
}
