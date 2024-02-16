import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tut_app/presentation/resources/asstes_manager.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<SliderObject> _getSliderData() => [
        SliderObject(
          title: AppStrings.onBoardingTitle1,
          subtitle: AppStrings.onBoardingSubTitle1,
          image: Assets.onboardingLogo1,
        ),
        SliderObject(
          title: AppStrings.onBoardingTitle2,
          subtitle: AppStrings.onBoardingSubTitle2,
          image: Assets.onboardingLogo2,
        ),
        SliderObject(
          title: AppStrings.onBoardingTitle3,
          subtitle: AppStrings.onBoardingSubTitle3,
          image: Assets.onboardingLogo3,
        ),
        SliderObject(
          title: AppStrings.onBoardingTitle4,
          subtitle: AppStrings.onBoardingSubTitle4,
          image: Assets.onboardingLogo4,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (value) {
          setState(() {
            if (mounted) {
              setState(() {
                _currentIndex = value;
              });
            }
          });
        },
        itemBuilder: (context, index) => const Center(),
      ),
    );
  }
}

class SliderObject {
  final String title;
  final String subtitle;
  final String image;

  SliderObject(
      {required this.title, required this.subtitle, required this.image});
}
