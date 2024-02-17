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

  // A list for slider objects
  late final List<SliderObject> _list;

  // Current index for slider objects
  int _currentIndex = 0;

  // Intialize SliderObject and post it to the View
  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  // Once everything in start method is intialized, Close `[_streamController]`
  @override
  void dispose() {
    _streamController.close();
  }

  // An event to go back to previous slider object
  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  // An event to go next to previous slider object
  @override
  int gotNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  // This code gets executed on each page changing `Updating the UI`
  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  // Access the Sink to add data to the stream
  @override
  Sink get inputSldierViewObject => _streamController.sink;

  // Main stream that connects StreamBuilder with UI
  @override
  Stream<SliderViewModelObject> get outputSliderObject =>
      _streamController.stream.map((event) => event);

  // Accessing Sink to add data to stream and sends it to `UI`
  void _postDataToView() {
    inputSldierViewObject.add(
      SliderViewModelObject(
          sliderObject: _list[_currentIndex],
          numberOfSlider: _list.length,
          currentIndex: _currentIndex),
    );
  }

  // List of slider objects
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
