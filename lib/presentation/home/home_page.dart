part of 'home_worker.dart';

class HomePage extends GetState<HomeBloc> with _Worker {
  static const page = '/home_page';
  HomePage({super.key});

  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<HomeBloc>(
      container: this,
      context: context,
      init: bloc,
      builder: (controller) => _Body(bloc: controller),
    );
  }
}

class _Body extends StatelessWidget {
  final HomeBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _HomeHeader(),
              const SizedBox(height: 24),
              const _LastReadCard(),
              const SizedBox(height: 24),
              const _QuickActionButtons(),
              const SizedBox(height: 24),
              const _VerseOfTheDay(),
              const SizedBox(height: 24),
              const _PopularReciters(),
            ],
          ),
        ),
      ),
    );
  }
}
