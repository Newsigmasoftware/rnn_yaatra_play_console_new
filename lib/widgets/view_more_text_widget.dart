// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/utils/spacings.dart';


class ViewMoreExample extends StatefulWidget {
  final String fullText;
  final int? textLength;
  final TextStyle? style;
  final Color? viewModeColor;
  final TextAlign? textAlign;
  ViewMoreExample({required this.fullText,this.textLength,this.style,this.viewModeColor,this.textAlign});

  @override
  _ViewMoreExampleState createState() => _ViewMoreExampleState();
}

class _ViewMoreExampleState extends State<ViewMoreExample> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Limit the text shown when not expanded
    String displayedText = isExpanded
        ? widget.fullText
        : widget.fullText.length > (widget.textLength ?? 150) // Limit to 100 characters
            ? '${widget.fullText.substring(0, (widget.textLength ?? 150))}...'
            : widget.fullText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(displayedText ,style: widget.style ?? TextStyle(fontWeight: FontWeight.w200),textAlign: widget.textAlign,),
        HtmlWidget(
          displayedText.trim(),
          textStyle: widget.style ?? TextStyle(fontWeight: FontWeight.w200),
        ),
        AddVerticalSpacing(8.0),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? 'View Less' : 'View More',
            style: TextStyle(
              fontSize: 13,
              color: widget.viewModeColor ?? AppColor.SECONDARY_COLOR,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
