import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoader extends StatefulWidget {
  final Widget child;
  bool isLoaded;

  SkeletonLoader({super.key, required this.child, this.isLoaded = true});


  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isLoaded ?  Shimmer.fromColors(
        baseColor: Color(0xffD1D1D1),
        highlightColor: Color(0xffD9D9D9),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Color(0xffE6E6E6)),
          child: widget.child
        )) : widget.child;
  }
}

