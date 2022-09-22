import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:wack_a_mole/src/components/waveButton/circlePainter.dart';
import 'package:wack_a_mole/src/components/waveButton/curveWave.dart';
import 'package:wack_a_mole/src/helper/colorHelper.dart';

class RipplesAnimation extends StatefulWidget {
  RipplesAnimation({
    Key? key,
    this.size = 40.0,
    this.color = ColorHelper.blue,
    this.scaleMutliplier = 1.5,
    this.onPressed,
  }) : super(key: key);
  final double size;
  final Color color;
  VoidCallback? onPressed;
  late double scaleMutliplier;

  @override
  _RipplesAnimationState createState() => _RipplesAnimationState();
}

class _RipplesAnimationState extends State<RipplesAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controllerScale;

  late double _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();

    _controllerScale = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.1,
      upperBound: 2,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerScale.dispose();

    super.dispose();
  }

  Widget _button() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[
                widget.color,
                Color.lerp(widget.color, Colors.black, 0.5)!
              ],
            ),
          ),
          child: ScaleTransition(
              scale: Tween(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const CurveWave(),
                ),
              ),
              child: widget.color == ColorHelper.blue ? Image.asset('assets/images/circle.png',width: widget.size * 0.6, height: widget.size * 0.6,) : Image.asset('assets/images/circle_white.png',width: widget.size * 0.6, height: widget.size * 0.6,)),
          
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controllerScale.value * widget.scaleMutliplier;

    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      child: Transform.scale(
        scale: _scale,
        child: Center(
          child: CustomPaint(
            painter: CirclePainter(
              _controller,
              color: widget.color,
            ),
            child: SizedBox(
              width: widget.size * 4.125,
              height: widget.size * 4.125,
              child: _button(),
            ),
          ),
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controllerScale.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controllerScale.reverse();

    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }
}
