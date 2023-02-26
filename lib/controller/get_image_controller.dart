import 'package:assignment_thebrewapps/model/gallery_model.dart';
import 'package:assignment_thebrewapps/services/services.dart';
import 'package:assignment_thebrewapps/widgets/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider() {
    initfirst();
  }

  void initfirst() {
    getPictureData();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !isLoading) {
        if (hasMore) {
          ApiServices().getMethod(mainUrl);
        }
      }
    });
    notifyListeners();
  }

  List<GalleryModel> photos = [];
  ScrollController scrollController = ScrollController();
  final int maxLength = 10000;
  bool isLoading = true;
  bool hasMore = true;
  int page = 1;
  String apikey = "MYgz312qAI2VEIlVJ3pAeWrhrNGmYbou9fUqM7dyUl0";
  var selectedIndex = 0;

  getPictureData() async {
    isLoading = true;
    notifyListeners();
    var response = await ApiServices().getMethod(mainUrl);
    photos = [];
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        photos.add(GalleryModel.fromJson(element));
      });
      isLoading = false;
      page = page + 1;
      hasMore = photos.length < maxLength;
      notifyListeners();
    }

    notifyListeners();
  }
}
