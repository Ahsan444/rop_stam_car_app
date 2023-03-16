import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rop_stam_assignment/AppModule/utils/Fonts/AppDimensions.dart';
import 'package:rop_stam_assignment/AppModule/utils/utils.dart';

import '../../utils/Fonts/font_weights.dart';
import '../../utils/app_text.dart';
import '../controller/dashboard_controller.dart';
import '../widget/card_widget.dart';
import '../widget/dailog_widget.dart';
import '../widget/validator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(text:'Dashboard',fontSize: AppDimensions.FONT_SIZE_18,fontWeight: FontWeights.medium,),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              dashboardController.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Obx(() {
                  return ListView(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: InkWell(
                                  child: CardWidget(
                                    image:
                                    dashboardController.cars[index].image,
                                    name:
                                    '${dashboardController.cars[index].name}',
                                    moedl:
                                    'Model: ${dashboardController.cars[index]
                                        .reg}',
                                  ),
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return DialogWidget(
                                            formKey: dashboardController
                                                .formKey,
                                            image: dashboardController.cars[index].image,
                                            name: dashboardController.nameController,
                                            hintText: '${dashboardController.cars[index].name}',
                                            reg: dashboardController.regController,
                                            hintReg: '${dashboardController.cars[index].reg}',
                                            onDeleted: (){
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds:
                                                      800), () {
                                                Navigator.of(
                                                    context)
                                                    .pop();
                                                dashboardController
                                                    .cars
                                                    .removeAt(
                                                    index);
                                                Utils.toastMessage(
                                                    'Deleted Successfully');
                                              });
                                            },
                                            onUpdate: (){
                                              if (dashboardController.formKey.currentState!
                                                  .validate()) {
                                                dashboardController
                                                    .updateCars(
                                                  name: dashboardController
                                                      .nameController
                                                      .text,
                                                  reg: dashboardController
                                                      .regController
                                                      .text,
                                                  context: context,
                                                  index: index,
                                                );
                                                setState(() {});
                                              }
                                            },
                                            validateName: validateName,
                                            validateReg: validateReg,
                                          );
                                        });
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                        itemCount: dashboardController.cars.length,
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dashboardController.addNewCars();
        },
        tooltip: 'Add new car',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods
    );
  }
}


