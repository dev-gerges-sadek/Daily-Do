import 'package:flutter/material.dart';
import 'package:nti_final_project/app/routes/app_routes.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import 'package:nti_final_project/core/style/app_colors.dart';
import 'package:nti_final_project/core/style/app_text_style.dart';
import 'package:nti_final_project/features/auth/widgets/custome_category_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<_OnboardingItem> _items = const [
    _OnboardingItem(
      image: "assets/images/onbording3.jpeg",
      text:
          "Plan your tasks to do, that way you'll stay organized and you won't skip any",
    ),
    _OnboardingItem(
      image: "assets/images/onbording4.jpeg",
      text:
          "Create a team task, invite people and manage your work together",
    ),
    _OnboardingItem(
      image: "assets/images/onbording2.jpeg",
      text: "Your informations are secure with us",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < _items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.singin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.w(15)),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _items.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ✅ صورة بحجم مظبوط
                        SizedBox(
                          height: context.h(250), // غير الرقم حسب ما يعجبك
                          child: Image.asset(
                            item.image,
                            fit: BoxFit.contain,
                          ),
                        ),

                        SizedBox(height: context.h(25)),

                        Text(
                          item.text,
                          style: AppStyle.body18White.copyWith(
                            fontSize: context.sp(18),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: context.h(20)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _items.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: context.w(4)),
                    width: _currentIndex == index
                        ? context.w(16)
                        : context.w(8),
                    height: context.h(8),
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? AppColors.whiteColor
                          : AppColors.greyText,
                      borderRadius: BorderRadius.circular(context.r(8)),
                    ),
                  ),
                ),
              ),

              SizedBox(height: context.h(30)),

              SizedBox(
                width: double.infinity,
                child: CustomeCategoryButton(
                  text: _currentIndex == _items.length - 1 ? 'Start' : 'Next',
                  onTap: _nextPage,
                ),
              ),

              SizedBox(height: context.h(20)),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingItem {
  final String image;
  final String text;

  const _OnboardingItem({
    required this.image,
    required this.text,
  });
}
