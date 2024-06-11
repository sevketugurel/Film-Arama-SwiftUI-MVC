//
//  ContentView.swift
//  FilmArama
//
//  Created by Şevket Uğurel on 11.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            DownloaderClient().filmleriIndir(search: "pulp", completion: {(sonuc) in
                switch sonuc {
                case .success(let filmDizisi):
                    print(filmDizisi)
                case .failure(let hata):
                    print(hata)
                }
            })
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        })
    }
}

#Preview {
    ContentView()
}
