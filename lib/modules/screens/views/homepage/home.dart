import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'model/json/model.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                          // image: DecorationImage(
                          //   image: AssetImage(
                          //     "",
                          //   ),
                          // ),
                          ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    const Text(
                      "Solar System",
                      style: TextStyle(
                        fontFamily: 'appbar',
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 15,
                child: FutureBuilder(
                  future: rootBundle.loadString(
                    "planet.json",
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      List decodedData = jsonDecode(snapshot.data!);
                      List<AllData> allData = decodedData
                          .map((e) => AllData.fromjson(data: e))
                          .toList();
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: allData.length,
                        itemBuilder: (context, i) => Column(
                          children: [
                            const SizedBox(
                              height: 200,
                            ),
                            Container(
                              padding: EdgeInsets.zero,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 450,
                                    width: 500,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: const Alignment(
                                            -0.6,
                                            -0.5,
                                          ),
                                          child: Container(
                                            alignment: Alignment.bottomCenter,
                                            height: 350,
                                            width: 300,
                                            child: Container(
                                              padding: const EdgeInsets.all(
                                                10,
                                              ),
                                              height: 300,
                                              width: 350,
                                              decoration: BoxDecoration(
                                                color: Color(int.parse(
                                                        allData[i].color))
                                                    .withOpacity(0.8),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 80,
                                                  ),
                                                  Align(
                                                    alignment: const Alignment(
                                                        -0.8, 0),
                                                    child: Text(allData[i].name,
                                                        style: const TextStyle(
                                                          fontFamily: "appbar",
                                                          fontSize: 30,
                                                        )),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    allData[i].home,
                                                    style: const TextStyle(
                                                      fontFamily: "content",
                                                      fontSize: 15,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const Alignment(
                                            -0.8,
                                            -5.8,
                                          ),
                                          child: Transform.rotate(
                                            angle: 50,
                                            child: Container(
                                              height: 350,
                                              width: 350,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    allData[i].image,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const Alignment(
                                            -0.4,
                                            0.88,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.toNamed(
                                                '/Detail',
                                              );

                                              // Navigator.pushNamed(
                                              //     context, 'Detail',
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 4,
                                                ),
                                                color: Color(int.parse(
                                                    allData[i].color)),
                                              ),
                                              child: const Icon(
                                                Icons.arrow_forward_ios,
                                                size: 35,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
