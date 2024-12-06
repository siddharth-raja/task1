import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rental/Data/data.dart';
import 'package:rental/Themes/theme.dart';
import 'package:rental/Widgets/hotels.dart';
import 'package:rental/Widgets/location.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static List locations = Data.locations;
  static List hotels = Data.hotels;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Customtheme.white,
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: height * 0.25,
                  width: width,
                  color: Customtheme.appbar,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Explore the world! By\nTravelling', style: TextStyle(fontSize: height * 0.035, fontWeight: FontWeight.w700),),
                        SizedBox(height: height * 0.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.7,
                              height: height * 0.06,
                              child: Center(
                                child: TextField(
                                  expands: true,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.search),
                                    hintText: 'Where did you go?',
                                    fillColor: Customtheme.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none
                                    )
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: height * 0.06,
                              width: width * 0.1,
                              decoration: BoxDecoration(
                                color: Customtheme.white,
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: const Icon(Icons.tune_rounded))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Popular locations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                          const SizedBox(height: 15,),
                          SizedBox(
                            height: height * 0.20,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: locations.length,
                              itemBuilder: (context, index) {
                                return Location(index: index);
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 8,);
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 25,),
                      const Text('Recommended', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                      const SizedBox(height: 15,),
                      SizedBox(
                        height: height * 0.3,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: hotels.length,
                          itemBuilder: (context, index) {
                            return Hotels(index: index, widheight: height*0.20, widwidth: width * 0.55,);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 20,);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: width,
                              height: height * 0.3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl: Data.adImgPath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              height: height * 0.3,
                              width: width,
                              decoration: BoxDecoration(
                                color: Customtheme.overlay,
                                borderRadius: BorderRadius.circular(12)
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hosting Fee for\nas low as 1%', style: TextStyle(color: Customtheme.white, fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  const SizedBox(height: 15,),
                                  Container(
                                    height: height * 0.03,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                      color: Customtheme.red,
                                      borderRadius: BorderRadius.circular(14)
                                    ),
                                    child: Center(
                                      child: Text('Become a Host', style: TextStyle(color: Customtheme.white, fontWeight: FontWeight.w500, fontSize: 12),),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 25,),
                      const Text('Most Viewed', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                      const SizedBox(height: 15,),
                      for(int index = 0; index < hotels.length; index++)
                        Column(
                          children: [
                            Hotels(index: index, widheight: height*0.20, widwidth: width,),
                            const SizedBox(height: 20,)
                          ],
                        )
                    ] 
                  ),
                )
              ]
            ),
          ],
        ),
      )
    );
  }
}