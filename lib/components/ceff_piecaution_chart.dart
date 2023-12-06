import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CEFFPieCautionChart extends StatefulWidget {
  const CEFFPieCautionChart(
    this.text,
    this.cautionPaidLength,
    this.cautionUnpaidLength, {
    this.tooltipMessage = "",
    super.key,
  });
  final String text;
  final String? tooltipMessage;
  final double cautionPaidLength;
  final double cautionUnpaidLength;

  @override
  State<StatefulWidget> createState() => _CautionPieChartWidgetState();
}

class _CautionPieChartWidgetState extends State<CEFFPieCautionChart> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Stack(
              alignment: Alignment.center,
              children: [
                Tooltip(
                  waitDuration: Duration(
                      seconds: widget.tooltipMessage != "" ? 1 : 999999),
                  message: widget.tooltipMessage,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        maximumLabels: 3,
                        minimum: 0,
                        maximum: widget.cautionPaidLength +
                                    widget.cautionUnpaidLength ==
                                0
                            ? 1
                            : widget.cautionPaidLength +
                                widget.cautionUnpaidLength,
                        majorTickStyle: const MajorTickStyle(length: 17),
                        minorTickStyle: const MinorTickStyle(length: 11),
                        ranges: <GaugeRange>[
                          GaugeRange(
                              startWidth: 20,
                              endWidth: 20,
                              startValue: 0,
                              endValue: widget.cautionPaidLength,
                              color: const Color(0xFF01FBCF)),
                          GaugeRange(
                              startWidth: 20,
                              endWidth: 20,
                              startValue: widget.cautionPaidLength,
                              endValue: widget.cautionPaidLength +
                                  widget.cautionUnpaidLength,
                              color: const Color(0xFFFB3274)),
                        ],
                        pointers: <GaugePointer>[
                          MarkerPointer(
                            enableAnimation: true,
                            animationType: AnimationType.ease,
                            value: widget.cautionPaidLength,
                            markerHeight: 15,
                            markerOffset: 2,
                            color: Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Text(
                  "${100 - (widget.cautionUnpaidLength / (widget.cautionPaidLength + widget.cautionUnpaidLength) * 100).toInt()}%",
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
