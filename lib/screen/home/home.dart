import 'package:assignment_thebrewapps/controller/get_image_controller.dart';
import 'package:assignment_thebrewapps/screen/home/widget/card_model.dart';
import 'package:assignment_thebrewapps/screen/home/widget/top.dart';
import 'package:assignment_thebrewapps/services/services.dart';
import 'package:assignment_thebrewapps/widgets/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).initfirst();
    });
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.black, Colors.grey])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TopWidget(),
              Expanded(
                child: Consumer<HomeProvider>(
                  builder: (context, value, child) {
                    return StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return CardModel(
                          value: value,
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
