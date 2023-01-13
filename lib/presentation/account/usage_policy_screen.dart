import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/components.dart';

class UsagePolicyScreen extends StatefulWidget {
  const UsagePolicyScreen({Key? key}) : super(key: key);

  @override
  State<UsagePolicyScreen> createState() => _UsagePolicyScreenState();
}

class _UsagePolicyScreenState extends State<UsagePolicyScreen> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: customAppBar(title: "Usage Policy".tr() , centerTitle: true , elevation: 0.5),);
  }
}