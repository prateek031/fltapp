// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:mvvmapp/src/view/screens/home_page.dart';
import 'package:mvvmapp/src/view/screens/movie_details.dart';

import '../../src/binding/moviebinding.dart';



class Routes {
   static String HomePage = '/homepage';
   static String MovieDetailsPage = '/details';
}
final getPages =[
  GetPage(name: Routes.HomePage, page:()=> const HomePage(),binding: MoviesBinding()),
   GetPage(name: Routes.MovieDetailsPage, page: () => MovieDetailsPage()),
];