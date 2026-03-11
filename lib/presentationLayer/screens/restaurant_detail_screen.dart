import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/constansts.dart';
import 'dish_detail_screen.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildAppBar(context),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeroSection(),
                  _buildRestaurantInfo(),
                  _buildSectionTitle('Atmosphere'),
                  _buildAtmosphereCarousel(),
                  _buildSectionTitle('Food Menu'),
                  _buildFoodMenuGrid(context),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: textPrimary,
          size: 20,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.person_outline, color: textPrimary, size: 24),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 220.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
        child: Image.network(
          'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=800',
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: cardBackground,
            child: Icon(Icons.restaurant, size: 64.sp, color: textSecondary),
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lorem',
            style: TextStyle(color: textSecondary, fontSize: 12.sp),
          ),
          SizedBox(height: 4.h),
          Text(
            'CEANO',
            style: TextStyle(
              color: textPrimary,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            style: TextStyle(
              color: textSecondary,
              fontSize: 13.sp,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 12.h),
      child: Text(
        title,
        style: TextStyle(
          color: textPrimary,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildAtmosphereCarousel() {
    return SizedBox(
      height: 160.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: 140.w,
            margin: EdgeInsets.only(right: 12.w),
            decoration: BoxDecoration(
              color: cardBackground,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=400',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Icon(Icons.image, color: textSecondary, size: 48.sp),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFoodMenuGrid(BuildContext context) {
    const items = [
      ('Tenderloin Steak with Grilled Vegetables', '49.95 JOD', true),
      ('25 Piece Sushi Boat with Three Sides', '49.95 JOD', false),
      ('25 Piece Sushi Boat with Three Sides', '49.95 JOD', false),
      ('Shared Meal and Drinks', '49.95 JOD', false),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
          childAspectRatio: 0.75,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final (title, price, trending) = items[index];
          return _FoodCard(
            title: title,
            price: price,
            trending: trending,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DishDetailScreen(title: title, price: price),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FoodCard extends StatelessWidget {
  final String title;
  final String price;
  final bool trending;
  final VoidCallback onTap;

  const _FoodCard({
    required this.title,
    required this.price,
    required this.trending,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: cardBackground,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12.r),
                  ),
                  child: SizedBox(
                    height: 100.h,
                    width: double.infinity,
                    child: Image.network(
                      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: pillBackground,
                        child: Icon(
                          Icons.restaurant_menu,
                          color: textSecondary,
                          size: 32.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                if (trending)
                  Positioned(
                    top: 8.h,
                    left: 8.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: appGold,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        'Trending',
                        style: TextStyle(
                          color: appBackground,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 8.h,
                  right: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: appBackground,
                      border: Border.all(color: appGold, width: 1),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      price,
                      style: TextStyle(
                        color: textPrimary,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Text(
                title,
                style: TextStyle(
                  color: textPrimary,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
