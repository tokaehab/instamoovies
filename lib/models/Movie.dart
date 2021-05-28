class Movie {
  final int id;
  final String title, overView, date, poster, backPoster;

  Movie.fromJson(dynamic json)
      : this.id = json['id'],
        this.title = json['title'],
        this.overView = json['overview'],
        this.date = json['release_date'] != null ? json['release_date'] : 'NA',
        this.poster = json['poster_path'] == null
            ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1200px-No-Image-Placeholder.svg.png'
            : 'https://image.tmdb.org/t/p/original/${json['poster_path']}',
        this.backPoster = json['backdrop_path'] == null
            ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1200px-No-Image-Placeholder.svg.png'
            : 'https://image.tmdb.org/t/p/original/${json['backdrop_path']}';
}
