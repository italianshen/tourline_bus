import 'package:my_flutter/bussiness/to_buyTicket/model/post_entity_entity.dart';

postEntityEntityFromJson(PostEntityEntity data, Map<String, dynamic> json) {
	if (json['posts'] != null) {
		data.posts = new List<PostEntityPost>();
		(json['posts'] as List).forEach((v) {
			data.posts.add(new PostEntityPost().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> postEntityEntityToJson(PostEntityEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.posts != null) {
		data['posts'] =  entity.posts.map((v) => v.toJson()).toList();
	}
	return data;
}

postEntityPostFromJson(PostEntityPost data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['author'] != null) {
		data.author = json['author']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['imageUrl'] != null) {
		data.imageUrl = json['imageUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> postEntityPostToJson(PostEntityPost entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['author'] = entity.author;
	data['description'] = entity.description;
	data['imageUrl'] = entity.imageUrl;
	return data;
}