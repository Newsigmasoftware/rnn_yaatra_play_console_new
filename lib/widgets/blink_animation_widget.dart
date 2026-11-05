// ignore_for_file: non_constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class BlinkAnimation extends ConsumerStatefulWidget {
  final String? txt;
  final TextStyle? txt_style;
  final TextAlign? textAlign;

  const BlinkAnimation({super.key,this.txt,this.txt_style,this.textAlign});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BlinkAnimationState();
}

class _BlinkAnimationState extends ConsumerState<BlinkAnimation> with SingleTickerProviderStateMixin{
  
  late AnimationController controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = AnimationController(
  //     vsync: this, // Use a TickerProviderStateMixin for vsync
  //     duration: const Duration(seconds: 1), // Adjust duration as needed
  //   )..repeat(reverse: true); // Repeats the animation, reversing direction
  // }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    // Color animation
    _colorAnimation = TweenSequence<Color?>(
      [
        TweenSequenceItem(tween: ColorTween(begin: Colors.red, end: Colors.blue), weight: 1.0),
        TweenSequenceItem(tween: ColorTween(begin: Colors.blue, end: Colors.green), weight: 1.0),
        TweenSequenceItem(tween: ColorTween(begin: Colors.green, end: Colors.yellow), weight: 1.0),
      ],
    ).animate(controller);

    // Scale animation
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Text(
            widget.txt ?? "",
            style: widget.txt_style?.copyWith(color: _colorAnimation.value),
            textAlign: widget.textAlign,
          ),
        );
      },
    );
    // final Animation<Color?> _colorAnimation = TweenSequence<Color?>(
    //   [
    //     TweenSequenceItem(tween: ColorTween(begin: Colors.red, end: Colors.blue), weight: 1.0),
    //     TweenSequenceItem(tween: ColorTween(begin: Colors.blue, end: Colors.green), weight: 1.0),
    //     TweenSequenceItem(tween: ColorTween(begin: Colors.green, end: Colors.yellow), weight: 1.0),
    //   ],
    // ).animate(controller);
    // return AnimatedBuilder(
    //   animation: _colorAnimation,
    //   builder: (context, child) {
    //     return Container(
    //       // width: 100,
    //       // height: 100,
    //       // color: _colorAnimation.value, // Apply the animated color
    //       // You can also animate other properties here if desired
    //       child: Text(widget.txt ?? "",style: widget.txt_style?.copyWith(color: _colorAnimation.value)),
    //     );
    //   },
    // );
  }
}




class BlinkAnimationContainer extends ConsumerStatefulWidget {
  final Widget? container;
  final BoxDecoration? boxDecoration;
  BlinkAnimationContainer({super.key,this.container,this.boxDecoration});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BlinkAnimationContainerState();
}

class _BlinkAnimationContainerState extends ConsumerState<BlinkAnimationContainer> with SingleTickerProviderStateMixin{
  
  late AnimationController controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = AnimationController(
  //     vsync: this, // Use a TickerProviderStateMixin for vsync
  //     duration: const Duration(seconds: 1), // Adjust duration as needed
  //   )..repeat(reverse: true); // Repeats the animation, reversing direction
  // }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    // Color animation
    _colorAnimation = TweenSequence<Color?>(
      [
        TweenSequenceItem(tween: ColorTween(begin: Colors.red, end: Colors.blue), weight: 1.0),
        TweenSequenceItem(tween: ColorTween(begin: Colors.blue, end: Colors.green), weight: 1.0),
        TweenSequenceItem(tween: ColorTween(begin: Colors.green, end: Colors.yellow), weight: 1.0),
      ],
    ).animate(controller);

    // Scale animation
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            decoration: widget.boxDecoration?.copyWith(color: _colorAnimation.value),
            child: widget.container,
          ),
          // child: Text(
          //   widget.txt ?? "",
          //   style: widget.txt_style?.copyWith(color: _colorAnimation.value),
          // ),
        );
      },
    );
    // final Animation<Color?> _colorAnimation = TweenSequence<Color?>(
    //   [
    //     TweenSequenceItem(tween: ColorTween(begin: Colors.red, end: Colors.blue), weight: 1.0),
    //     TweenSequenceItem(tween: ColorTween(begin: Colors.blue, end: Colors.green), weight: 1.0),
    //     TweenSequenceItem(tween: ColorTween(begin: Colors.green, end: Colors.yellow), weight: 1.0),
    //   ],
    // ).animate(controller);
    // return AnimatedBuilder(
    //   animation: _colorAnimation,
    //   builder: (context, child) {
    //     return Container(
    //       // width: 100,
    //       // height: 100,
    //       // color: _colorAnimation.value, // Apply the animated color
    //       // You can also animate other properties here if desired
    //       child: Text(widget.txt ?? "",style: widget.txt_style?.copyWith(color: _colorAnimation.value)),
    //     );
    //   },
    // );
  }
}