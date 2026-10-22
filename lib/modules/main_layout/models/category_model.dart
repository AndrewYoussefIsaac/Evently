import 'package:evently/core/utilities/app_images.dart';

class CategoryModel {
  final String id;
  final String title;
  final String icon;
  final String image;
  final String darkImage;
  const CategoryModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.image,
    required this.darkImage,
  });
  static const List<CategoryModel> categories = [
    CategoryModel(
      id: "sport",
      title: "sport",
      icon: AppImages.sport,
      image: AppImages.sportCard,
      darkImage: AppImages.darkSportCard,
    ),
    CategoryModel(
      id: "bookclub",
      title: "bookclub",
      icon: AppImages.book,
      image: AppImages.bookCard,
      darkImage: AppImages.darkBookCard,
    ),
    CategoryModel(
      id: "birthday",
      title: "birthday",
      icon: AppImages.birthday,
      image: AppImages.birthdayCard,
      darkImage: AppImages.darkBirthdayCard,
    ),
    CategoryModel(
      id: "meeting",
      title: "meeting",
      icon: AppImages.meeting,
      image: AppImages.meetingCard,
      darkImage: AppImages.darkMeetingCard,
    ),
    CategoryModel(
      id: "exhibition",
      title: "exhibition",
      icon: AppImages.exhibition,
      image: AppImages.exhibitionCard,
      darkImage: AppImages.darkExhibitionCard,
    ),
  ];

  static Map<String,CategoryModel> categoryMap = {
    for ( CategoryModel category in categories ) category.id : category
  } ;
}
