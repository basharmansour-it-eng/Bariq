import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/help_content.dart';
import '../widgets/legal_document.dart';

class LegalView extends StatelessWidget {
  const LegalView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('profile_terms'.tr),
          bottom: TabBar(
            labelColor: primaryBlue,
            unselectedLabelColor: darkNavy.withValues(alpha: 0.5),
            indicatorColor: primaryBlue,
            labelStyle:
                TextStyle(fontFamily: cairo, fontWeight: FontWeight.w800),
            unselectedLabelStyle:
                TextStyle(fontFamily: cairo, fontWeight: FontWeight.w600),
            tabs: [
              Tab(text: 'legal_terms'.tr),
              Tab(text: 'legal_privacy'.tr),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LegalDocument(sections: termsSections),
            LegalDocument(sections: privacySections),
          ],
        ),
      ),
    );
  }
}