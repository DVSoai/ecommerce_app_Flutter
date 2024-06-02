import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    //Tạo một đối tượng Offset đại diện cho một điểm trên bề mặt của widget.
    // Điểm này nằm ở cùng một độ cao nhưng cách xa 20 đơn vị từ đáy widget.
    final firstCurve = Offset(0, size.height - 20);
    //Tạo một đối tượng Offset đại diện cho một điểm trên bề mặt của widget.
    // Điểm này nằm ở độ cao như firstCurve, nhưng cách xa 30 đơn vị từ điểm đầu tiên.
    final lastCurve = Offset(30, size.height-20);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final secondFirstCurve = Offset(0, size.height - 20);
    final secondLastCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy,
        secondLastCurve.dx, secondLastCurve.dy);
    final thirdFirstCurve = Offset(size.width, size.height-20);
    final thirdLastCurve = Offset(size.width , size.height);
    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy, thirdLastCurve.dx, thirdLastCurve.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}