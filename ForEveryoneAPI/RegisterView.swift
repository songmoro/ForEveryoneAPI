//
//  RegisterView.swift
//  ForEveryoneAPI
//
//  Created by 송재훈 on 11/9/23.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            Group {
                TextField(text: .constant("")) {
                    Text("아이디를 입력해주세요.")
                }
                
                TextField(text: .constant("")) {
                    Text("비밀번호를 입력해주세요.")
                }
            }
            .font(.title)
            .padding()
            
            Button {
                
            } label: {
                Text("회원가입")
            }
            .padding()
        }
    }
}

#Preview {
    RegisterView()
}
