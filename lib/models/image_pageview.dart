import 'package:flutter/material.dart';

class SliderItemPageView extends StatelessWidget {
  final String imageSliderPageView;
  final String textSliderPageView;
  final Widget destinationPage;

  const SliderItemPageView(
      {super.key,
      required this.imageSliderPageView,
      required this.textSliderPageView,
      required this.destinationPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          borderRadius: BorderRadius.circular(16.0),
          elevation: 5.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ],
              image: DecorationImage(
                image: AssetImage(imageSliderPageView),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Text(
                textSliderPageView,
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
