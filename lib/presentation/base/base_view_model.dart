abstract class BaseViewModel {}

abstract class BaseViewModelInput {
  void start(); // To be called when an action must be taken
  void dispose(); // To be called when a view model dies
}

abstract class BaseViewModelOutput {}
