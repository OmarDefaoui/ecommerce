import 'package:get/get.dart';

class TestController extends GetxController {
  var list = <String>[].obs;
  List<String> list1 = [];

  @override
  void onInit() {
    super.onInit();
    fetchList();
  }

  // GetX<TestController>(builder: (controller) {
  //       return Text(controller.list.toString());
  //     })
  void fetchList() async {
    await Future.delayed(const Duration(seconds: 2));
    var productResult = ['a', 'b', 'c'];

    list.value = productResult;
  }

  // GetBuilder<TestController>(builder: (controller) {
  //       return Text(controller.list.toString());
  //     })
  void fetchList1() async {
    await Future.delayed(const Duration(seconds: 2));
    var productResult = ['a', 'b', 'c'];

    list1 = productResult;
    update();
  }

  // final testController = Get.put(TestController());
  // Obx(() {
  //       return Text(controller.list.toString());
  //     })
  void fetchList2() async {
    await Future.delayed(const Duration(seconds: 2));
    var productResult = ['a', 'b', 'c'];

    list1 = productResult;
    update();
  }
}
