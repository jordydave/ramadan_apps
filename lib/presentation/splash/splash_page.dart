part of 'splash_worker.dart';

class SplashPage extends GetState<SplashBloc> with _Worker {
  static const page = '/splash_page';
  SplashPage({super.key});

  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<SplashBloc>(
      container: this,
      context: context,
      init: bloc,
      builder: (controller) => _Body(bloc: controller),
    );
  }
}

class _Body extends StatelessWidget {
  final SplashBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColorDark,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Opacity(opacity: value, child: child),
                  );
                },
                // child: Assets.logoPng.image(fit: BoxFit.cover),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
