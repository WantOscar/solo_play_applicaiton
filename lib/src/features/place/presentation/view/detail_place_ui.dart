import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/core/widgets/bookmark_icon.dart';
import 'package:solo_play_application/src/features/place/data/models/place_model.dart';
import 'package:solo_play_application/src/features/place/presentation/cubit/place_cubit.dart';
import 'package:solo_play_application/src/features/course/presentation/views/course_map_view.dart';
import 'package:solo_play_application/src/features/place/presentation/view/place_visit_review_view.dart';
import 'package:solo_play_application/src/features/place/presentation/view/similar_cafe_photo_view.dart';
import 'package:solo_play_application/src/features/place/presentation/widgets/best_place_card_widget.dart';

class DetailPlaceUI extends StatelessWidget {
  final int rank;
  final PlaceModel place;
  const DetailPlaceUI({super.key, required this.rank, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          leading: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          elevation: 0.0,
          title: const Text(
            'mwm',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: BookmarkIcon(
                onTap: context.read<PlaceCubit>().toggle,
                isBookmarked: context.watch<PlaceCubit>().state.isFavorite,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: BestPlaceCardWidget(
                rank: rank,
                place: place,
                showHeader: false,
              ),
            ),
            const SizedBox(height: 10),
            const CourseMapView(),
            const SizedBox(height: 10),
            const PlaceVisitReviewView(),
            const SizedBox(height: 10),
            const SimilarCafePhotoView(),
            const SizedBox(height: 110),
          ],
        ),
      ),
    );
  }
}
