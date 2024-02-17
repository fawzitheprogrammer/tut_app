class SliderObject {
  final String title;
  final String subtitle;
  final String image;

  SliderObject(
      {required this.title, required this.subtitle, required this.image});
}

class SliderViewModelObject {
  final SliderObject sliderObject;
  final int numberOfSlider;
  final int currentIndex;

  SliderViewModelObject({
    required this.sliderObject,
    required this.numberOfSlider,
    required this.currentIndex,
  });
}
