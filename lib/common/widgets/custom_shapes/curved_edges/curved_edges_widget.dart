import 'package:ecommerce_app/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class TCurvedEdgeWidget extends StatelessWidget {

  final Widget? child;

  const TCurvedEdgeWidget({super.key, this.child});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper:TCustomCurvedEdges(),
      child: child,
    );
  }

}