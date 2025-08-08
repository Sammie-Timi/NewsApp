import 'package:news_app/core/utilis/responsive.dart';

extension SizeExtentions on num{
  double get h => this * SizeConfig.h;
  double get w => this * SizeConfig.w;
}