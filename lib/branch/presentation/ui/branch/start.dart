import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:colorful_background/colorful_background.dart';

class PageStartScreen extends StatefulWidget {
  const PageStartScreen({super.key});

  @override
  State<PageStartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<PageStartScreen> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: ColorfulBackground(
  duration: Duration(milliseconds: 1000),
  backgroundColors: [
    const Color(0xFFFF5ACD),
    const Color(0xFFFBDA61),
    const Color(0xFF00AB79),
    const Color(0xFFF7CE68),
    const Color(0xFFFF007D),
  ],

 decoratorsList: [

  ],
  child: Center(
      child: Text('Hello', 
          style: TextStyle(
              fontSize: 40, 
              color: Colors.white)
      )
  )
),

//     AnimatedBackground(
//   behaviour: RandomParticleBehaviour(
//     options: ParticleOptions(
//       baseColor: Colors.blue,
//       spawnOpacity: 0.0,
//       opacityChangeRate: 0.25,
//       minOpacity: 0.1,
//       maxOpacity: 0.4,
//       spawnMinSpeed: 30.0,
//       spawnMaxSpeed: 70.0,
//       spawnMinRadius: 7.0,
//       spawnMaxRadius: 55.0,
//       particleCount: 40,
//     ),
//   ),
//   vsync: this,
//   child: Center(
//       child: Text('Hello', style: TextStyle(fontSize: 40),)
//   ),
// ),

    );
 
  }
}  

  