import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/widgets/txt.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CryptoChartWidget extends StatelessWidget {
  const CryptoChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: SizedBox(
        width: 325,
        height: 250,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(),
              rightTitles: AxisTitles(),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 50,
                  getTitlesWidget: (value, meta) {
                    switch (value.toInt()) {
                      case 1:
                        return Column(
                          children: [
                            txt("MUN", size: 12),
                            txt('10k', size: 12),
                          ],
                        );
                      case 2:
                        return Column(
                          children: [
                            txt("MUN", size: 12),
                            txt('10k', size: 12),
                          ],
                        );
                      case 3:
                        return Column(
                          children: [
                            txt("MUN", size: 12),
                            txt('10k', size: 12),
                          ],
                        );
                      case 4:
                        return Column(
                          children: [
                            txt("MUN", size: 12),
                            txt('10k', size: 12),
                          ],
                        );
                      case 5:
                        return Column(
                          children: [
                            txt("MUN", size: 12),
                            txt('10k', size: 12),
                          ],
                        );
                      case 6:
                        return Column(
                          children: [
                            txt("MUN", size: 12),
                            txt('10k', size: 12),
                          ],
                        );
                      default:
                        return Container();
                    }
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 50,

                  getTitlesWidget: (value, meta) {
                    switch (value.toInt()) {
                      case 1:
                        return txt('10k', size: 12);
                      case 2:
                        return txt('20k', size: 12);
                      case 3:
                        return txt('30k', size: 12);
                      case 4:
                        return txt('40k', size: 12);
                      case 5:
                        return txt('50k', size: 12);
                      default:
                        return Container();
                    }
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),

            minX: 0,
            maxX: 6,
            minY: 0,
            maxY: 5,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 3),
                  FlSpot(1, 1),
                  FlSpot(3, 4),
                  FlSpot(4, 3),
                  FlSpot(5, 4),
                ],
                isCurved: true,
                color: purpleColor,
                shadow: Shadow(
                  blurRadius: 3,
                  color: const Color.fromARGB(87, 102, 82, 254),
                  offset: Offset(0, 3),
                ),
                barWidth: 4,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
