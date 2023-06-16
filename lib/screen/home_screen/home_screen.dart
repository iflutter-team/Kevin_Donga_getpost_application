import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modeldemo/screen/home_screen/home_screen_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          GetBuilder<HomeController>(builder: (controller) {
            return IconButton(
                onPressed: () => controller.logOut(),
                icon: const Icon(Icons.logout));
          })
        ],
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return Column(
          children: [
            // ListView.builder(
            //   itemCount: controller.productList!.products!.length,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       child: Column(
            //         children: [
            //           Text(controller.productList!.products![index].id
            //               .toString()),
            //           Image.network(controller
            //               .productList!.products![index].images!.first
            //               .toString())
            //         ],
            //       ),
            //     );
            //   },
            // ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // childAspectRatio: 16 / 15,
                ),
                itemCount: controller.productList!.products!.length,
                itemBuilder: (BuildContext context, int index) => Container(
                  margin: EdgeInsets.all(10),
                  // height: 200,
                  // width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 2)]),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                            child: Image.network(
                              controller
                                  .productList!.products![index].images!.first
                                  .toString(),
                              height: 110,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.productList!.products![index].title
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "\$" +
                                        controller
                                            .productList!.products![index].price
                                            .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.pinkAccent),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orangeAccent,
                                        size: 19,
                                      ),
                                      Text(
                                        controller.productList!.products![index]
                                            .rating
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
