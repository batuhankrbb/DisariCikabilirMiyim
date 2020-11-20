//
//  ContentView.swift
//  DisariCikmaApp
//
//  Created by Batuhan Karababa on 19.11.2020.
//

import SwiftUI

struct SoruView: View {
    @State var kullaniciYasi = 18
    @State var calisiyorMusun = false
    @State var uyariGoster = false
    @State var sonucaGecis = false
    @State var gidecekBilgi = (anaMetin:"",bilgiMetni:"")
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Şu an dışarı çıkabilir miyim? 🤔")
                    .font(.largeTitle)
                    .bold()
                    .minimumScaleFactor(0.4)
                    .padding()
                
                YasPicker(yas: $kullaniciYasi)
                    .frame(width: UIScreen.main.bounds.size.width)
                
                CalisiyorMusunView(calisiyorMusun: $calisiyorMusun)
                    .padding(.vertical)
                
                
                Spacer().frame(height: UIScreen.main.bounds.height / 11)
                
                KontrolButton(uyariGoster: $uyariGoster){
                        uyariGoster =  kullaniciYasi < 16 && calisiyorMusun == true
                        if uyariGoster == false{
                            
                            DateService.shared.tarihHesaplama(yas: kullaniciYasi, calisiyorMu: calisiyorMusun) { (mainText, infoText) in
                                gidecekBilgi.anaMetin = mainText
                                gidecekBilgi.bilgiMetni = infoText.rawValue
                                sonucaGecis = true
                            }
                        }
                    }
                
                
                NavigationLink("", destination: SonucView(gelenBilgiler: (anaMetin: gidecekBilgi.anaMetin, bilgiMetin: gidecekBilgi.bilgiMetni)), isActive: $sonucaGecis)
                
                Spacer()
                Text("🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔")
                    .lineLimit(1)
                    .fixedSize()
                    .frame(width: UIScreen.main.bounds.width)
                    .font(.largeTitle)
                
                Spacer()
            }.padding(.top)
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SoruView()
    }
}
