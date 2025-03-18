import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce_app/models/Product.dart';
import 'package:flutter/material.dart';

class ScrollableTitleWidget extends StatefulWidget {
  final Product product;
  const ScrollableTitleWidget({required this.product});

  @override
  ScrollableTitleWidgetState createState() => ScrollableTitleWidgetState();
}

class ScrollableTitleWidgetState extends State<ScrollableTitleWidget> {
  late ScrollController _scrollController;
  double _titleOpacity = 0.0;
  double _contentTitleOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_updateTitleVisibility);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _updateTitleVisibility() {
    final double expandedHeight = MediaQuery.of(context).size.height * 0.3;
    const double collapsedHeight = kToolbarHeight;
    final double scrollOffset = _scrollController.offset;

    final double opacity = (scrollOffset / (expandedHeight - collapsedHeight))
        .clamp(0.0, 1.0);

    setState(() {
      _titleOpacity = opacity;
      _contentTitleOpacity = 1.0 - opacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            title: Opacity(
              opacity: _titleOpacity,
              child: Text(
                widget.product.title, // This could be a dynamic title based on the product
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.grey.withOpacity(0.2),
                child: _buildImageSlider(context, widget.product),
              ),
            ),
          ),
          // Content title (initially visible, fades out on scroll)
          SliverToBoxAdapter(
            child: Opacity(
              opacity: _contentTitleOpacity,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Fixed Title Header', // You can make this dynamic based on your data
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
          ),
          // Scrollable list content
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return ListTile(title: Text('Item #$index'));
            }, childCount: 50),
          ),
        ],
      ),
    );
  }
}

// Image Slider
Widget _buildImageSlider(BuildContext context, Product product) {
  List<String> images = product.images ?? [];
  return CarouselSlider(
    items:
        images.map((item) {
          return Image.network(
            item,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (
              BuildContext context,
              Widget child,
              ImageChunkEvent? loadingProgress,
            ) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value:
                        loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.expectedTotalBytes != null
                                ? (loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1))
                                : null
                            : null,
                  ),
                );
              }
            },
          );
        }).toList(),
    options: CarouselOptions(
      height:
          MediaQuery.of(context).size.height *
          0.4, // Adjust based on desired height
      autoPlay: true,
      viewportFraction: 1,
    ),
  );
}
