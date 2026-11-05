import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rnn_yaatra/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(110);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Yellow accent background line behind the curve
        ClipPath(
          clipper: YellowAccentClipper(),
          child: Container(
            height: 115,
            color: const Color(0xFFFFB300), // Yellow Accent Color
          ),
        ),
        // Main Deep Blue Header
        ClipPath(
          clipper: HeaderCurveClipper(),
          child: Container(
            // height: 106,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0D47A1), // Deep Blue Start
                  Color(0xFF002171), // Darker Blue End
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 15.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: CircleAvatar(
                        backgroundColor: AppColor.WHITE,
                        child: Icon(Iconsax.arrow_left, color: AppColor.PRIMARY_COLOR, size: 22),
                      ),
                      onPressed: onBackPressed ?? () => Navigator.of(context).maybePop(),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    Expanded(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.3,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 24), // Balance the back arrow space
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Custom Clipper for the Main Blue Header Curve
class HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 18);
    
    // Smooth quadratic curve at the bottom
    path.quadraticBezierTo(
      size.width * 0.1, 
      size.height,  
      size.width,  
      size.height - 25,
    );
    // path.quadraticBezierTo(
    //   size.width * 0.5, 
    //   size.height, 
    //   size.width, 
    //   size.height - 18,
    // );
    
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Custom Clipper for the Yellow Accent Border
class YellowAccentClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 14);
    
    path.quadraticBezierTo(
      size.width * 0.1, 
      size.height, 
      size.width, 
      size.height - 25,
    );
    // path.quadraticBezierTo(
    //   size.width * 0.5, 
    //   size.height, 
    //   size.width, 
    //   size.height - 14,
    // );
    
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}