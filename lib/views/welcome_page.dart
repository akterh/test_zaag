import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_zaag/views/item_list_page.dart';

import '../controllers/list_controller.dart';
import '../widgets/custom_card.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  final listController = Get.find<ListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Padding(
            padding: const EdgeInsets.all(16.0),
            child: listController.favList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Hey WelCome Back",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset('images/image.png'))
                          ],
                        ),
                      ),
                      const Text("No Items To Show Here"),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => const ItemListPage()));
                          },
                          child: Text('Add SOme Items'))
                    ],
                  )
                : ListView.builder(
                    itemCount: listController.favList.length,
                    itemBuilder: (ctx, i) => CustomCard(
                      image: listController.favList[i].owner!.profileImage,
                      name: listController.favList[i].owner!.name,
                      description: listController.favList[i].description,
                      isSelected: true,
                      onPressed: () {
                        listController.favList
                            .add(listController.favList[i]);
                      },
                    )),
          )),
    );
  }
}
