import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_zaag/controllers/list_controller.dart';
import 'package:test_project_zaag/widgets/custom_card.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({Key? key}) : super(key: key);

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  final listController = Get.find<ListController>();
  bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listController.getDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => listController.dataList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listController.dataList.length,
                  itemBuilder: (ctx, i) => CustomCard(
                        image: listController.dataList[i].owner!.profileImage,
                        name: listController.dataList[i].owner!.name,
                        description: listController.dataList[i].description,
                        isSelected: listController.favList.any((element) =>
                            element.id == listController.dataList[i].id),
                        onPressed: () {
                          listController.favList
                                  .contains(listController.dataList[i])
                              ? listController.favList
                                  .remove(listController.dataList[i])
                              : listController.favList
                                  .add(listController.dataList[i]);
                          setState(() {});
                        },
                      )),
            ),
    ));
  }
}
