import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';
import '../../search/search_screen.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 262,
          width: double.infinity,
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/image/head.jpg"))),
        ),
        Container(
          height: 262,
          width: double.infinity,
          color: Colors.black.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const TextTitle(
                title: "What would you\n like to find",
                ls: 0,
                fontwght: FontWeight.bold,
                fontsz: 26,
                mL: 2,
                textalign: TextAlign.center,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => SearchScreen(),
                    // ));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.search,
                            color: Colors.white70,
                            size: 26,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          TextTitle(
                            title: "What are looking for ?",
                            ls: 0,
                            fontwght: FontWeight.normal,
                            fontsz: 17,
                            color: Colors.white70,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
