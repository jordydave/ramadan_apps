part of 'bloc/doa_list_worker.dart';

class DoaListPage extends GetState<DoaListBloc> with _Worker {
  static const page = '/doa_list';

  DoaListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Bottom part is white
      body: Stack(
        children: [
          // Background Header
          Container(
            height: 250,
            width: double.infinity,
            color: AppColor.primaryColor,
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppBar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white.withValues(alpha: 0.1),
                          shape: const CircleBorder(),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'Doa',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.tune, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.search, color: Colors.grey),
                        hintText: 'Search doa...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Categories
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Obx(() {
                    return Row(
                      children: List.generate(bloc.categories.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: CategoryChip(
                            label: bloc.categories[index],
                            isSelected: bloc.selectedCategory.value == index,
                            onTap: () => bloc.selectCategory(index),
                          ),
                        );
                      }),
                    );
                  }),
                ),

                const SizedBox(height: 24),

                // Content
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0XFFF5F7FB), // Light background for list
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: AppColor.goldColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'DAILY ROUTINES',
                                style: AppTextStyles.caption.copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                  color: AppColor.greyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Obx(() {
                            final data = bloc.doaList;
                            return ListView.separated(
                              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                              itemCount: data.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 16),
                              itemBuilder: (context, index) {
                                final item = data[index];
                                return DoaCard(
                                  title: item['title'],
                                  arabic: item['arabic'],
                                  translation: item['translation'],
                                );
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
