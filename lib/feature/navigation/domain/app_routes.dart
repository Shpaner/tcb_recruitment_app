class AppRoutes {
  static const galleryScreenName = 'gallery';
  static const galleryScreenPath = '/';

  static const pictureScreenName = 'picture';
  static const pictureScreenPath = 'picture';

  static const commentsScreenName = 'comments';
  static const commentsScreenPath = '/comments';
}

enum NavbarPage {
  pictures,
  comments,
}

extension NavbarPageExt on NavbarPage {
  String get routeName {
    if (index == 1) return AppRoutes.commentsScreenName;
    return AppRoutes.galleryScreenName;
  }
}
