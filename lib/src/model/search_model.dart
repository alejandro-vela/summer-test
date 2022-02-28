// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

SearchResponse searchResponseFromJson(String str) =>
    SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  SearchResponse({
    required this.data,
    required this.pagination,
    required this.meta,
  });

  List<Datum> data;
  Pagination pagination;
  Meta meta;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
        pagination: Pagination.fromJson(json['pagination']),
        meta: Meta.fromJson(json['meta']),
      );

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
        'pagination': pagination.toJson(),
        'meta': meta.toJson(),
      };
}

class Datum {
  Datum({
    required this.type,
    required this.id,
    required this.url,
    required this.slug,
    required this.bitlyGifUrl,
    required this.bitlyUrl,
    required this.embedUrl,
    required this.username,
    required this.source,
    required this.title,
    required this.rating,
    required this.contentUrl,
    required this.sourceTld,
    required this.sourcePostUrl,
    required this.isSticker,
    required this.importDatetime,
    required this.trendingDatetime,
    required this.images,
    required this.analyticsResponsePayload,
  });

  String type;
  String id;
  String url;
  String slug;
  String bitlyGifUrl;
  String bitlyUrl;
  String embedUrl;
  String username;
  String source;
  String title;
  String rating;
  String contentUrl;
  String sourceTld;
  String sourcePostUrl;
  int isSticker;
  String importDatetime;
  String trendingDatetime;
  Images images;
  String analyticsResponsePayload;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json['type'],
        id: json['id'],
        url: json['url'],
        slug: json['slug'],
        bitlyGifUrl: json['bitly_gif_url'],
        bitlyUrl: json['bitly_url'],
        embedUrl: json['embed_url'],
        username: json['username'],
        source: json['source'],
        title: json['title'],
        rating: json['rating'],
        contentUrl: json['content_url'],
        sourceTld: json['source_tld'],
        sourcePostUrl: json['source_post_url'],
        isSticker: json['is_sticker'],
        importDatetime: json['import_datetime'],
        trendingDatetime: json['trending_datetime'],
        images: Images.fromJson(json['images']),
        analyticsResponsePayload: json['analytics_response_payload'],
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'url': url,
        'slug': slug,
        'bitly_gif_url': bitlyGifUrl,
        'bitly_url': bitlyUrl,
        'embed_url': embedUrl,
        'username': username,
        'source': source,
        'title': title,
        'rating': rating,
        'content_url': contentUrl,
        'source_tld': sourceTld,
        'source_post_url': sourcePostUrl,
        'is_sticker': isSticker,
        'import_datetime': importDatetime,
        'trending_datetime': trendingDatetime,
        'images': images.toJson(),
        'analytics_response_payload': analyticsResponsePayload,
      };
}

class Onclick {
  Onclick({
    required this.url,
  });

  String url;

  factory Onclick.fromJson(Map<String, dynamic> json) => Onclick(
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'url': url,
      };
}

class Images {
  Images({
    required this.original,
    required this.downsized,
    required this.downsizedLarge,
    required this.downsizedMedium,
    required this.downsizedSmall,
    required this.downsizedStill,
    required this.fixedHeight,
    required this.fixedHeightDownsampled,
    required this.fixedHeightSmall,
    required this.fixedHeightSmallStill,
    required this.fixedHeightStill,
    required this.fixedWidth,
    required this.fixedWidthDownsampled,
    required this.fixedWidthSmall,
    required this.fixedWidthSmallStill,
    required this.fixedWidthStill,
    required this.looping,
    required this.originalStill,
    required this.preview,
    required this.previewGif,
    required this.the480WStill,
  });

  Original original;
  Downsized downsized;
  DownsizedLarge downsizedLarge;
  DownsizedLarge downsizedMedium;
  DownsizedSmall downsizedSmall;
  Downsized downsizedStill;
  FixedHeight fixedHeight;
  FixedDownsampled fixedHeightDownsampled;
  FixedSmall fixedHeightSmall;
  Downsized fixedHeightSmallStill;
  DownsizedLarge fixedHeightStill;
  FixedWidth fixedWidth;
  FixedDownsampled fixedWidthDownsampled;
  FixedSmall fixedWidthSmall;
  Downsized fixedWidthSmallStill;
  DownsizedLarge fixedWidthStill;
  Looping looping;
  DownsizedLarge originalStill;

