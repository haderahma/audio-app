import 'package:audio/core/localization/app_string.dart';
import 'package:audio/core/model/model.dart';
import 'package:audio/core/theme/app_color.dart';
import 'package:audio/feature/audio/audio_screen.dart';
import 'package:audio/feature/home/widgets/widget_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key,});
  
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isplay = false;
 int selectedIndex = 0;
  final AudioPlayer audioPlayer = AudioPlayer();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          playList[selectedIndex!].img, 
          height: 300,
          width: double.infinity,
          fit: BoxFit.fill,
          ),
        Positioned(
          left: 20,
          top: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(playList[selectedIndex!].titel, 
              style: TextStyle(
                color: AppColor.pega,
                fontSize: 23,
                fontWeight: FontWeight.bold
              ),),
               Text(playList[selectedIndex!].subtitel,
          style: TextStyle(
            color: AppColor.pega,
            fontSize: 18,
          ),) 
            ],),),
         Padding(
           padding: const EdgeInsets.only(top: 280),
           child: CustomScrollView(
             slivers: [
              SliverToBoxAdapter(child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.maincolor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12)),
                ),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [               
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 30),
                    child: Text(AppString.playList, 
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                         ListView.builder(
                          shrinkWrap: true,
                          itemCount: playList.length,
                           itemBuilder: (BuildContext context, int index) { 
                            return InkWell(onTap: () {
                               setState(() {
                                 selectedIndex = index;
                               });
                               Navigator.push(context, MaterialPageRoute(builder: (context){
                               return AudioScreen(index: index,);
                               }));
                             },
                               child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: selectedIndex == index ? AppColor.activcolor : AppColor.maincolor
                                ),
                                child: ListTitelWidget(index: index, selectedIndex: selectedIndex,),
                                                       ),
                             );
                            },
                         ),
                       ],)      
                       ))
                      ])),
                       Positioned(
                      right: 30,
                      top: 260,
                      child: InkWell(onTap: () {
                     setState(() {
                      isplay = ! isplay;
                      if (isplay){
                           audioPlayer.play(AssetSource(playList[selectedIndex!].player));
                          }else {
                            audioPlayer.pause();
                          }
                        });
                        },
                       child: CircleAvatar(
                      backgroundColor: AppColor.pega,
                      radius: 20,
                      child: Icon(isplay 
                      ? Icons.pause
                      : Icons.play_arrow,size: 30,
                       color: AppColor.white,),
                      ),
               ))
              ]));
  }
}