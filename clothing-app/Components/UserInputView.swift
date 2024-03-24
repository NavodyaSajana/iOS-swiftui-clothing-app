//
//  UserInputView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-23.
//

import SwiftUI

struct UserInputView: View {
    
    @Binding var text : String
    let title: String
    let placeHolder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            if isSecureField {
                SecureField(placeHolder, text: $text)
                    .font(.system(size: 14))
            } else {
                TextField(placeHolder, text: $text)
                    .font(.system(size: 14))
            }
            
            Divider()
        }
    }
}

#Preview {
    UserInputView(text: .constant(""), title: "Email Address", placeHolder: "example@domain.com")
}
