import 'package:flutter/material.dart';

class HomeAnimation extends StatefulWidget {
  const HomeAnimation({Key? key}) : super(key: key);

  @override
  _HomeAnimationState createState() => _HomeAnimationState();
}

class _HomeAnimationState extends State<HomeAnimation>
    with TickerProviderStateMixin {
  late Animation<double> _animation1;
  late AnimationController _controller1, _controller2, _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2200));
    _controller2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _controller3 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _animation1 = Tween(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: _controller2, curve: Curves.easeInOut));
    _controller1.repeat();
    _controller2.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Animation'),
      ),
      body: Container(
        child: _getContent(),
      ),
    );
  }

  Widget _getContent() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: _animation1.value,
          child: Image.asset(
            'images/m.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: _radialMenu(),
        )
      ],
    );
  }

  Widget _radialMenu() {
    return Center(
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
              bottom: 250,
              right: 170,
              child: ScaleTransition(
                  scale: _controller1,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('images/em.png'))),
                  ))),
          Positioned(
              bottom: 480,
              right: 180,
              child: ScaleTransition(
                scale: _controller2,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 6, color: Colors.white)),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: RotationTransition(
                          turns: _controller1,
                          child: const Icon(
                            Icons.play_arrow,
                            size: 50,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
              bottom: 590,
              right: 40,
              child: ScaleTransition(
                scale: _controller2,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(width: 3, color: Colors.white)),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: RotationTransition(
                          turns: _controller1,
                          child: const Icon(
                            Icons.http,
                            size: 30,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              )),
          Positioned(
              bottom: 590,
              right: 40,
              child: ScaleTransition(
                scale: _controller2,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(width: 3, color: Colors.white)),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: RotationTransition(
                          turns: _controller2,
                          child: const Icon(
                            Icons.http,
                            size: 30,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ))
        ],
      ),
    );
  }
}
