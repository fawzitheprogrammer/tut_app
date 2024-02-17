import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tut_app/domain/models.dart';
import 'package:tut_app/presentation/onboarding/view-model/onboarding_view_model.dart';
import 'package:tut_app/presentation/resources/asstes_manager.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/constant_manager.dart';
import 'package:tut_app/presentation/resources/routes_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final OnBoardingViewModel _boardingViewModel = OnBoardingViewModel();
  final PageController _pageController = PageController();

  _bind() {
    _boardingViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewModelObject>(
      stream: _boardingViewModel.outSldierViewObject,
      builder: (context, snapshort) {
        return _getContentWidget(snapshort.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewModelObject? sliderViewModelObject) {
    if (sliderViewModelObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewModelObject.numberOfSlider,
          onPageChanged: (value) {
            _boardingViewModel.onPageChanged(value);
          },
          itemBuilder: (context, index) => Center(
            child: OnBoardingPage(sliderObject:sliderViewModelObject.sliderObject),
          ),
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.registerRoute);
                  },
                  child: Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorManager.primary),
                  ),
                ),
              ),

              // Bottom Bar
              _getBottomBar(sliderViewModelObject)
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomBar(SliderViewModelObject sliderViewModelObject) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
      color: ColorManager.darkPrimary,
      height: AppSize.s40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _boardingViewModel.goPrevious(),
                duration:
                    const Duration(milliseconds: Constant.sliderAnimationTime),
                curve: Curves.bounceInOut,
              );
            },
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(Assets.leftArrowIc),
            ),
          ),
          Row(
            children: List.generate(
             sliderViewModelObject.numberOfSlider,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
                child: Container(
                  height: AppSize.s12,
                  width: AppSize.s12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s140),
                    color: sliderViewModelObject.currentIndex == index
                        ? ColorManager.white
                        : Colors.transparent,
                    border: Border.all(color: ColorManager.white),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _boardingViewModel.gotNext(),
                duration:
                    const Duration(milliseconds: Constant.sliderAnimationTime),
                curve: Curves.bounceInOut,
              );
            },
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(Assets.rightArrowIc),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _boardingViewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject sliderObject;

  const OnBoardingPage({super.key, required this.sliderObject});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        SvgPicture.asset(sliderObject.image)
      ],
    );
  }
}
