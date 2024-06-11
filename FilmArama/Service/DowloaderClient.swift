//
//  DowloaderClient.swift
//  FilmArama
//
//  Created by Şevket Uğurel on 11.06.2024.
//

import Foundation


class DownloaderClient {
    // Filmleri indiren fonksiyon
    func filmleriIndir(search: String, completion: @escaping (Result<[Film]?, DownloaderError>) -> Void) {

        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=f5133d7") else {
            return completion(.failure(.yanlisUrl))
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }

            guard let filmCevabi = try? JSONDecoder().decode(GelenFilmler.self
, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }

            completion(.success(filmCevabi.filmler))
        }.resume();
    }

}


// İndirme sırasında oluşabilecek hataların enum tanımı
enum DownloaderError: Error {
    case yanlisUrl
    case veriGelmedi
    case veriIslenemedi
}

