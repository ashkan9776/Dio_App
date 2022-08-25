import 'package:dio_app/controller/post_controller.dart';
import 'package:dio_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key, required this.index}) : super(key: key);

  PostController postController = Get.find<PostController>();
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      appBar: AppBar(
          centerTitle: true,
          title: Text("Details Page"),
          backgroundColor: MyColors.prColor),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(postController.posts[index].id.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w300)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                postController.posts[index].title.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                postController.posts[index].body,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
