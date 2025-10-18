import 'dart:convert';

JsonRenderModel jsonRenderModelFromJson(String str) => JsonRenderModel.fromJson(json.decode(str));

String jsonRenderModelToJson(JsonRenderModel data) => json.encode(data.toJson());

class JsonRenderModel {
    List<Section> sections;

    JsonRenderModel({
        required this.sections,
    });

    factory JsonRenderModel.fromJson(Map<String, dynamic> json) => JsonRenderModel(
        sections: List<Section>.from(json["sections"].map((x) => Section.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
    };
}

class Section {
    String id;
    SectionType type;
    String? title;
    bool? showLink;
    List<ItemElement>? items;
    bool? hideIcon;
    String? link;
    String? playlist;
    int? rows;
    bool? showCount;
    bool? small;
    int? count;

    Section({
        required this.id,
        required this.type,
        this.title,
        this.showLink,
        this.items,
        this.hideIcon,
        this.link,
        this.playlist,
        this.rows,
        this.showCount,
        this.small,
        this.count,
    });

    factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        type: sectionTypeValues.map[json["type"]]!,
        title: json["title"],
        showLink: json["show_link"],
        items: json["items"] == null ? [] : List<ItemElement>.from(json["items"]!.map((x) => ItemElement.fromJson(x))),
        hideIcon: json["hide_icon"],
        link: json["link"],
        playlist: json["playlist"],
        rows: json["rows"],
        showCount: json["show_count"],
        small: json["small"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": sectionTypeValues.reverse[type],
        "title": title,
        "show_link": showLink,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "hide_icon": hideIcon,
        "link": link,
        "playlist": playlist,
        "rows": rows,
        "show_count": showCount,
        "small": small,
        "count": count,
    };
}

class ItemElement {
    dynamic id;
    String? title;
    int? itemsCount;
    DateTime? createdAt;
    SubtypeEnum type;
    SubtypeEnum? subtype;
    String shareLink;
    int? count;
    int? followers;
    bool? public;
    DateTime? lastUpdatedAt;
    String? bgColor;
    bool? customPhoto;
    bool? showTrackNumbers;
    List<String>? bgColors;
    String? desc;
    String photo;
    String thumbnail;
    String? photoPlayer;
    String? defaultArtwork;
    CreatedBy? createdBy;
    CreatedTitle? createdTitle;
    Owner? owner;
    String? caption;
    bool? myplaylist;
    bool? collab;
    String? cover;
    String? name;
    String? query;
    String? itemSubtitle;
    String? subtitle;
    String? artist;
    String? song;
    bool? explicit;
    ItemItem? item;
    String? link;
    String? plays;
    String? photo240;
    String? likes;
    String? dislikes;
    String? downloads;
    String? permlink;
    double? duration;
    int? sampleStart;
    String? hlsLink;
    String? lqLink;
    String? hqLink;
    String? lqHls;
    String? hqHls;
    double? lufs;
    List<String>? artistTags;
    String? artistFarsi;
    String? songFarsi;
    String? backgroundVideoUrl;
    bool? backgroundVideoHideCover;
    String? backgroundVideoBgColor;
    String? backgroundVideoOverlayColor;
    String? nowplayingArtworkVideo;
    String? nowplayingArtworkImage;

    ItemElement({
        required this.id,
        this.title,
        this.itemsCount,
        this.createdAt,
        required this.type,
        this.subtype,
        required this.shareLink,
        this.count,
        this.followers,
        this.public,
        this.lastUpdatedAt,
        this.bgColor,
        this.customPhoto,
        this.showTrackNumbers,
        this.bgColors,
        this.desc,
        required this.photo,
        required this.thumbnail,
        this.photoPlayer,
        this.defaultArtwork,
        this.createdBy,
        this.createdTitle,
        this.owner,
        this.caption,
        this.myplaylist,
        this.collab,
        this.cover,
        this.name,
        this.query,
        this.itemSubtitle,
        this.subtitle,
        this.artist,
        this.song,
        this.explicit,
        this.item,
        this.link,
        this.plays,
        this.photo240,
        this.likes,
        this.dislikes,
        this.downloads,
        this.permlink,
        this.duration,
        this.sampleStart,
        this.hlsLink,
        this.lqLink,
        this.hqLink,
        this.lqHls,
        this.hqHls,
        this.lufs,
        this.artistTags,
        this.artistFarsi,
        this.songFarsi,
        this.backgroundVideoUrl,
        this.backgroundVideoHideCover,
        this.backgroundVideoBgColor,
        this.backgroundVideoOverlayColor,
        this.nowplayingArtworkVideo,
        this.nowplayingArtworkImage,
    });

    factory ItemElement.fromJson(Map<String, dynamic> json) => ItemElement(
      id: json["id"],
      title: json["title"],
      itemsCount: json["items_count"],
      createdAt: json["created_at"] == null ? null : DateTime.tryParse(json["created_at"]),
      type: subtypeEnumValues.map[json["type"]] ?? SubtypeEnum.MP3,
      subtype: subtypeEnumValues.map[json["subtype"]],
      shareLink: json["share_link"] ?? '',
      count: json["count"],
      followers: json["followers"],
      public: json["public"],
      lastUpdatedAt: json["last_updated_at"] == null ? null : DateTime.tryParse(json["last_updated_at"]),
      bgColor: json["bg_color"],
      customPhoto: json["custom_photo"],
      showTrackNumbers: json["show_track_numbers"],
      bgColors: (json["bg_colors"] as List?)?.map((x) => x.toString()).toList() ?? [],
      desc: json["desc"],
      photo: json["photo"] ?? '',
      thumbnail: json["thumbnail"] ?? '',
      photoPlayer: json["photo_player"],
      defaultArtwork: json["default_artwork"],
      createdBy: createdByValues.map[json["created_by"]] ?? CreatedBy.BY_RADIO_JAVAN,
      createdTitle: createdTitleValues.map[json["created_title"]] ?? CreatedTitle.RADIO_JAVAN,
      owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
      caption: json["caption"],
      myplaylist: json["myplaylist"],
      collab: json["collab"],
      cover: json["cover"],
      name: json["name"],
      query: json["query"],
      itemSubtitle: json["item_subtitle"],
      subtitle: json["subtitle"],
      artist: json["artist"],
      song: json["song"],
      explicit: json["explicit"],
      item: json["item"] == null ? null : ItemItem.fromJson(json["item"]),
      link: json["link"],
      plays: json["plays"],
      photo240: json["photo_240"],
      likes: json["likes"],
      dislikes: json["dislikes"],
      downloads: json["downloads"],
      permlink: json["permlink"],
      duration: (json["duration"] is num) ? json["duration"].toDouble() : null,
      sampleStart: json["sample_start"],
      hlsLink: json["hls_link"],
      lqLink: json["lq_link"],
      hqLink: json["hq_link"],
      lqHls: json["lq_hls"],
      hqHls: json["hq_hls"],
      lufs: (json["lufs"] is num) ? json["lufs"].toDouble() : null,
      artistTags: (json["artist_tags"] as List?)?.map((x) => x.toString()).toList() ?? [],
      artistFarsi: json["artist_farsi"],
      songFarsi: json["song_farsi"],
      backgroundVideoUrl: json["background_video_url"],
      backgroundVideoHideCover: json["background_video_hide_cover"],
      backgroundVideoBgColor: json["background_video_bg_color"],
      backgroundVideoOverlayColor: json["background_video_overlay_color"],
      nowplayingArtworkVideo: json["nowplaying_artwork_video"],
      nowplayingArtworkImage: json["nowplaying_artwork_image"],
    );


    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "items_count": itemsCount,
        "created_at": createdAt?.toIso8601String(),
        "type": subtypeEnumValues.reverse[type],
        "subtype": subtypeEnumValues.reverse[subtype],
        "share_link": shareLink,
        "count": count,
        "followers": followers,
        "public": public,
        "last_updated_at": lastUpdatedAt?.toIso8601String(),
        "bg_color": bgColor,
        "custom_photo": customPhoto,
        "show_track_numbers": showTrackNumbers,
        "bg_colors": bgColors == null ? [] : List<dynamic>.from(bgColors!.map((x) => x)),
        "desc": desc,
        "photo": photo,
        "thumbnail": thumbnail,
        "photo_player": photoPlayer,
        "default_artwork": defaultArtwork,
        "created_by": createdByValues.reverse[createdBy],
        "created_title": createdTitleValues.reverse[createdTitle],
        "owner": owner?.toJson(),
        "caption": caption,
        "myplaylist": myplaylist,
        "collab": collab,
        "cover": cover,
        "name": name,
        "query": query,
        "item_subtitle": itemSubtitle,
        "subtitle": subtitle,
        "artist": artist,
        "song": song,
        "explicit": explicit,
        "item": item?.toJson(),
        "link": link,
        "plays": plays,
        "photo_240": photo240,
        "likes": likes,
        "dislikes": dislikes,
        "downloads": downloads,
        "permlink": permlink,
        "duration": duration,
        "sample_start": sampleStart,
        "hls_link": hlsLink,
        "lq_link": lqLink,
        "hq_link": hqLink,
        "lq_hls": lqHls,
        "hq_hls": hqHls,
        "lufs": lufs,
        "artist_tags": artistTags == null ? [] : List<dynamic>.from(artistTags!.map((x) => x)),
        "artist_farsi": artistFarsi,
        "song_farsi": songFarsi,
        "background_video_url": backgroundVideoUrl,
        "background_video_hide_cover": backgroundVideoHideCover,
        "background_video_bg_color": backgroundVideoBgColor,
        "background_video_overlay_color": backgroundVideoOverlayColor,
        "nowplaying_artwork_video": nowplayingArtworkVideo,
        "nowplaying_artwork_image": nowplayingArtworkImage,
    };
}

enum CreatedBy {
    BY_RADIO_JAVAN
}

final createdByValues = EnumValues({
    "By Radio Javan": CreatedBy.BY_RADIO_JAVAN
});

enum CreatedTitle {
    RADIO_JAVAN
}

final createdTitleValues = EnumValues({
    "Radio Javan": CreatedTitle.RADIO_JAVAN
});

class ItemItem {
    int id;
    String title;
    bool explicit;
    String link;
    String photo;
    String thumbnail;
    String? plays;
    String? artist;
    String? song;
    String? photo240;
    String likes;
    String dislikes;
    String? downloads;
    String photoPlayer;
    String permlink;
    String shareLink;
    DateTime createdAt;
    SubtypeEnum type;
    double? duration;
    int? sampleStart;
    String? hlsLink;
    String lqLink;
    String hqLink;
    String? lqHls;
    String? hqHls;
    double? lufs;
    List<String>? artistTags;
    List<String> bgColors;
    String? artistFarsi;
    String? songFarsi;
    String? backgroundVideoUrl;
    bool? backgroundVideoHideCover;
    String? backgroundVideoBgColor;
    String? backgroundVideoOverlayColor;
    String? nowplayingArtworkVideo;
    String? nowplayingArtworkImage;
    String? low;
    String? high;
    String? photoLarge;
    String? views;
    String? lowWeb;
    String? highWeb;
    String? hls;
    String? hlsHevc;
    String? thumbsBaseLink;
    int? thumbsInterval;
    int? thumbsCount;
    String? hd4KLink;
    Mp3Item? mp3Item;
    String? podcastArtist;
    bool? talk;
    String? date;
    String? shortDate;
    String? dateAdded;
    String? showPermlink;

