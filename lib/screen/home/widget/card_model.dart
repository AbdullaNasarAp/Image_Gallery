import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../../../controller/get_image_controller.dart';

class CardModel extends StatelessWidget {
  const CardModel({
    super.key,
    required this.value,
  });
  final HomeProvider value;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: value.scrollController,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: value.photos.length + (value.hasMore ? 1 : 0),
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        if (index == value.photos.length) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            value.photos[index].url!['small'],
            fit: BoxFit.cover,
          ),
        );
      },
      staggeredTileBuilder: (context) {
        return const StaggeredTile.fit(1);
      },
    );
  }
}
