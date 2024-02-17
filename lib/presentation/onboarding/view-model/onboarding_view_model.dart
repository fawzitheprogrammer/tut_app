import 'dart:async';

import 'package:tut_app/domain/models.dart';
import 'package:tut_app/presentation/base/base_view_model.dart';
import 'package:tut_app/presentation/resources/asstes_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // Stream controller outputs
  final StreamController _streamController =
      StreamController<SliderViewModelObject>();

  late final List<SliderObject> _list;

  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  int gotNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSldierViewObject => _streamController.sink;

  @override
  Stream<SliderViewModelObject> get outSldierViewObject =>
      _streamController.stream.map((event) => event);

  void _postDataToView() {
    inputSldierViewObject.add(
      SliderViewModelObject(
          sliderObject: _list[_currentIndex],
          numberOfSlider: _list.length,
          currentIndex: _currentIndex),
    );
  }

  @override
  Stream<SliderViewModelObject> get outputSliderObject =>
      _streamController.stream.map((event) => event);

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
}

abstract class OnBoardingViewModelInputs {
  void gotNext();
  void goPrevious();
  void onPageChanged(int index);

  // Stream Controller
  Sink get inputSldierViewObject;
}

abstract class OnBoardingViewModelOutputs {
  // Stream Controller
  Stream<SliderViewModelObject> get outputSliderObject;
}
