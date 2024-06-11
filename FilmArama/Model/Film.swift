
import Foundation

struct Film: Decodable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

struct GelenFilmler: Decodable {
    let filmler: [Film]
    
    enum CodingKeys: String, CodingKey {
        case filmler = "Search"
    }
}
