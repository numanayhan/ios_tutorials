//
//  SettingsSection.swift
//  Panda
//
//  Created by TRA on 24.01.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import Foundation

protocol SectionType: CustomStringConvertible {
    var containsSwitch: Bool { get }
}

enum SettingsSection: Int, CaseIterable, CustomStringConvertible {
    
    case ACCOUNT
    case PAYMENT
    case AFFILIATE
    case TOOLS
    case SHAREFRENDS
    case SUPPORT
    case LEGAL
    case ABOUT
    var description: String {
        switch self {
        case .ACCOUNT: return "HESAP AYARLARI"
        case .PAYMENT: return "ÖDEMELER"
        case .AFFILIATE: return "PUANLAR"
        case .TOOLS: return "ARAÇLAR"
        case .SHAREFRENDS: return "ARKADAŞLARINIZ İLE PAYLAŞIN"
        case .SUPPORT: return "DESTEK VE YARDIM"
        case .LEGAL :return "YASAL ŞARTLAR"
        case .ABOUT :return "HAKKIMIZDA"
            
        }
    }
}

enum AccountOptions: Int, CaseIterable, SectionType {
    case profile
    case lang
    case notification
    var containsSwitch: Bool { return false }
    var description: String {
        switch self {
        case .profile: return "Kişisel Bilgiler"
        case .lang: return "Dil Tercihleri"
        case .notification: return "Bildirimler"
        }
    }
}
enum PaymentOptions: Int, CaseIterable, SectionType {
     case paymented
     var containsSwitch: Bool { return false }
     var description: String {
         switch self {
         case .paymented: return "Yapılan Ödeme"
         }
     }
}
enum AffiliateOptions: Int, CaseIterable, SectionType {
   case invitation
   var containsSwitch: Bool { return false }
   var description: String {
     switch self {
        case .invitation: return "Davetleriniz"
     }
   }
}
enum ToolsOptions: Int, CaseIterable, SectionType {
   case siriSupport
    var containsSwitch: Bool { return false }
    var description: String {
            switch self {
            case .siriSupport: return "Siri Ayarları"
            }
   }
}
enum ShareOptions: Int, CaseIterable, SectionType {
    case inviteFrends
    case withFrends
    var containsSwitch: Bool { return false }
    var description: String {
            switch self {
            case .inviteFrends: return "Arkadaşlarınızı Davet Edin"
            case .withFrends : return "Arkadaşınız ile Birlikte Konuşun"
            }
   }
}
enum SupportOptions: Int, CaseIterable, SectionType {
    case security
    case representative
    case help
     case rate
    var containsSwitch: Bool { return false }
    var description: String {
            switch self {
            case .security: return "Güvenlik Merkezi"
            case .representative : return "Şehir Temsilcimiz ile İletişime Geçin"
            case .help : return "Yardım"
                case .rate : return "Geri Bildirim Yapın"
            }
   }
}
enum LegalOptions: Int, CaseIterable, SectionType {
    case termsofservice
    case conditions
    case security
    var containsSwitch: Bool { return false }
    var description: String {
        switch self {
           case .termsofservice: return "Hizmet Şartları"
           case .conditions : return "Kullanım Şartları"
           case .security : return "Gizlilik Politikası"
        }
   }
}
enum AboutOptions: Int, CaseIterable, SectionType {
    case aboutus
    var containsSwitch: Bool { return false }
    var description: String {
        switch self {
           case .aboutus: return "Hizmet Şartları"
        }
   }
}
enum CommunicationOptions: Int, CaseIterable, SectionType {
    case notifications
    case email
    case reportCrashes
    
    var containsSwitch: Bool {
        switch self {
        case .notifications: return true
        case .email: return true
        case .reportCrashes: return true
        }
    }
    
    var description: String {
        switch self {
        case .notifications: return "Notifications"
        case .email: return "Email"
        case .reportCrashes: return "Report Crashes"
        }
    }
}
