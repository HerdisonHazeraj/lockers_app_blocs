import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CEFFPieChart extends StatefulWidget {
  const CEFFPieChart(
    this.values, {
    this.colors,
    this.cardHeight,
    this.cardWidth,
    this.radius = 58,
    this.onHoverRadius = 62,
    super.key,
  });
  final List? values;
  final List? colors;
  final double? cardWidth;
  final double? radius;
  final double? onHoverRadius;
  final double? cardHeight;
  @override
  State<CEFFPieChart> createState() => _CEFFPieChartState();
}

class _CEFFPieChartState extends State<CEFFPieChart> {
  int touchedIndex = -1;
  final Duration animDuration = const Duration(milliseconds: 250);

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.cardHeight ?? double.infinity,
      width: widget.cardWidth ?? double.infinity,
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
        children: [
          Expanded(
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    sections: showingSections(context),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.values!.reduce((a, b) => a + b).toString(),
                      style: const TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(BuildContext context) {
    return List.generate(
      widget.values!.length,
      (i) {
        final isTouched = i == touchedIndex;

        final fontSize = isTouched ? 24.0 : 20.0;

        final radius = isTouched ? widget.onHoverRadius : widget.radius;
        const shadows = [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
          ),
        ];
        // Casiers libres
        return PieChartSectionData(
          color: widget.colors == null ? Colors.red : widget.colors![i],
          value: widget.values![i].toDouble(),
          title: widget.values![i].toString(),
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: shadows,
          ),
        );
      },
    );
  }
}
