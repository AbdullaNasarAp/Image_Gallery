import 'package:assignment_thebrewapps/widgets/utils/app_exception.dart';
import 'package:assignment_thebrewapps/widgets/utils/utils.dart';
import 'package:dio/dio.dart';

class ProductService {
  getProducts() async {
    final dios = Dio();
    try {
      final Response response = await dios.get(mainUrl);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final image = (response.data as List);

        return image;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
