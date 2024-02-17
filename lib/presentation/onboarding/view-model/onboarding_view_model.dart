import 'package:tut_app/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  

  // Stream controller outputs 




  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void gotNext() {
    // TODO: implement gotNext
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }
}

abstract class OnBoardingViewModelInputs {
  void gotNext();
  void goPrevious();
  void onPageChanged(int index);
}

abstract class OnBoardingViewModelOutputs {}