    ItemItem({
        required this.id,
        required this.title,
        required this.explicit,
        required this.link,
        required this.photo,
        required this.thumbnail,
        this.plays,
        this.artist,
        this.song,
        this.photo240,
        required this.likes,
        required this.dislikes,
        this.downloads,
        required this.photoPlayer,
        required this.permlink,
        required this.shareLink,
        required this.createdAt,
        required this.type,
        this.duration,
        this.sampleStart,
        this.hlsLink,
        required this.lqLink,
        required this.hqLink,
        this.lqHls,
        this.hqHls,
        this.lufs,
        this.artistTags,
        required this.bgColors,
        this.artistFarsi,
        this.songFarsi,
        this.backgroundVideoUrl,
        this.backgroundVideoHideCover,
        this.backgroundVideoBgColor,
        this.backgroundVideoOverlayColor,
        this.nowplayingArtworkVideo,
        this.nowplayingArtworkImage,
        this.low,
        this.high,
        this.photoLarge,
        this.views,
        this.lowWeb,
        this.highWeb,
        this.hls,
        this.hlsHevc,
        this.thumbsBaseLink,
        this.thumbsInterval,
        this.thumbsCount,
        this.hd4KLink,
        this.mp3Item,
        this.podcastArtist,
        this.talk,
        this.date,
        this.shortDate,
        this.dateAdded,
        this.showPermlink,
    });

    factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
        id: json["id"],
        title: json["title"],
        explicit: json["explicit"],
        link: json["link"],
        photo: json["photo"],
        thumbnail: json["thumbnail"],
        plays: json["plays"],
        artist: json["artist"],
        song: json["song"],
        photo240: json["photo_240"],
        likes: json["likes"],
        dislikes: json["dislikes"],
        downloads: json["downloads"],
        photoPlayer: json["photo_player"],
        permlink: json["permlink"],
        shareLink: json["share_link"],
        createdAt: DateTime.parse(json["created_at"]),
        type: subtypeEnumValues.map[json["type"]]!,
        duration: json["duration"]?.toDouble(),
        sampleStart: json["sample_start"],
        hlsLink: json["hls_link"],
        lqLink: json["lq_link"],
        hqLink: json["hq_link"],
        lqHls: json["lq_hls"],
        hqHls: json["hq_hls"],
        lufs: json["lufs"]?.toDouble(),
        artistTags: json["artist_tags"] == null ? [] : List<String>.from(json["artist_tags"]!.map((x) => x)),
        bgColors: List<String>.from(json["bg_colors"].map((x) => x)),
        artistFarsi: json["artist_farsi"],
        songFarsi: json["song_farsi"],
        backgroundVideoUrl: json["background_video_url"],
        backgroundVideoHideCover: json["background_video_hide_cover"],
        backgroundVideoBgColor: json["background_video_bg_color"],
        backgroundVideoOverlayColor: json["background_video_overlay_color"],
        nowplayingArtworkVideo: json["nowplaying_artwork_video"],
        nowplayingArtworkImage: json["nowplaying_artwork_image"],
        low: json["low"],
        high: json["high"],
        photoLarge: json["photo_large"],
        views: json["views"],
        lowWeb: json["low_web"],
        highWeb: json["high_web"],
        hls: json["hls"],
        hlsHevc: json["hls_hevc"],
        thumbsBaseLink: json["thumbs_base_link"],
        thumbsInterval: json["thumbs_interval"],
        thumbsCount: json["thumbs_count"],
        hd4KLink: json["hd_4k_link"],
        mp3Item: json["mp3_item"] == null ? null : Mp3Item.fromJson(json["mp3_item"]),
        podcastArtist: json["podcast_artist"],
        talk: json["talk"],
        date: json["date"],
        shortDate: json["short_date"],
        dateAdded: json["date_added"],
        showPermlink: json["show_permlink"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "explicit": explicit,
        "link": link,
        "photo": photo,
        "thumbnail": thumbnail,
        "plays": plays,
        "artist": artist,
        "song": song,
        "photo_240": photo240,
        "likes": likes,
        "dislikes": dislikes,
        "downloads": downloads,
        "photo_player": photoPlayer,
        "permlink": permlink,
        "share_link": shareLink,
        "created_at": createdAt.toIso8601String(),
        "type": subtypeEnumValues.reverse[type],
        "duration": duration,
        "sample_start": sampleStart,
        "hls_link": hlsLink,
        "lq_link": lqLink,
        "hq_link": hqLink,
        "lq_hls": lqHls,
        "hq_hls": hqHls,
        "lufs": lufs,
        "artist_tags": artistTags == null ? [] : List<dynamic>.from(artistTags!.map((x) => x)),
        "bg_colors": List<dynamic>.from(bgColors.map((x) => x)),
        "artist_farsi": artistFarsi,
        "song_farsi": songFarsi,
        "background_video_url": backgroundVideoUrl,
        "background_video_hide_cover": backgroundVideoHideCover,
        "background_video_bg_color": backgroundVideoBgColor,
        "background_video_overlay_color": backgroundVideoOverlayColor,
        "nowplaying_artwork_video": nowplayingArtworkVideo,
        "nowplaying_artwork_image": nowplayingArtworkImage,
        "low": low,
        "high": high,
        "photo_large": photoLarge,
        "views": views,
        "low_web": lowWeb,
        "high_web": highWeb,
        "hls": hls,
        "hls_hevc": hlsHevc,
        "thumbs_base_link": thumbsBaseLink,
        "thumbs_interval": thumbsInterval,
        "thumbs_count": thumbsCount,
        "hd_4k_link": hd4KLink,
        "mp3_item": mp3Item?.toJson(),
        "podcast_artist": podcastArtist,
        "talk": talk,
        "date": date,
        "short_date": shortDate,
        "date_added": dateAdded,
        "show_permlink": showPermlink,
    };
}

class Mp3Item {
    int id;
    SubtypeEnum type;
    String permlink;

