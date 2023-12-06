import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CEFFBarChart extends StatefulWidget {
  const CEFFBarChart(
    this.bottomTitles,
    this.bottomData, {
    super.key,
    this.rodsWidth = 26,
    this.colors,
    this.cardWith = 700,
    this.cardHeight = 400,
    this.leftTitlesFontSize = 13,
    this.leftTitlesIndex = 4,
    this.bottomTitlesFontSize = 14,
    this.showRodsBackground = true,
  });

  final double? rodsWidth;
  final List<Color>? colors;
  final double? cardWith;
  final double? cardHeight;

  final bool showRodsBackground;

  final double? bottomTitlesFontSize;
  final List<String> bottomTitles;
  final List<List<double>> bottomData;

  final int? leftTitlesIndex;
  final double leftTitlesFontSize;

  @override
  State<CEFFBarChart> createState() => _CEFFBarChartState();
}

class _CEFFBarChartState extends State<CEFFBarChart> {
  @override
  Widget build(BuildContext context) {
    int touchedIndex = -1;

    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
      child: InkWell(
        child: Container(
          width: widget.cardWith!,
          height: widget.cardHeight!,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 30,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: BarChart(BarChartData(
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.blueGrey,
                      tooltipHorizontalAlignment: FLHorizontalAlignment.right,
                      tooltipMargin: -10,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        String text;
                        // for(var i=0; i<= columnsTooltip.length;i++){
                        text = widget.bottomTitles[group.x];
                        // }
                        return BarTooltipItem(
                          '$text\n',
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: (rod.toY).toInt().toString(),
                              style: TextStyle(
                                color: Colors.green[100],
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    touchCallback: (FlTouchEvent event, barTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            barTouchResponse == null ||
                            barTouchResponse.spot == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex =
                            barTouchResponse.spot!.touchedBarGroupIndex;
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          final Widget text = Text(
                            widget.bottomTitles[value.toInt()],
                            style: TextStyle(
                                fontSize: widget.bottomTitlesFontSize),
                          );
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 16, //margin top
                            child: text,
                          );
                        },
                        reservedSize: 32,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          final style = TextStyle(
                            color: const Color(0xff7589a2),
                            fontWeight: FontWeight.bold,
                            fontSize: widget.leftTitlesFontSize.toDouble(),
                          );
                          String text;

                          if (value % widget.leftTitlesIndex! == 0) {
                            text = value.toInt().toString();
                          } else {
                            return Container();
                          }

                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 0,
                            child: Text(text, style: style),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: List<BarChartGroupData>.generate(
                      widget.bottomData[0].length, (i) {
                    double toY = 0;
                    widget.bottomData.forEach((element) {
                      element.forEach((e) {
                        if (e > toY) toY = e;
                      });
                    });

                    return makeGroupData(
                        i,
                        [
                          for (var j = 0; j < widget.bottomData.length; j++)
                            widget.bottomData[j][i],
                        ],
                        barColors: widget.colors,
                        width: widget.rodsWidth,
                        isTouched: i == touchedIndex,
                        toY: widget.showRodsBackground ? toY : 0);
                  }),
                  gridData: const FlGridData(show: false),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    List<double> bars, {
    double toY = 0,
    bool isTouched = true,
    List<Color>? barColors,
    double? width,
    List<int> showTooltips = const [],
  }) {
    final rods = List<BarChartRodData>.generate(widget.bottomData.length, (i) {
      return BarChartRodData(
        toY: isTouched ? bars[i] + 1 : bars[i],
        color: barColors == null ? Colors.blue : barColors[i],
        width: width,
        borderSide: isTouched
            ? const BorderSide(color: Color(0xFFDAE9F2))
            : const BorderSide(color: Colors.white, width: 0),
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: toY,
          color: const Color(0xFFF2F2F2),
        ),
      );
    });

    return BarChartGroupData(
      x: x,
      barRods: [
        ...rods,
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}