  DownsizedSmall preview;
  Downsized previewGif;
  The480WStill the480WStill;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        original: Original.fromJson(json['original']),
        downsized: Downsized.fromJson(json['downsized']),
        downsizedLarge: DownsizedLarge.fromJson(json['downsized_large']),
        downsizedMedium: DownsizedLarge.fromJson(json['downsized_medium']),
        downsizedSmall: DownsizedSmall.fromJson(json['downsized_small']),
        downsizedStill: Downsized.fromJson(json['downsized_still']),
        fixedHeight: FixedHeight.fromJson(json['fixed_height']),
        fixedHeightDownsampled:
            FixedDownsampled.fromJson(json['fixed_height_downsampled']),
        fixedHeightSmall: FixedSmall.fromJson(json['fixed_height_small']),
        fixedHeightSmallStill:
            Downsized.fromJson(json['fixed_height_small_still']),
        fixedHeightStill: DownsizedLarge.fromJson(json['fixed_height_still']),
        fixedWidth: FixedWidth.fromJson(json['fixed_width']),
        fixedWidthDownsampled:
            FixedDownsampled.fromJson(json['fixed_width_downsampled']),
        fixedWidthSmall: FixedSmall.fromJson(json['fixed_width_small']),
        fixedWidthSmallStill:
            Downsized.fromJson(json['fixed_width_small_still']),
        fixedWidthStill: DownsizedLarge.fromJson(json['fixed_width_still']),
        looping: Looping.fromJson(json['looping']),
        originalStill: DownsizedLarge.fromJson(json['original_still']),
        preview: DownsizedSmall.fromJson(json['preview']),
        previewGif: Downsized.fromJson(json['preview_gif']),
        the480WStill: The480WStill.fromJson(json['480w_still']),
      );

  Map<String, dynamic> toJson() => {
        'original': original.toJson(),
        'downsized': downsized.toJson(),
        'downsized_large': downsizedLarge.toJson(),
        'downsized_medium': downsizedMedium.toJson(),
        'downsized_small': downsizedSmall.toJson(),
        'downsized_still': downsizedStill.toJson(),
        'fixed_height': fixedHeight.toJson(),
        'fixed_height_downsampled': fixedHeightDownsampled.toJson(),
        'fixed_height_small': fixedHeightSmall.toJson(),
        'fixed_height_small_still': fixedHeightSmallStill.toJson(),
        'fixed_height_still': fixedHeightStill.toJson(),
        'fixed_width': fixedWidth.toJson(),
        'fixed_width_downsampled': fixedWidthDownsampled.toJson(),
        'fixed_width_small': fixedWidthSmall.toJson(),
        'fixed_width_small_still': fixedWidthSmallStill.toJson(),
        'fixed_width_still': fixedWidthStill.toJson(),
        'looping': looping.toJson(),
        'original_still': originalStill.toJson(),
        'preview': preview.toJson(),
        'preview_gif': previewGif.toJson(),
        '480w_still': the480WStill.toJson(),
      };
}

class Downsized {
  Downsized({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });

  String height;
  String width;
  String size;
  String url;

  factory Downsized.fromJson(Map<String, dynamic> json) => Downsized(
        height: json['height'],
        width: json['width'],
        size: json['size'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
        'size': size,
        'url': url,
      };
}

class DownsizedLarge {
  DownsizedLarge({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });

  String height;
  String width;
  String size;
  String url;

  factory DownsizedLarge.fromJson(Map<String, dynamic> json) => DownsizedLarge(
        height: json['height'],
        width: json['width'],
        size: json['size'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
        'size': size,
        'url': url,
      };
}

class DownsizedSmall {
  DownsizedSmall({
    required this.height,
    required this.width,
    required this.mp4Size,
    required this.mp4,
  });

  String height;
  String width;
  String mp4Size;
  String mp4;

  factory DownsizedSmall.fromJson(Map<String, dynamic> json) => DownsizedSmall(
        height: json['height'],
        width: json['width'],
        mp4Size: json['mp4_size'],
        mp4: json['mp4'],
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
        'mp4_size': mp4Size,
        'mp4': mp4,
      };
}

class FixedHeight {
  FixedHeight({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.mp4Size,
    required this.mp4,
    required this.webpSize,
    required this.webp,
  });

  String height;
  String width;
  String size;
  String url;
  String mp4Size;
  String mp4;
  String webpSize;
  String webp;

  factory FixedHeight.fromJson(Map<String, dynamic> json) => FixedHeight(
        height: json['height'],
        width: json['width'],
        size: json['size'],
        url: json['url'],
        mp4Size: json['mp4_size'],
        mp4: json['mp4'],
        webpSize: json['webp_size'],
        webp: json['webp'],
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
        'size': size,
        'url': url,
        'mp4_size': mp4Size,
        'mp4': mp4,
        'webp_size': webpSize,
        'webp': webp,
      };
}

class FixedDownsampled {
  FixedDownsampled({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.webpSize,
    required this.webp,
  });

  String height;
  String width;
  String size;
  String url;
  String webpSize;
  String webp;

