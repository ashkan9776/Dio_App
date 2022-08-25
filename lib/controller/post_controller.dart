import 'package:dio_app/model/post_model.dart';
import 'package:dio_app/services/dio_service.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class PostController extends GetxController {
  RxList<PostModel> posts = RxList();
  RxBool isLoading = true.obs;
  RxBool isInternetConnection = true.obs;
  var url = "https://jsonplaceholder.typicode.com/posts";

  getPosts() async {
    isInternetConnectionFunc();
    isLoading.value = true;
    var response = await DioService().getMethod(url);

    if (response.statusCode == 200) {
      response.data.forEach(
        (element) {
          posts.add(PostModel.fromJson(element));
        },
      );
      isLoading.value = false;
    }
  }

  isInternetConnectionFunc() async {
    isInternetConnection.value =
        await InternetConnectionChecker().hasConnection;
  }

  @override
  void onInit() {
    isInternetConnectionFunc();
    getPosts();
    super.onInit();
  }
}
