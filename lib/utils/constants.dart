import 'package:flutter/material.dart';

LinearGradient kGradientShimmer = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Colors.grey[400],
    Colors.grey[100],
  ],
);


RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc = (Match match) => '${match[1]}.';