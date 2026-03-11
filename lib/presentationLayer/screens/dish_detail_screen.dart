import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/constansts.dart';

class DishDetailScreen extends StatelessWidget {
  final String title;
  final String price;

  const DishDetailScreen({super.key, required this.title, required this.price});

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
                  _buildHeroImage(),
                  _buildDishInfo(),
                  _buildPreparationSection(),
                  _buildOrderSection(context),
                  SizedBox(height: 32.h),
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
    );
  }

  Widget _buildHeroImage() {
    return Container(
      height: 220.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Image.network(
          'https://images.unsplash.com/photo-1544025162-d76694265947?w=800',
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: cardBackground,
            child: Icon(Icons.restaurant, size: 64.sp, color: textSecondary),
          ),
        ),
      ),
    );
  }

  Widget _buildDishInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Main Course',
            style: TextStyle(color: textSecondary, fontSize: 12.sp),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: TextStyle(
              color: textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              height: 1.3,
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

  Widget _buildPreparationSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preparation',
            style: TextStyle(
              color: textPrimary,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              _Pill(label: '20 Minutes'),
              SizedBox(width: 12.w),
              _Pill(label: 'Serving Size: 1'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '45.95 JD',
                  style: TextStyle(
                    color: textPrimary,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '+ tax & service',
                  style: TextStyle(color: textSecondary, fontSize: 12.sp),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 160.w,
            child: Material(
              color: appGold,
              borderRadius: BorderRadius.circular(20.r),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  height: 48.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add To Order',
                        style: TextStyle(
                          color: appBackground,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.arrow_forward,
                        color: appBackground,
                        size: 18.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;

  const _Pill({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: pillBackground,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: TextStyle(color: textPrimary, fontSize: 13.sp),
      ),
    );
  }
}
