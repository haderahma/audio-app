import 'package:audio/core/model/model.dart';
import 'package:audio/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class ListTitelWidget extends StatelessWidget {
  const ListTitelWidget({super.key, required this.index, required this.selectedIndex});
 final int index;
 final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return ListTile( 
               leading: Container(
               height: 100,
               width: 60,
               decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(12),
               image: DecorationImage(fit: BoxFit.fill,
               image: AssetImage(playList[index].img,),)
                ),
                ),
               title: Text(playList[index].titel, 
                style: TextStyle(
                color: AppColor.white,
                fontSize: 18,
                fontWeight: FontWeight.bold
                ),),
                subtitle: Text(playList[index].subtitel, 
                style: TextStyle(
                color: AppColor.white,
                fontSize: 16,
                ),),
               trailing: Icon(selectedIndex == index ? Icons.equalizer
                : Icons.favorite,color: AppColor.pega,),
                );
  }
}