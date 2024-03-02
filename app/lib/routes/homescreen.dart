import 'package:app/themes/themes.dart';
import 'package:app/themes/ui_paramiters.dart';
import 'package:app/widgets/HomeWidget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imgs=[
    "assets/logo/shar1.jpeg",
    "assets/logo/shar2.jpeg",
    "assets/logo/shar3.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    double ScreenHeight=UIParameters.getHeight(context);
    double Screenwidth =UIParameters.getWidth(context);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: ClipPath(
          clipper: CurvedBottomClipper(),
          child: Container(
           child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 0.025 * ScreenHeight,
                ),
                child: SizedBox(
                  height: 0.1 * ScreenHeight,
                  width: 0.15 * ScreenHeight,
                  child: Image.asset("assets/logo/logospace.png"),
                ),
                ),
            ],
           ),
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColors.lightGrey,
        ),
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: imgs.length, 
              itemBuilder: (ctx,i, _) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: UIParameters.cardBorderRadius,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.50),
                          blurRadius: 8.0,
                          spreadRadius: 1.5,
                        ),
                      ],
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imgs[i],
                    imageBuilder: (Context,ImageProvider) =>Container(
                      decoration: BoxDecoration(
                        borderRadius: UIParameters.cardBorderRadius,
                        image: DecorationImage(
                          image: AssetImage(imgs[i]),
                          fit: BoxFit.cover,
                          ),
                      ),
                    ),
                    ),
                );
              }, 
              options:CarouselOptions(
                height: 200,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 2)
              ))
          ],
        ),
      ),
    );
  }
}