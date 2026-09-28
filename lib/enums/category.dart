import 'package:news_app/commen/images.dart';

enum Category {
  general(),
  busniess,
  sprot,

  helth,
  entertainment,

  technology,
  science,
}

extension CategoryExtention on Category {
  String get ImagePath {
    switch (this) {
      case Category.general:
        return AppImages.general;
      case Category.busniess:
        return AppImages.busniess;
      case Category.entertainment:
        return AppImages.entertainment;
      case Category.helth:
        return AppImages.helth;
      case Category.science:
        return AppImages.science;
      case Category.sprot:
        return AppImages.sport;
      case Category.technology:
        return AppImages.technology;
    }
  }
}

extension Categoryname on Category {
  String get name {
    switch (this) {
      case Category.general:
        return 'general ';
      case Category.busniess:
        return 'busniess';
      case Category.entertainment:
        return 'entertainment';
      case Category.helth:
        return 'helth';
      case Category.science:
        return 'science';
      case Category.sprot:
        return 'sport';
      case Category.technology:
        return 'technology';
    }
  }
}
