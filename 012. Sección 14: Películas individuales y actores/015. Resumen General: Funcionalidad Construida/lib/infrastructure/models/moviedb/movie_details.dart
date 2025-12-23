class MovieDetails {
    final bool adult;
    final String backdropPath;
    final BelongsToCollection? belongsToCollection; 
    final int budget;
    final List<Genre> genres;
    final String homepage;
    final int id;
    final String imdbId;
    final List<String> originCountry;
    final String originalLanguage;
    final String originalTitle;
    final String overview;
    final double popularity;
    final String posterPath;
    final List<ProductionCompany> productionCompanies;
    final List<ProductionCountry> productionCountries;
    final DateTime releaseDate;
    final int revenue;
    final int runtime;
    final List<SpokenLanguage> spokenLanguages;
    final String status;
    final String tagline;
    final String title;
    final bool video;
    final double voteAverage;
    final int voteCount;

    MovieDetails({
        required this.adult,
        required this.backdropPath,
        required this.belongsToCollection,
        required this.budget,
        required this.genres,
        required this.homepage,
        required this.id,
        required this.imdbId,
        required this.originCountry,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.productionCompanies,
        required this.productionCountries,
        required this.releaseDate,
        required this.revenue,
        required this.runtime,
        required this.spokenLanguages,
        required this.status,
        required this.tagline,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
        adult: json["adult"],
        backdropPath: json["backdrop_path"] ?? '', 
        belongsToCollection: json["belongs_to_collection"] != null 
        ? BelongsToCollection.fromJson(json["belongs_to_collection"]) 
        : null,
        budget: json["budget"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromJson(x))),
        productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection?.toJson(),
        "budget": budget,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries": List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

class BelongsToCollection {
    final int id;
    final String name;
    final String? posterPath; 
    final String backdropPath;

    BelongsToCollection({
        required this.id,
        required this.name,
        required this.posterPath,
        required this.backdropPath,
    });

    factory BelongsToCollection.fromJson(Map<String, dynamic> json) => BelongsToCollection(
        id: json["id"],
        name: json["name"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
    };
}

class Genre {
    final int id;
    final String name;

    Genre({
        required this.id,
        required this.name,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class ProductionCompany {
    final int id;
    final String? logoPath;
    final String name;
    final String originCountry;

    ProductionCompany({
        required this.id,
        required this.logoPath,
        required this.name,
        required this.originCountry,
    });

    factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
    };
}

class ProductionCountry {
    final String iso31661;
    final String name;

    ProductionCountry({
        required this.iso31661,
        required this.name,
    });

    factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
    };
}

class SpokenLanguage {
    final String englishName;
    final String iso6391;
    final String name;

    SpokenLanguage({
        required this.englishName,
        required this.iso6391,
        required this.name,
    });

    factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
    };
}

/*

1. Se uso el si siguiente enlace en Postman para ver un ejemplo de respuesta JSON con los detalles de una película específica utilizando su ID:
https://api.themoviedb.org/3/movie/505642?api_key=abb2bb0e42043fb6792ffa33bcafec8d&language=es-MX

2. Se copió la respuesta JSON:

{
    "adult": false,
    "backdrop_path": "/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg",
    "belongs_to_collection": {
        "id": 529892,
        "name": "Pantera Negra - Colección",
        "poster_path": "/v9bjbRXf6Du06QYpDNvteQovXLN.jpg",
        "backdrop_path": "/nsiBzWsmmerBMuD8TKHpYBTnfhD.jpg"
    },
    "budget": 250000000,
    "genres": [
        {
            "id": 28,
            "name": "Acción"
        },
        {
            "id": 12,
            "name": "Aventura"
        },
        {
            "id": 878,
            "name": "Ciencia ficción"
        }
    ],
    "homepage": "https://disneylatino.com/peliculas/pantera-negra-wakanda-por-siempre",
    "id": 505642,
    "imdb_id": "tt9114286",
    "origin_country": [
        "US"
    ],
    "original_language": "en",
    "original_title": "Black Panther: Wakanda Forever",
    "overview": "La reina Ramonda, Shuri, M'Baku, Okoye y las Dora Milaje luchan por proteger a su nación de las potencias mundiales que intervienen tras la muerte del Rey T'Challa. Mientras los habitantes de Wakanda se esfuerzan por embarcarse en un nuevo capítulo, los héroes deben unirse con la ayuda de Nakia y Everett Ross y forjar un nuevo camino para el reino de Wakanda.",
    "popularity": 10.2077,
    "poster_path": "/mYpT2R7639KvKZ668uoQGS2QNFp.jpg",
    "production_companies": [
        {
            "id": 420,
            "logo_path": "/hUzeosd33nzE5MCNsZxCGEKTXaQ.png",
            "name": "Marvel Studios",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "2022-11-09",
    "revenue": 859102154,
    "runtime": 162,
    "spoken_languages": [
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        },
        {
            "english_name": "French",
            "iso_639_1": "fr",
            "name": "Français"
        },
        {
            "english_name": "Haitian; Haitian Creole",
            "iso_639_1": "ht",
            "name": ""
        },
        {
            "english_name": "Spanish",
            "iso_639_1": "es",
            "name": "Español"
        },
        {
            "english_name": "Xhosa",
            "iso_639_1": "xh",
            "name": ""
        }
    ],
    "status": "Released",
    "tagline": "Por siempre.",
    "title": "Pantera Negra: Wakanda por siempre",
    "video": false,
    "vote_average": 7.026,
    "vote_count": 7118
}

3. Y se utilizó la herramienta de Dart "Dart Data Class Generator" para generar las clases Dart necesarias para mapear la respuesta JSON a objetos Dart.


*/