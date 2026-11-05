import 'package:flutter/material.dart'; 

class Gradient3DProgressBar extends StatefulWidget {
  final double progress; // 0.0 → 1.0

  const Gradient3DProgressBar({super.key, required this.progress});

  @override
  State<Gradient3DProgressBar> createState() =>
      _Gradient3DProgressBarState();
}

class _Gradient3DProgressBarState extends State<Gradient3DProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        return Container(
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black12,
          ),
          child: Stack(
            children: [
              // 🔵 Progress Fill
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    width: width * widget.progress,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          // Color(0xff032349),
                          Colors.deepPurple,
                          Colors.deepPurpleAccent
                          // AppColor.BLACK,
                          // Color(0xfff7b948),
                          // Color(0xfffdd46b),
                          // Color(0xFF2C87FB),
                          // Color(0xFF3799AF),
                          // Color(0xFF77D33F),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ✨ Shine Effect
              AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: width * widget.progress,
                        child: Stack(
                          children: [
                            Positioned(
                              left: (width * widget.progress + 80) *
                                      _controller.value -
                                  80,
                              child: Container(
                                width: 60,
                                height: 18,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.white.withValues(alpha: 0.7),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}