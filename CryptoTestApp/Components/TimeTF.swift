//
//  TimeTF.swift
//  CryptoTestApp
//
//  Created by Artem on 22.10.2023.
//
import SwiftUI


//Section("Time Selection"){
//
//
//
//                    HStack{
//
//                        Text("Time")
//
//                        TimeTextFieldLocal(timeLocal: $localTime, timeInUTC: $utcTime, description: "Local")
//                        TimeTextFieldUTC(timeLocal: $localTime, timeInUTC: $utcTime, description: "UTC")
//
//
//                    }
//
//                }



struct TimeTextFieldLocal: View {
    @Binding var timeLocal: String
    @Binding var timeInUTC: String
    var description: String
    var body: some View {
        TextField(description, text: $timeLocal)
            .textFieldStyle(.roundedBorder)
            .textContentType(.none)
            .keyboardType(.numberPad)
            .onChange(of: timeLocal) { newValue in
                timeLocal = formatTimeInput(newValue)
                timeInUTC = timeLocal.toUTC()
            }
    }

    
    private func formatTimeInput(_ input: String) -> String {
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")

        // Remove non-numeric characters
        let numericString = input.components(separatedBy: allowedCharacterSet.inverted).joined()

        // Limit the input to 4 digits
        let limitedString = String(numericString.prefix(4))

        // Insert colons at appropriate positions (e.g., 2230 -> 22:30)
        let formattedString: String
        if limitedString.count > 2 {
            let index = limitedString.index(limitedString.startIndex, offsetBy: 2)
            let hour = limitedString[..<index]
            let minute = limitedString[index...]
            formattedString = "\(hour):\(minute)"
        } else {
            formattedString = limitedString
        }

        return formattedString
    }
    
}

struct TimeTextFieldUTC: View {
    @Binding var timeLocal: String
    @Binding var timeInUTC: String
    var description: String
    var body: some View {
        TextField(description, text: $timeInUTC)
            .textFieldStyle(.roundedBorder)
            .textContentType(.none)
            .keyboardType(.numberPad)
            .onChange(of: timeInUTC) { newValue in
                timeInUTC = formatTimeInput(newValue)
                timeLocal = timeInUTC.toCurrent()
            }
    }

    
    private func formatTimeInput(_ input: String) -> String {
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")

        // Remove non-numeric characters
        let numericString = input.components(separatedBy: allowedCharacterSet.inverted).joined()

        // Limit the input to 4 digits
        let limitedString = String(numericString.prefix(4))

        // Insert colons at appropriate positions (e.g., 2230 -> 22:30)
        let formattedString: String
        if limitedString.count > 2 {
            let index = limitedString.index(limitedString.startIndex, offsetBy: 2)
            let hour = limitedString[..<index]
            let minute = limitedString[index...]
            formattedString = "\(hour):\(minute)"
        } else {
            formattedString = limitedString
        }

        return formattedString
    }
    
}


extension String {
    func toUTC()->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let convertDate = formatter.date(from: self) ?? Date.now
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let convertDateTo = formatter.string(from: convertDate)
        
        return convertDateTo
    }
    func toCurrent()->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let convertDate = formatter.date(from: self) ?? Date.now
        formatter.timeZone = TimeZone.current
        let convertDateTo = formatter.string(from: convertDate)
        return convertDateTo
    }
}
