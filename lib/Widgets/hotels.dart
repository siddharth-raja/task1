import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rental/Data/data.dart';
import 'package:rental/Themes/theme.dart';

class Hotels extends StatelessWidget {
  final int index;
  final double widheight;
  final double widwidth;
  final double radius;
  final double iconsize;
  const Hotels({super.key, required this.index, required this.widheight, required this.widwidth, required this.radius, required this.iconsize});

  static List hotels = Data.hotels;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            SizedBox(
              height: widheight,
              width: widwidth,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: hotels[index]['imgpath'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                height: radius,
                width: radius,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Customtheme.white
                ),
                child: Icon(Icons.favorite_rounded, size: iconsize, color: Customtheme.lightgrey,),
              ),
            )
          ],
        ),
        const SizedBox(height: 10,),
        SizedBox(
          width: widwidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("\$${hotels[index]['amount']} ", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                  Row(
                    children: [
                      Text("/ ${hotels[index]['shift']}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),),
                      Icon(hotels[index]['shift'] == 'Night' ? Icons.flash_on : Icons.sunny, size: 12, color: Customtheme.orange,)
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.star, color: Customtheme.red, size: 12,),
                  const SizedBox(width: 5,),
                  Text(hotels[index]['favorites'], style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),)
                ],
              ),
              Text(hotels[index]['hotelname'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),),
              Text(hotels[index]['roomtype'], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Customtheme.grey),)
            ],
          ),
        )
      ],
    );
  }
}