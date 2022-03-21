import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerSpinner extends StatelessWidget {
  ShimmerSpinner({Key? key}) : super(key: key);

  containerShimmer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            )
          ]),
      height: 150,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            child: Container(
              color: Colors.amber,
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.35,
              child: Shimmer.fromColors(
                  child: Container(
                    color: Colors.grey,
                  ),
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[300]!),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.55,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          height: 20,
                        )),
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[300]!),
                Shimmer.fromColors(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Container(
                          height: 20,
                        )),
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[300]!),
                Shimmer.fromColors(
                    child: Container(
                      height: 20,
                    ),
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[300]!),
                Shimmer.fromColors(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          height: 20,
                        )),
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[300]!),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        primary: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) => containerShimmer(context));
  }
}
