import 'package:audio/core/model/model.dart';
import 'package:audio/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key, required this.index});
final int index;
  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
   double value = 0;
   bool isplay = false;
   final AudioPlayer audioPlayer = AudioPlayer();
   Duration duration = Duration.zero;
   Duration position = Duration.zero;
  
  @override
  void initState() {
    audioPlayer.onDurationChanged.listen((Duration ondur){
     duration = ondur;
     setState(() { });
    });
     audioPlayer.onPositionChanged.listen((Duration onpos){
     position = onpos;
     setState(() { }); });
    super.initState(
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.maincolor,
      appBar: AppBar(
        backgroundColor: AppColor.maincolor,
        centerTitle: true,
        leading: IconButton(onPressed: () {  
          Navigator.pop(context);
        }, 
        icon: Icon(Icons.arrow_back_ios,color: AppColor.white,)),
        title: Row(spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          CircleAvatar(backgroundColor: AppColor.pega,radius: 5,),
          CircleAvatar(backgroundColor: AppColor.white,radius: 4,)
        ],),
        actions: [
          Icon(Icons.more_vert,color: AppColor.white,)
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 50,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(160),
                  gradient: LinearGradient(colors: [
                    AppColor.activcolor,
                    AppColor.pega
                  ]),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.activcolor,
                      blurStyle: BlurStyle.normal,
                      blurRadius: 100,spreadRadius: 50)
                  ]
                ),
                child: Container(
                  margin: EdgeInsets.all(10),
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150), 
                  image: DecorationImage(fit: BoxFit.fill,
                    image: AssetImage(playList[widget.index].img))
                ),
                 
                )
               ),
               Row(
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(playList[widget.index].titel, 
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                    ),),
                     Text(playList[widget.index].subtitel,
                        style: TextStyle(
                        color: AppColor.white,
                        fontSize: 18,
                     ),) 
                     ],),
                     Spacer(),
                     Icon(Icons.upload, color: AppColor.white,),
                    const SizedBox(width: 16,),
                    Icon(Icons.favorite,color: AppColor.pega,),
                 ],
               ),
               Column(
                 children: [
                   Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    activeColor: AppColor.pega,
                    inactiveColor: AppColor.activcolor,
                     onChanged: (val){
                     audioPlayer.seek(Duration(seconds: val.toInt()));
                       setState(() {
                      });
                   }),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${position.inMinutes}.${position.inSeconds}",
                      style: TextStyle(color: AppColor.white),),
                      Text("${duration.inMinutes}.${duration.inSeconds}",
                       style: TextStyle(color: AppColor.white),)
                    ],
                   )
                 ],
               ),
               Row(spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  Icon(Icons.shuffle,color: AppColor.white,size: 40,),
                  Icon(Icons.skip_previous_outlined,color: AppColor.white,size: 40,),
                   InkWell(onTap: () {
                         setState(() {
                          isplay = ! isplay;
                          if (isplay){
                               audioPlayer.play(AssetSource(playList[widget.index].player));
                          }else {
                            audioPlayer.pause();
                          }
                            });
                            },
                           child: CircleAvatar(
                          backgroundColor: AppColor.pega,
                          radius: 25,
                          child: Icon(isplay 
                          ? Icons.pause
                          : Icons.play_arrow,size: 40,
                           color: AppColor.white,),
                          ),
                   ),
                   Icon(Icons.skip_next_outlined,color: AppColor.white,size: 40,),
                   Icon(Icons.repeat,color: AppColor.white,size: 40,)
                 ],
               )
          ],),
        ),
      ),
    );
  }
}