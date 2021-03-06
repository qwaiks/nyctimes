import 'package:flutter/material.dart';

class Api {
  static const headlines =
      "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=7IsRukW0YqdE6KtdTmnjufzONYsT98hw";
}

class AppColors {
  static const errorColor = Color(0xFFD32F2F);
  static const secondaryColor = Color(0xFFA0AEC0);
}

class AppString {
  static const appName = "Nyc Times";
  static const headlineTitle = "NY Times Most Popular";
  static const error = "Something went wrong!";
  static const tryAgain =
      "Sorry, an error occurred while loading headlines, Please try again later";

  static const emptyHeadlineDescription =
      "Looks like there's no breaking news. Well that's a first!! Check again later.";

  static const emptyHeadlineTitle = "No news available";
  static const readFullStory = "Want to red the full story? ";
  static const findStory = "Find it here";
}

class WidgetKeys {
  //News Item Tile Keys
  static const newsTitleKey = ValueKey("newsTitleKey");
  static const newsPublishDate = ValueKey("newsPublishDate");
  static const newsByLine = ValueKey("newsByLine");
  static const newsImage = ValueKey("newsImage");
  static const newsItemWidget = ValueKey("newsItemWidget");
}
