import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../profile/presentation/widgets/divider_widget.dart';
import '../widgets/support_menu_item.dart';

class HelpSupportView extends StatelessWidget {
  const HelpSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, size: 19),
        ),
        title: Text('Help & Support',
            style: TextStyle(fontSize: 18, fontFamily: 'inter')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            DividerWidget(),
            SizedBox(
              height: 15,
            ),
            SupportMenuItem(
                title: "(FAQ)",
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (_) => ()),
                  // );
                }),
            DividerWidget(),
            SupportMenuItem(
                title: "Contact Customer Support",
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //    MaterialPageRoute(builder: (_) =>   ()),
                  // );
                }),
            DividerWidget(),
            SupportMenuItem(
                title: "Terms and Conditions",
                onTap: () {
                  //Navigator.pushNamed(context, '/');
                }),
            DividerWidget(),
            SupportMenuItem(
                title: "Privacy Policy",
                onTap: () {
                  //Navigator.pushNamed(context, '/');
                }),
            DividerWidget(),
            SupportMenuItem(
                title: "About Grocery Plus",
                onTap: () {
                  //Navigator.pushNamed(context,'');
                }),
            DividerWidget(),
            SupportMenuItem(
                title: "App Version: 1.0.5",
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (_) =>   ()),
                  // );
                }),
            DividerWidget(),
          ],
        ),
      ),
    );
  }
}
