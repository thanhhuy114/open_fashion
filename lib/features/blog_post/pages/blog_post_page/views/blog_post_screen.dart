/*
  Create by: Thach
  Date: 5/3
  Cotent: Blog Post UI


 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../locator.dart';
import '../bloc/bloc/blog_post_bloc.dart';
import '../widgets/blog_post_body.dart';

class BLogPostScreen extends StatefulWidget {
  const BLogPostScreen({super.key});

  @override
  State<BLogPostScreen> createState() => _BLogPostScreenState();
}

class _BLogPostScreenState extends State<BLogPostScreen> {
  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => sl<BlogPostBloc>()..add(LoadBlogPostEvent()),
      child: const BlogPostBody(),
    );
  }
}
