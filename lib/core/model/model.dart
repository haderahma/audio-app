
import 'package:audio/core/localization/app_string.dart';

class Model {
 final String img;
 final String titel;
 final String subtitel;
 final String player;


  Model({
    required this.player,
    required this.titel,
    required this.subtitel,
    required this.img
    });
}


List<Model> playList = [
Model(
  subtitel: AppString.maher,
  titel: AppString.palestine, 
  img: "assets/images/maher_zain1.jpg", 
  player: "Palestine_Will_Be_Free.mp3"
  ),
Model(
  subtitel: AppString.maher, 
  titel: AppString.assalamu, 
  img: "assets/images/maher_zain2.jpg", 
  player: "Assalamu_Alaika_ar.mp3"
  
  ),
Model(
  subtitel: AppString.maher, 
  titel: AppString.radito, 
  img: "assets/images/maher_zain3.jpg", 
  player: "radito_billah_ar.mp3"
  ),
Model(
  subtitel: AppString.maher, 
  titel: AppString.waheshna, 
  img: "assets/images/maher_zain4.jpg", 
  player: "Waheshna_ya_rasoul_allah.mp3"
  ),
Model(
  subtitel: AppString.maher, 
  titel: AppString.baraka, 
  img: "assets/images/maher_zain1.jpg", 
  player: "Baraka_Allahu_Lakuma.mp3"
  ),
Model(
  subtitel: AppString.mishari, 
  titel: AppString.rahman, 
  img: "assets/images/mishari_alafasy1.jpg", 
  player: "111.mp3"
  ),
  Model(
  subtitel: AppString.maher,
  titel: AppString.palestine, 
  img: "assets/images/maher_zain1.jpg", 
  player: "Palestine_Will_Be_Free.mp3"
  ),
Model(
  subtitel: AppString.maher, 
  titel: AppString.assalamu, 
  img: "assets/images/maher_zain2.jpg", 
  player: "Assalamu_Alaika_ar.mp3"
  
  ),
Model(
  subtitel: AppString.maher, 
  titel: AppString.radito, 
  img: "assets/images/maher_zain3.jpg", 
  player: "radito_billah_ar.mp3"
  ),

];

