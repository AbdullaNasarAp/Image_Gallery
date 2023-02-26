import 'package:flutter/material.dart';

class Textbutton extends StatelessWidget {
  const Textbutton({
    Key? key,
    required this.title,
    this.text,
    required this.ontap,
    required this.colors,
  }) : super(key: key);
  final String title;
  final String? text;
  final VoidCallback ontap;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: ontap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(color: colors)),
            Text(
              text ?? '',
              style: const TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ],
        ));
  }
}

class ContainerButtonImage extends StatelessWidget {
  const ContainerButtonImage({
    Key? key,
    required this.image,
    required this.onPress,
    required this.title,
  }) : super(key: key);
  final String image;
  final Function() onPress;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress;
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                image,
                filterQuality: FilterQuality.high,
                cacheHeight: 40,
                cacheWidth: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    super.key,
    required this.kWidth,
    required this.kHeight,
    required this.kColors,
    required this.title,
    required this.ls,
    required this.fontwght,
    required this.fontsz,
    required this.bRadius,
    this.icons,
  });
  final double kWidth;
  final double kHeight;
  final Color kColors;
  final String title;
  final double ls;
  final FontWeight fontwght;
  final double fontsz;
  final double bRadius;
  final IconData? icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kWidth,
      height: kHeight,
      decoration: BoxDecoration(
        color: kColors,
        borderRadius: BorderRadius.circular(
          bRadius,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextTitle(
            title: title,
            ls: ls,
            fontwght: fontwght,
            fontsz: fontsz,
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            icons,
            color: Colors.white,
            size: 16,
          )
        ],
      ),
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({
    super.key,
    required this.title,
    required this.ls,
    required this.fontwght,
    required this.fontsz,
    this.overflow,
    this.mL,
    this.textalign,
    this.color,
    this.decor,
  });
  final String title;
  final double ls;
  final FontWeight fontwght;
  final double fontsz;
  final TextOverflow? overflow;
  final int? mL;
  final TextAlign? textalign;
  final Color? color;
  final TextDecoration? decor;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: mL,
      textAlign: textalign,
      style: TextStyle(
        decoration: decor,
        color: color,
        letterSpacing: ls,
        fontWeight: fontwght,
        fontSize: fontsz,
        overflow: overflow,
      ),
    );
  }
}

class CostumText extends StatelessWidget {
  const CostumText(
      {super.key,
      required this.title,
      required this.ls,
      required this.fontwght,
      required this.fontsz});
  final String title;
  final double ls;
  final FontWeight fontwght;
  final double fontsz;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        letterSpacing: ls,
        fontWeight: fontwght,
        fontSize: fontsz,
      ),
    );
  }
}

class ButtunContainers extends StatelessWidget {
  const ButtunContainers({
    super.key,
    required this.kWidth,
    required this.kHeight,
    required this.kColors,
    required this.title,
    required this.ls,
    required this.fontwght,
    required this.fontsz,
    required this.bRadius,
    this.icons,
  });
  final double kWidth;
  final double kHeight;
  final Color kColors;
  final String title;
  final double ls;
  final FontWeight fontwght;
  final double fontsz;
  final double bRadius;
  final IconData? icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kWidth,
      height: kHeight,
      decoration: BoxDecoration(
        color: kColors,
        borderRadius: BorderRadius.circular(
          bRadius,
        ),
      ),
      child: Row(
        children: [
          Center(
            child: CostumText(
              title: title,
              ls: ls,
              fontwght: fontwght,
              fontsz: fontsz,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            icons,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class MyMessengerHelper {
  static void showSnackBar(var scaffoldKey, String messege) {
    scaffoldKey.currentState?.hideCurrentSnackBar();
    scaffoldKey.currentState?.showSnackBar(SnackBar(
        backgroundColor: Colors.blue,
        dismissDirection: DismissDirection.startToEnd,
        duration: const Duration(milliseconds: 800),
        content: Text(messege)));
  }
}
