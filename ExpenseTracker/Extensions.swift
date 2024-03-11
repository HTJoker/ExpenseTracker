import Foundation
import SwiftUI

extension Color{
    static let backgroundColor = Color("Background")
    static let iconColor = Color("Icon")
    static let textColor = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter{
    static let allNumericUSA: DateFormatter = {
        print("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}

extension String{
    func dateParsed() -> Date {
        guard let parsedData = DateFormatter.allNumericUSA.date(from: self) else {return Date()}
        
        return parsedData
    }
}

extension Date {
    func formatted() -> String{
        return self.formatted(.dateTime.year().month().day())
    }
}

extension Double {
    func rounded2Digits() -> Double {
        return(self * 100).rounded()/100
    }
}
