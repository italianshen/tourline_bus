import 'package:my_flutter/generated/json/base/json_convert_content.dart';

class PostEntityEntity with JsonConvert<PostEntityEntity> {
	List<PostEntityPost> posts;
}

class PostEntityPost with JsonConvert<PostEntityPost> {
	int id;
	String title;
	String author;
	String description;
	String imageUrl;
}