  factory FixedDownsampled.fromJson(Map<String, dynamic> json) =>
      FixedDownsampled(
        height: json['height'],
        width: json['width'],
        size: json['size'],
        url: json['url'],
        webpSize: json['webp_size'],
        webp: json['webp'],
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
        'size': size,
        'url': url,
        'webp_size': webpSize,
        'webp': webp,
      };
}

class FixedSmall {
  FixedSmall({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.mp4Size,
    required this.mp4,
    required this.webpSize,
    required this.webp,
  });

  String height;
  String width;
  String size;
  String url;
  String mp4Size;
  String mp4;
  String webpSize;
  String webp;

  factory FixedSmall.fromJson(Map<String, dynamic> json) => FixedSmall(
        height: json['height'],
        width: json['width'],
        size: json['size'],
        url: json['url'],
        mp4Size: json['mp4_size'],
        mp4: json['mp4'],
        webpSize: json['webp_size'],
        webp: json['webp'],
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
        'size': size,
        'url': url,
        'mp4_size': mp4Size,
        'mp4': mp4,
        'webp_size': webpSize,
        'webp': webp,
      };
}

class FixedWidth {
  FixedWidth({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.mp4Size,
    required this.mp4,
    required this.webpSize,
    required this.webp,
  });

  String height;
  String width;
  String size;
  String url;
  String mp4Size;
  String mp4;
  String webpSize;
  String webp;

  factory FixedWidth.fromJson(Map<String, dynamic> json) => FixedWidth(
        height: json['height'],
        width: json['width'],
        size: json['size'],
        url: json['url'],
        mp4Size: json['mp4_size'],
        mp4: json['mp4'],
        webpSize: json['webp_size'],
        webp: json['webp'],
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
        'size': size,
        'url': url,
        'mp4_size': mp4Size,
        'mp4': mp4,
        'webp_size': webpSize,
        'webp': webp,
      };
}

class OriginalMp4 {
  OriginalMp4({
    required this.height,
    required this.width,
    required this.mp4Size,
    required this.mp4,
  });

  String height;
  String width;
  String mp4Size;
  String mp4;

  factory OriginalMp4.fromJson(Map<String, dynamic> json) => OriginalMp4(
        height: json['height'],
        width: json['width'],
        mp4Size: json['mp4_size'],
        mp4: json['mp4'],
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
        'mp4_size': mp4Size,
        'mp4': mp4,
      };
}

class Looping {
  Looping({
    required this.mp4Size,
    required this.mp4,
  });

  String mp4Size;
  String mp4;

  factory Looping.fromJson(Map<String, dynamic> json) => Looping(
        mp4Size: json['mp4_size'],
        mp4: json['mp4'],
      );

  Map<String, dynamic> toJson() => {
        'mp4_size': mp4Size,
        'mp4': mp4,
      };
}

class Original {
  Original({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.mp4Size,
    required this.mp4,
    required this.webpSize,
    required this.webp,
    required this.frames,
    required this.hash,
  });

  String height;
  String width;
  String size;
  String url;
  String mp4Size;
  String mp4;
  String webpSize;
  String webp;
  String frames;
  String hash;

  factory Original.fromJson(Map<String, dynamic> json) => Original(
        height: json['height'],
        width: json['width'],
        size: json['size'],
        url: json['url'],
        mp4Size: json['mp4_size'],
        mp4: json['mp4'],
        webpSize: json['webp_size'],
        webp: json['webp'],
        frames: json['frames'],
        hash: json['hash'],
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
        'size': size,
        'url': url,
        'mp4_size': mp4Size,
        'mp4': mp4,
        'webp_size': webpSize,
        'webp': webp,
        'frames': frames,
        'hash': hash,
      };
}

class PreviewWebp {
  PreviewWebp({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });

  String height;
  String width;
  String size;
  String url;

  factory PreviewWebp.fromJson(Map<String, dynamic> json) => PreviewWebp(
        height: json['height'],
        width: json['width'],
        size: json['size'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
        'size': size,
        'url': url,
      };
}

class The480WStill {
  The480WStill({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });

  String height;
  String width;
  String size;
  String url;

  factory The480WStill.fromJson(Map<String, dynamic> json) => The480WStill(
        height: json['height'],
        width: json['width'],
        size: json['size'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
        'size': size,
        'url': url,
      };
}

class Meta {
  Meta({
    required this.status,
    required this.msg,
    required this.responseId,
  });

  int status;
  String msg;
  String responseId;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        status: json['status'],
        msg: json['msg'],
        responseId: json['response_id'],
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'msg': msg,
        'response_id': responseId,
      };
}

class Pagination {
  Pagination({
    required this.totalCount,
    required this.count,
    required this.offset,
  });

  int totalCount;
  int count;
  int offset;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalCount: json['total_count'],
        count: json['count'],
        offset: json['offset'],
      );

  Map<String, dynamic> toJson() => {
        'total_count': totalCount,
        'count': count,
        'offset': offset,
      };
}
