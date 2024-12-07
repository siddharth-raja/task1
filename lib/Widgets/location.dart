import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rental/Data/data.dart';
import 'package:rental/Themes/theme.dart';

class Location extends StatelessWidget {
  final int index;
  const Location({super.key, required this.index});

  static List locations = Data.locations;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: height*0.20,
          width: width*0.34,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: locations[index]['imgpath'],
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: Text(locations[index]['name'], style: TextStyle(color: Customtheme.white, fontSize: 13, fontWeight: FontWeight.w600))
        )
      ],
    );
  }
}