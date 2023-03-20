import 'package:flutter/material.dart';
import 'package:RaceHub/list_generator.dart';

class SingleSeriesCalendar extends StatelessWidget {
  const SingleSeriesCalendar({
    Key? key,
    required this.seriesNum,
  }) : super(key: key);

  final int seriesNum;

  @override
  Widget build(BuildContext context) {
    double imageWidth = 50;
    String seriesName = "undefined";
    DateTime datetime = DateTime.now();
    Color seriesColor = Colors.white;
    Image seriesLogo = Image.asset("images/wec_logo.png", width: imageWidth);
    Image seriesPicture = Image.asset("images/series_images/9x8.jpeg");
    switch (seriesNum) {
      case 0:
        {
          seriesName = "Formula 1";
          seriesColor = Color(0xFFFF1801);
          seriesLogo = Image.asset("images/f1_logo.png", width: imageWidth);
          seriesPicture = Image.asset("images/series_images/9x8.jpeg");
          break;
        }
      case 1:
        {
          seriesName = "World Endurance Championship";
          seriesColor = Color(0xFF8BC63E);
          seriesLogo = Image.asset("images/wec_logo.png", width: imageWidth);
          seriesPicture = Image.asset("images/series_images/9x8.jpeg");
          break;
        }
      case 2:
        seriesName = "IMSA";
        seriesColor = Color(0xFF8BC63E);
        seriesLogo = Image.asset("images/imsa_logo.png", width: imageWidth);
        seriesPicture = Image.asset("images/series_images/9x8.jpeg");
        break;
      case 3:
        {
          seriesName = "NTT Indycar Series";
          seriesColor = Color(0xFF0086BF);
          seriesLogo =
              Image.asset("images/indycar_logo.png", width: imageWidth);
          seriesPicture = Image.asset("images/series_images/ericsson.jpg");
          break;
        }
      case 4:
        {
          seriesName = "World Rally Championship";
          seriesColor = Color(0xFFFC4C02);
          seriesLogo = Image.asset("images/wrc_logo.png", width: imageWidth);
          seriesPicture = Image.asset("images/series_images/rally_toyota.jpg");
          break;
        }
      case 5:
        {
          seriesName = "Repco Supercars Championship";
          seriesColor = Color(0xFF000000);
          seriesLogo =
              Image.asset("images/supercars_logo.png", width: imageWidth);
          seriesPicture =
              Image.asset("images/series_images/supercars_interior.jpg");
          break;
        }
      case 6:
        {
          seriesName = "ABB FIA Formula E World Championship";
          seriesColor = Color(0xFF1487ED);
          seriesLogo =
              Image.asset("images/formula_e_logo.png", width: imageWidth);
          seriesPicture =
              Image.asset("images/series_images/formula_e_threewide.jpg");
          break;
        }
      case 7:
        {
          seriesName = "Super Formula";
          seriesColor = const Color(0xFFff00c2);
          seriesLogo =
              Image.asset("images/super_formula_logo.png", width: imageWidth);
          seriesPicture = Image.asset("images/series_images/superformula.jpg");
          break;
        }
      case 8:
        {
          seriesName = "W Series";
          seriesColor = Color(0xFF440099);
          seriesLogo =
              Image.asset("images/w_series_logo.png", width: imageWidth);
          seriesPicture = Image.asset("images/series_images/powell_moore.jpg");
          break;
        }
      case 9:
        {
          seriesName = "GT Europe";
          seriesColor = Color(0xFFFFFF00);
          seriesLogo =
              Image.asset("images/gt_europe_logo.png", width: imageWidth);
          seriesPicture = Image.asset("images/series_images/rally_toyota.jpg");
          break;
        }
      case 10:
        {
          seriesName = "TCR Europe";
          seriesColor = Color(0x5F000000);
          seriesLogo = Image.asset("images/tcr_logo.png", width: imageWidth);
          break;
        }
      case 11:
        {
          seriesName = "Praga Cup UK";
          seriesColor = Color(0x5F000000);
          seriesLogo =
              Image.asset("images/praga_cup_logo.png", width: imageWidth);
          break;
        }
      case 12:
        {
          seriesName = "Formula 2";
          seriesColor = Color(0x5F000000);
          seriesLogo = Image.asset("images/f2_logo.png", width: imageWidth);
          break;
        }
      case 13:
        {
          seriesName = "Formula 3";
          seriesColor = Color(0x5F000000);
          seriesLogo = Image.asset("images/f3_logo.png", width: imageWidth);
          break;
        }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(seriesName),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0),
          ),
        ),
        backgroundColor: seriesColor,
      ),
      body: list_generator([seriesNum], seriesName, seriesColor, seriesLogo,
          seriesPicture, true, context),
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.white.withOpacity(1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.99],
          ),
        ),
      ),
    );
  }
}
