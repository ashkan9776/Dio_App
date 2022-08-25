import 'package:dio_app/controller/post_controller.dart';
import 'package:dio_app/services/dio_service.dart';
import 'package:dio_app/utils/colors.dart';
import 'package:dio_app/utils/constants.dart';
import 'package:dio_app/view/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  PostController postController = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: MyColors.bgColor,
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Obx(
            () => postController.isInternetConnection.value
                ? postController.isLoading.value
                    ? buildLoading()
                    : buildBody()
                : Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Lottie.asset('assets/b.json', repeat: false),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          if (await InternetConnectionChecker().hasConnection ==
                              true) {
                            postController.getPosts();
                          } else {
                            showCustomSnackBar(context);
                          }
                        },
                        color: MyColors.prColor,
                        child: Text(
                          "Try Again :(",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  )),
          )),
    );
  }

  ///body
  Widget buildBody() {
    return RefreshIndicator(
      color: MyColors.prColor,
      onRefresh: () {
        return postController.getPosts();
      },
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: postController.posts.length,
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              Get.to(DetailsPage(index: index), transition: Transition.fadeIn);
            },
            child: Card(
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(postController.posts[index].id.toString()),
                  ),
                ),
                title: Text(postController.posts[index].title),
                subtitle: Text(postController.posts[index].body,
                    style: TextStyle(fontWeight: FontWeight.w300)),
              ),
            ),
          );
        },
      ),
    );
  }

  ///loading
  Center buildLoading() {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: Lottie.asset(
          "assets/a.json",
        ),
      ),
    );
  }
}

///appbar
AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: MyColors.prColor,
    centerTitle: true,
    title: const Text("RestFul Api With Dio"),
  );
}
