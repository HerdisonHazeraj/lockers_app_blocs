import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CEFFInfoCardChart extends StatelessWidget {
  const CEFFInfoCardChart(
    this.text,
    this.value,
    this.svgSrc, {
    this.iconSize = 40,
    this.maxLines = 2,
    this.tooltip,
    this.onTap,
    super.key,
  });
  final String text;
  final String value;
  final String svgSrc;
  final int iconSize;
  final int maxLines;
  final String? tooltip;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              svgSrc,
              height: iconSize.toDouble(),
            ),
            tooltip != null
                ? Tooltip(
                    message: tooltip,
                    waitDuration: const Duration(seconds: 1),
                    child: Text(
                      text,
                      maxLines: maxLines,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xffa6a6a6),
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                  )
                : Text(
                    text,
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xffa6a6a6),
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                  ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
