import 'package:adelco_user/shared/components.dart';
import 'package:adelco_user/utilities/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StatusesScreen extends StatefulWidget {
  const StatusesScreen({Key? key}) : super(key: key);

  @override
  State<StatusesScreen> createState() => _StatusesScreenState();
}

class _StatusesScreenState extends State<StatusesScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
            title: "Order status", elevation: 0.5, centerTitle: true),
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppUI.shimmerColor)),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 16,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppUI.activeColor.withAlpha(600),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 16,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          color: AppUI.activeColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Estimated time of arrival",
                        fontSize: 12,
                        color: AppUI.blackColor,
                      ),
                      CustomText(
                        text: "text",
                        fontSize: 12,
                        color: AppUI.darkActiveColor,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppUI.shimmerColor)),
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Order number",
                        color: AppUI.greyColor,
                        fontSize: 10,
                      ),
                      CustomText(
                          text: "text", color: AppUI.blackColor, fontSize: 10),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: "Order status",
                          color: AppUI.greyColor,
                          fontSize: 10),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppUI.activeColor.withAlpha(800)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Center(
                              child: CustomText(
                                  text: "Text",
                                  color: AppUI.activeColor,
                                  fontSize: 10)))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: "Delivery location",
                          color: AppUI.greyColor,
                          fontSize: 10),
                      CustomText(
                          text: "text", color: AppUI.blackColor, fontSize: 10),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: "Number of products",
                          color: AppUI.greyColor,
                          fontSize: 10),
                      CustomText(
                          text: "text", color: AppUI.blackColor, fontSize: 10),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: "Total", color: AppUI.greyColor, fontSize: 10),
                      CustomText(
                          text: "text", color: AppUI.blackColor, fontSize: 10),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppUI.shimmerColor)),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Theme(
                data: ThemeData(
                  canvasColor: Colors.yellow,
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: Colors.green,
                        background: Colors.red,
                        secondary: Colors.cyan,
                      ),
                ),
                child: Stepper(
                  physics: NeverScrollableScrollPhysics(),
                  controlsBuilder: (context, _) {
                    return Row(
                      children: <Widget>[
                        Container(
                          child: null,
                        ),
                        Container(
                          child: null,
                        ),
                      ], // <Widget>[]
                    );
                  },
                  currentStep: _index,
                  onStepCancel: () {
                    if (_index > 0) {
                      setState(() {
                        _index -= 1;
                      });
                    }
                  },
                  onStepContinue: () {
                    if (_index <= 0) {
                      setState(() {
                        _index += 1;
                      });
                    }
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      _index = index;
                    });
                  },
                  type: StepperType.vertical,
                  steps: [
                    Step(
                        subtitle: CustomText(
                            text: "18/06/2022", color: AppUI.greyColor),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Order verification",
                              fontSize: 16,
                              color: AppUI.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                                text: "00:05",
                                color: AppUI.darkActiveColor,
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                        content: SizedBox(
                          height: 0,
                        ),
                        isActive: true,
                        state: StepState.disabled),
                    Step(
                        subtitle: CustomText(
                            text: "18/06/2022", color: AppUI.greyColor),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Order processing",
                              fontSize: 16,
                              color: AppUI.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                                text: "00:05",
                                color: AppUI.darkActiveColor,
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                        content: SizedBox(
                          height: 0,
                        ),
                        isActive: true,
                        state: StepState.disabled),
                    Step(
                        subtitle: CustomText(
                            text: "18/06/2022", color: AppUI.greyColor),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "On the way to you",
                              fontSize: 16,
                              color: AppUI.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                                text: "00:05",
                                color: AppUI.darkActiveColor,
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                        content: SizedBox(
                          height: 0,
                        ),
                        // isActive: true,
                        state: StepState.disabled),
                    Step(
                        subtitle: CustomText(
                            text: "18/06/2022", color: AppUI.greyColor),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Delivered",
                              fontSize: 16,
                              color: AppUI.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                                text: "00:05",
                                color: AppUI.darkActiveColor,
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                        content: SizedBox(
                          height: 0,
                        ),
                        // isActive: true,
                        state: StepState.disabled),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

bool getIsActive(int currentIndex, int index) {
  if (currentIndex <= index) {
    return true;
  } else {
    return false;
  }
}
