//
//  DateService.swift
//  DisariCikmaApp
//
//  Created by Batuhan Karababa on 19.11.2020.
//

import Foundation

enum BilgiYazilari:String{
    case YirmiYasAlti = "Selam küçük dostum! 20 yaş altındaki kişiler hafta içi saat 13:00 - 16:00 arasında rahatlıkla dışarı çıkabilir 🥳"
    case altmisBesUstu = "Merhaba amca! 65 yaş ve üzerindeki kişiler hafta içi saat 10:00 - 13:00 arasında rahatlıkla dışarı çıkabilir 🥳"
    case normalInsan = "Selam şu an bu uygulamayı kullanan tatlı insan! 20 yaş üstü ve 65 yaş altı kişiler veya çalışan kişiler hafta içi tüm gün dışarı çıkabilir 🥳"
    case haftaSonu = "Merhaba! Sonunda hafta sonu oldu biraz rahatladık değil mi? Hafta sonu tüm kişiler 10.00 - 20.00 arası dışarı çıkabilir 🥳"
}


 class DateService{
    static let shared = DateService()
    private let allowedStrings = ["Yeyyy! Dışarı çıkabilirsin 🥳🥳","Tabiki çıkabilirsin kim tutar seni 👊👊","Aslanım be! Tabiki çıkabilirsin sen çıkamayacaksın da kim çıkacak 🎉🎉","Bomba gibisin istediğin her yere gidebilirsin 💣💣 (Mesafeyi Koru!)"]
    private let notAllowedStrings = ["Ya 😭 Maalesef Dışarı çıkamazsın 😥😥😥","Galiba şu an dışarı çıkamazsın 😕 Evde kalman gerekiyor.","Otur oturduğun yerde çünkü kötü bir haberim var 😥 Üzgünüm ki şu an dışarı çıkamazsın.","Bu yasaklar demek seni de etkiliyor 🥺 Şu an dışarı çıkamayacağının bilgisini vermem gerek."]
    
    private var calendarDate:DateComponents{
        let date = Date()
        return Calendar.current.dateComponents([.weekday,.hour,.minute], from: date)
    }
    
    private var hour:Int{
        return calendarDate.hour ?? 0
    }
    
    private var weekday:Int{
        return calendarDate.weekday ?? 0
    }
    
    private var olumluMesaj:String{
        allowedStrings.randomElement()!
    }
    
    private var olumsuzMesaj:String{
        notAllowedStrings.randomElement()!
    }
    
   private func haftasonuKontrol() -> (haftaSonu:Bool, cikabilir:Bool){
        if weekday == 7 || weekday == 1{
            if hour >= 10 && hour < 20{
                return (true,true)
            }else{
                return (true,false)
            }
        }
            return (false,false)
    }
    
    private func haftaiciTamGunKontrol(yas:Int,calisiyorMu:Bool) -> Bool{
        if yas >= 20 && yas < 65 || calisiyorMu == true{
            return true
        }
        return false
    }
    
    private func yirmiAltiKontrol() -> Bool{
        return hour >= 13 && hour < 16
    }
    
    private func altmisbesUstuKontrol() -> Bool{
        return hour >= 10 && hour < 13
    }
    
    func tarihHesaplama(yas:Int,calisiyorMu:Bool,completionHandler handler: @escaping (_ anaYazi:String,_ bilgiYazi:BilgiYazilari) -> Void){

        let haftasonuCheck = haftasonuKontrol()
        let haftaiciTamGunCheck = haftaiciTamGunKontrol(yas: yas, calisiyorMu: calisiyorMu)
        let yirmiAltiCheck = yirmiAltiKontrol()
        let altmisbesUstuCheck = altmisbesUstuKontrol()
        print("WEEKDAY = \(weekday)")
        if haftasonuCheck.cikabilir{
            handler(olumluMesaj,.haftaSonu)
            return
        }
        guard haftasonuCheck.haftaSonu == false else {
            handler(olumsuzMesaj,.haftaSonu)
            return
        }
        
        if haftaiciTamGunCheck{
            handler(olumluMesaj,.normalInsan)
            return
        }
        
            if yas < 20{
                if yirmiAltiCheck == true{
                    handler(olumluMesaj,.YirmiYasAlti)
                }else{
                    handler(olumsuzMesaj,.YirmiYasAlti)
                }
                return
            }
        
        if yas >= 65{
            if altmisbesUstuCheck == true{
                handler(olumluMesaj,.altmisBesUstu)
            }else{
                handler(olumsuzMesaj,.altmisBesUstu)
            }
            return
        }
        
    }
    
 }





