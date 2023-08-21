import 'package:get/get.dart';
import 'package:test_project_zaag/constants/constant.dart';
import 'package:test_project_zaag/utils/api_client.dart';

import '../model/data.dart';

class ListController extends GetxController {
  final dataList = <ListElement>[].obs;
  final favList = <ListElement>[].obs;

  void getDataList() async {
    var res = await HttpClient.get(AppConstants.baseUrl);
    var decodedRes = Data.fromJson(res);
    dataList.value = decodedRes.lists!;
  }
}
