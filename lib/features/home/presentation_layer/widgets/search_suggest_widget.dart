import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/search_suggest_entity.dart';

class SearchSuggestWidget extends StatelessWidget {
  final SearchSuggestEntity item;
  final Function()? onTap;
  const SearchSuggestWidget({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height * 0.08,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.cardBorder),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // product image
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CachedNetworkImage(
                imageUrl: item.image,
                width: width * 0.1,
                height: height * 0.1,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(width: width * 0.04),
            SizedBox(
              width: width * 0.7,
              child: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
