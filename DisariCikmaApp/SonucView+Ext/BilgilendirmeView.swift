//
//  BilgilendirmeView.swift
//  DisariCikmaApp
//
//  Created by Batuhan Karababa on 19.11.2020.
//

import SwiftUI

struct BilgilendirmeView: View {
    var body: some View {
        VStack{
            Text("Lütfen ne olursa olsun maske takmayı 😷, mesafenizi korumayı 🚫 ve ellerinizi bol bol temizlemeyi unutmayın 🧼 olur mu?")
                .frame(maxWidth:.infinity)
                .padding()
                .background(Color.blue)
                .font(.title3)
            Text("Bunların hepsi sizin iyiliğiniz için. Unutmayın sizi çok seviyoruz 💕")
                .frame(maxWidth:.infinity)
                .padding()
                .background(Color.purple)
                .font(.title3)
        }.foregroundColor(.white)
    }
}

