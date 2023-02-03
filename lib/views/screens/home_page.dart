import 'package:astrology_app/controllers/astrology_controller.dart';
import 'package:astrology_app/utils/check_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helpers/api_helper.dart';
import '../../models/sunSign.dart';
import '../../utils/change_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SunSign> search = [];
  bool isCollapsed = true;
  @override
  void initState() {
    super.initState();
    search = sunSignList;
  }

  final AstrologyController astrologyController =
      Get.put(AstrologyController());

  @override
  Widget build(BuildContext context) {
    ApiHelper.apiHelper.getAstrologyData(sunShine: "Aries", day: "today");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "What is your Sun sign ?",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          changeThem(astrologyController),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                isCollapsed: isCollapsed,
                prefixIcon: const Icon(Icons.search),
                counter: (search.length != sunSignList.length)
                    ? Text("${search.length}/${sunSignList.length}")
                    : null,
                label: const Text("Search"),
                hintText: "Search your sun sign",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onTap: () {
                isCollapsed = false;
                setState(() {});
              },
              onSubmitted: (_) {
                isCollapsed = true;
                setState(() {});
              },
              onChanged: (val) {
                search = [];
                if (val.isEmpty) {
                  search = sunSignList;
                } else {
                  search = sunSignList
                      .where((element) => element.name
                          .toLowerCase()
                          .contains(val.toLowerCase()))
                      .toList();
                }
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: search.length,
              itemBuilder: (context, i) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () async {
                      bool connectivity = await checkConnectivityNow();
                      if (connectivity) {
                        astrologyController.addSunShine(
                            sunSign: search[i].name, image: search[i].image);
                        Get.toNamed("/details_page");
                      } else {
                        noNetworkSnackBar();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            search[i].image,
                            height: 70,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            search[i].name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.merge(const TextStyle(fontSize: 18)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
