import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_header/config/constants.dart';
import 'package:news_header/models/news.dart';
import 'package:news_header/providers/headlines.provider.dart';
import 'package:news_header/shared_widget/error_screen.dart';
import 'package:news_header/shared_widget/news_item.loading.dart';
import 'package:news_header/shared_widget/news_item_tile.dart';

class HeadlineScreen extends ConsumerStatefulWidget {
  const HeadlineScreen({
    Key key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HeadlineScreensState();
}

class _HeadlineScreensState extends ConsumerState<HeadlineScreen> {
  final headlineProvider = FutureProvider<List<News>>((ref) async {
    return Future.value(HeadlineProvider().index());
  });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responseValue = ref.watch(headlineProvider);

    final appBar = AppBar(
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      title: const Text(AppString.headlineTitle),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: RefreshIndicator(
        onRefresh: () async => ref.refresh(headlineProvider),
        child: responseValue.when(
            data: (data) => data.isEmpty
                ? ErrorScreen(
                    icon: CupertinoIcons.news,
                    iconColor: Colors.grey,
                    description: AppString.emptyHeadlineDescription,
                    showButton: true,
                    onTap: () => ref.refresh(headlineProvider),
                    title: AppString.emptyHeadlineTitle)
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, item) {
                      return NewsItemTile(
                        news: data[item],
                      );
                    }),
            error: (e, st) => ErrorScreen(
                  title: AppString.error,
                  description: AppString.tryAgain,
                  showButton: true,
                  onTap: () => ref.refresh(headlineProvider),
                ),
            loading: () => ListView.builder(
                itemCount: 10,
                itemBuilder: (context, item) {
                  return const NewsItemLoading();
                })),
      ),
    );
  }
}