    Mp3Item({
        required this.id,
        required this.type,
        required this.permlink,
    });

    factory Mp3Item.fromJson(Map<String, dynamic> json) => Mp3Item(
        id: json["id"],
        type: subtypeEnumValues.map[json["type"]]!,
        permlink: json["permlink"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": subtypeEnumValues.reverse[type],
        "permlink": permlink,
    };
}

enum SubtypeEnum {
    ARTIST,
    MP3,
    PLAYLIST,
    PODCAST,
    VIDEO
}

final subtypeEnumValues = EnumValues({
    "artist": SubtypeEnum.ARTIST,
    "mp3": SubtypeEnum.MP3,
    "playlist": SubtypeEnum.PLAYLIST,
    "podcast": SubtypeEnum.PODCAST,
    "video": SubtypeEnum.VIDEO
});

class Owner {
    CreatedTitle displayName;
    String photo;
    String thumb;

    Owner({
        required this.displayName,
        required this.photo,
        required this.thumb,
    });

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        displayName: createdTitleValues.map[json["display_name"]]!,
        photo: json["photo"],
        thumb: json["thumb"],
    );

    Map<String, dynamic> toJson() => {
        "display_name": createdTitleValues.reverse[displayName],
        "photo": photo,
        "thumb": thumb,
    };
}

enum SectionType {
    HEADER,
    RECENTLY_PLAYED,
    SLIDER_ROWS,
    SLIDER_SQUARE, header
}

final sectionTypeValues = EnumValues({
    "header": SectionType.HEADER,
    "recently_played": SectionType.RECENTLY_PLAYED,
    "slider_rows": SectionType.SLIDER_ROWS,
    "slider_square": SectionType.SLIDER_SQUARE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
