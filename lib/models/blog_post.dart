import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_post.g.dart';

/* 
  Create by: Thach
  date: 3/5/2024 10:00
  Conent: BlogPostResponseModel class, BlogPostModel class

  Modify: 
*/
@JsonSerializable()
class BLogPostResponseModel extends Equatable {
  BLogPostResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  final int? code;
  static const String codeKey = "code";

  final String? message;
  static const String messageKey = "message";

  final BlogPostModel? data;
  static const String dataKey = "data";

  factory BLogPostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BLogPostResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BLogPostResponseModelToJson(this);

  @override
  String toString() {
    return "$code, $message, $data, ";
  }

  @override
  List<Object?> props() => [
        code,
        message,
        data,
      ];
}

@JsonSerializable()
class BlogPostModel extends Equatable {
  BlogPostModel({
    required this.postBy,
    required this.titlePost,
    required this.content,
    required this.mainPicture,
    required this.imageArray,
    required this.postDate,
    required this.tag,
  });

  @JsonKey(name: 'post_by')
  final String? postBy;
  static const String postByKey = "post_by";

  @JsonKey(name: 'title_post')
  final String? titlePost;
  static const String titlePostKey = "title_post";

  final String? content;
  static const String contentKey = "content";

  @JsonKey(name: 'main_picture')
  final String? mainPicture;
  static const String mainPictureKey = "main_picture";

  @JsonKey(name: 'image_array')
  final List<String>? imageArray;
  static const String imageArrayKey = "image_array";

  @JsonKey(name: 'post_date')
  final String? postDate;
  static const String postDateKey = "post_date";

  final List<String>? tag;
  static const String tagKey = "tag";

  factory BlogPostModel.fromJson(Map<String, dynamic> json) =>
      _$BlogPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$BlogPostModelToJson(this);

  @override
  String toString() {
    return "$postBy, $titlePost, $content, $mainPicture, $imageArray, $postDate, $tag, ";
  }

  @override
  List<Object?> props() => [
        postBy,
        titlePost,
        content,
        mainPicture,
        imageArray,
        postDate,
        tag,
      ];
}


/*
{
	"code": 1,
	"message": "Success",
	"data": {
		"post_by": "OpenFashion",
		"title_post": "\"2021 Style Guide: The Biggest Fall Trends\"",
		"content": "You guys know how much I love mixing high and low-end – it’s the best way to get the most bang for your buck while still elevating your wardrobe. The same goes for handbags! And honestly they are probably the best pieces to mix and match. I truly think the key to completing a look is with a great bag and I found so many this year that I wanted to share a round-up of my most worn handbags. I found this Saint Laurent canvas handbag this summer and immediately fell in love. The neutral fabrics are so beautiful and I like how this handbag can also carry into fall. The mini Fendi bucket bag with the sheer fabric is so fun and such a statement bag. Also this DeMellier off white bag is so cute to carry to a dinner with you or going out, it’s small but not too small to fit your phone and keys still.",
		"main_picture": "https://s3-alpha-sig.figma.com/img/3e4e/55fc/5723b9872491c08de91ab3a7dbab08e1?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=W0EonS9W6KoQXEJq~Flg~v5FAH5Tni9NFiMp3nvNBykcuW-nBhtAmm0yjX9hdiHX~bWGld2nSlBR8bqrP9G7dEdhWRnuKRdZFbBoXdHEjJ9rXP~ICgJvDraV4e9OsPNiA1ZI1SZJ1i-ZdwrE7XQ0PD22cKO~paGLf3dcV2M5G~tsJhpgv9REH-J1reRsFC2f5A5c22AE77eTo3fk4DAnxJWOFB9RbF2H6Sgn~znM5WLlD9TCVIlHLs1unmSKd3PY0FyEjEylB61RJRAxbAxNTmtOMj0486qkp3OMgzyA7atT2CWf5uw8pB7QNP9xy30EM3MfxBjY4QbBJtVY6J7DpQ__",
		"image_array": [
			"https://s3-alpha-sig.figma.com/img/083c/b225/fe97b2af6eaac17f0945931566cf75f8?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=iEo2n0k0~gyQ-LvSRMYosgQjqeQXdTUnZ-3aNQhgZCxbqAHVDeP9pIkt8B2cFC3TQZbSPykxre3oRAbkKlfQCHyhfDrhAEWLLdLbpoepWVkxqv3CjjAxB6uB69ED~gtmobCYJRETAsnRqtuttqvrAMc85pvmfM1tVEiEDrX-sOkUb23xwYc6gSbnkKG6fqoxg10-fJISSkZ4paLT07eQ07kWAyeyS3Pd4RWcorH3v5B9qmhtD-m6rLivm8GN0mBhfwpFjbddaualec9fk1Ym2XnkgTU09wK-VVt3YWojk5gedGUC6mIumQjeh7tm18GQOYJghkzrYi6hZ1kdiZoI4w__",
			"https://s3-alpha-sig.figma.com/img/083c/b225/fe97b2af6eaac17f0945931566cf75f8?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=iEo2n0k0~gyQ-LvSRMYosgQjqeQXdTUnZ-3aNQhgZCxbqAHVDeP9pIkt8B2cFC3TQZbSPykxre3oRAbkKlfQCHyhfDrhAEWLLdLbpoepWVkxqv3CjjAxB6uB69ED~gtmobCYJRETAsnRqtuttqvrAMc85pvmfM1tVEiEDrX-sOkUb23xwYc6gSbnkKG6fqoxg10-fJISSkZ4paLT07eQ07kWAyeyS3Pd4RWcorH3v5B9qmhtD-m6rLivm8GN0mBhfwpFjbddaualec9fk1Ym2XnkgTU09wK-VVt3YWojk5gedGUC6mIumQjeh7tm18GQOYJghkzrYi6hZ1kdiZoI4w__",
			"https://s3-alpha-sig.figma.com/img/083c/b225/fe97b2af6eaac17f0945931566cf75f8?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=iEo2n0k0~gyQ-LvSRMYosgQjqeQXdTUnZ-3aNQhgZCxbqAHVDeP9pIkt8B2cFC3TQZbSPykxre3oRAbkKlfQCHyhfDrhAEWLLdLbpoepWVkxqv3CjjAxB6uB69ED~gtmobCYJRETAsnRqtuttqvrAMc85pvmfM1tVEiEDrX-sOkUb23xwYc6gSbnkKG6fqoxg10-fJISSkZ4paLT07eQ07kWAyeyS3Pd4RWcorH3v5B9qmhtD-m6rLivm8GN0mBhfwpFjbddaualec9fk1Ym2XnkgTU09wK-VVt3YWojk5gedGUC6mIumQjeh7tm18GQOYJghkzrYi6hZ1kdiZoI4w__"
		],
		"post_date": "3/5/2024",
		"tag": [
			"Fashion",
			"Tips"
		]
	}
}*/