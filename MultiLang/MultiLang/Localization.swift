//
//  Localization.swift
//  MultiLang
//
//  Created by Melike Büşra Ayhan on 7.03.2021.
//

import Foundation
 
import UIKit



// 
//
//extension Locale {
//    static var preferredLanguage: String {
//        get {
//            return self.preferredLanguages.first ?? "en"
//        }
//        set {
//            UserDefaults.standard.set([newValue], forKey: "Localizable")
//            UserDefaults.standard.synchronize()
//        }
//    }
//}
//
//extension String {
//    var localized: String {
//    var result: String
//
//    let languageCode = Locale.preferredLanguage //en-US
//
//    var path = Bundle.main.path(forResource: languageCode, ofType: "lproj")
//
//    if path == nil, let hyphenRange = languageCode.range(of: "-") {
//        let languageCodeShort = languageCode.substring(to: hyphenRange.lowerBound) // en
//        path = Bundle.main.path(forResource: languageCodeShort, ofType: "lproj")
//    }
//
//    if let path = path, let locBundle = Bundle(path: path) {
//        result = locBundle.localizedString(forKey: self, value: nil, table: nil)
//    } else {
//        result = NSLocalizedString(self, comment: "")
//    }
//        return result
//    }
//}
//
////

public extension String{
    func localized() -> String{
        return NSLocalizedString(self, tableName: "Localizable", bundle: Bundle.main,value: self, comment: self)
    }
}

public extension String {
     static func localize(_ key: String ) -> String {
        return Localization.sharedInstance.localizedStringForKey(key:key, comment: "")
    }
}
//


class  Localization:NSObject {

    var bundle: Bundle!

    class var sharedInstance: Localization {
        struct Singleton {
            static let instance: Localization = Localization()
        }
        return Singleton.instance
    }
    override init() {
        super.init()
        bundle = Bundle.main
    }
    func localizedStringForKey(key:String, comment:String) -> String {
        return bundle.localizedString(forKey: key, value: comment, table: "Localizable")
    }
    func localizedImagePathForImg(imagename:String, type:String) -> String {
        guard let imagePath =  bundle.path(forResource: imagename, ofType: type) else {
            return ""
        }
        return imagePath
    }
    func setLanguage(languageCode:String) {
             var appleLanguages = UserDefaults.standard.object(forKey: "Localizable") as! [String]
            appleLanguages.remove(at: 0)
            appleLanguages.insert(languageCode, at: 0)
            UserDefaults.standard.set(appleLanguages, forKey: "Localizable")
            UserDefaults.standard.synchronize()
            if let languageDirectoryPath = Bundle.main.path(forResource: languageCode, ofType: "lproj")  {
                bundle = Bundle.init(path: languageDirectoryPath)
            } else {
                resetLocalization()
            }
        

    }
    func resetLocalization() {
        bundle = Bundle.main
    }
    func getLanguage() -> String {
        let appleLanguages = UserDefaults.standard.object(forKey: "Localizable") as! [String]
        let prefferedLanguage = appleLanguages[0]
        if prefferedLanguage.contains("-") {
            let array = prefferedLanguage.components(separatedBy: "-")
            return array[0]
        }
        return prefferedLanguage
    }

}
