//
//  Extentions.swift
//  Init
//
//  Created by TRA on 20.03.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import Foundation
extension Numeric {

    private func _precision(number: NSNumber, formatter: NumberFormatter) -> Self? {
        if  let formatedNumString = formatter.string(from: number),
            let formatedNum = formatter.number(from: formatedNumString) {
                return formatedNum as? Self
        }
        return nil
    }

    private func toNSNumber() -> NSNumber? {
        if let num = self as? NSNumber { return num }
        guard let string = self as? String, let double = Double(string) else { return nil }
        return NSNumber(value: double)
    }

    func precision(_ minimumFractionDigits: Int,
                   roundingMode: NumberFormatter.RoundingMode = NumberFormatter.RoundingMode.halfUp) -> Self? {
        guard let number = toNSNumber() else { return nil }
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = minimumFractionDigits
        formatter.roundingMode = roundingMode
        return _precision(number: number, formatter: formatter)
    }

    func precision(with numberFormatter: NumberFormatter) -> String? {
        guard let number = toNSNumber() else { return nil }
        return numberFormatter.string(from: number)
    }
}
extension Double {

   func formatted(_ decimalPlaces: Int?) -> String {
      let theDecimalPlaces : Int
      if decimalPlaces != nil {
         theDecimalPlaces = decimalPlaces!
      }
      else {
         theDecimalPlaces = 2
      }
      let theNumberFormatter = NumberFormatter()
      theNumberFormatter.formatterBehavior = .behavior10_4
      theNumberFormatter.minimumIntegerDigits = 1
      theNumberFormatter.minimumFractionDigits = 1
      theNumberFormatter.maximumFractionDigits = theDecimalPlaces
      theNumberFormatter.usesGroupingSeparator = true
      theNumberFormatter.groupingSeparator = "."
      theNumberFormatter.groupingSize = 3

      if let theResult = theNumberFormatter.string(from: NSNumber(value:self)) {
         return theResult
      }
      else {
         return "\(self)"
      }
   }
}
