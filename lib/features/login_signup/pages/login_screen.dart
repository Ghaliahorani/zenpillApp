import 'package:flutter/material.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScreenOne(),
      ),
    );
  }
}


class ScreenOne extends StatefulWidget {
  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.separated(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: 10, // عدد العناصر
          itemBuilder: (context, index) {
            return Center(
              child: AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1.0;

                  // التحقق من موقع العنصر داخل الـ PageView
                  if (_pageController.position.haveDimensions) {
                    value = _pageController.page! - index;
                    value = (1 - value.abs()).clamp(0.0, 1.0);
                  }

                  // تكبير العنصر الأقرب
                  double scale = Curves.easeOut.transform(value);
                  double angle = (1 - value) * 0.3; // دوران بسيط للعنصر البعيد

                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..scale(scale)
                      ..rotateY(angle),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.blue[(index + 1) * 100 % 900],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Item $index',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 100,
            );
        },
        ),
      ),
    );
  }
}