import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}



class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {

    // double _height = MediaQuery.of(context).size.height;
    // double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("ClipPath Widget"),
        titleTextStyle: TextStyle(color: Colors.white),
        centerTitle: true,
      ),

      body: ClipPath(
        clipper: MyClipper() ,
        child: Container(
          height:400,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.orange,
          )
        ),
      ),
    );
  }
}



// Differnet 1 ta widget
class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
     final path =  Path();

     path.lineTo(0, 0); // 1st point
     path.lineTo(0, size.height); // 2nd point

     path.quadraticBezierTo(// 1st start and  end point
         size.width*0.20, size.height-50,
         size.width*0.5, size.height-35,
     );

     path.quadraticBezierTo(// 2nd start and  end point
       size.width*0.80, size.height-30,
       size.width, size.height-130,
     );

     path.lineTo(size.width, size.height); // 4th point
     path.lineTo(size.width, 0); // 5th point


     path.close();
     return path; // close, return are must needed

  }


  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {
    return true;
  }

}
