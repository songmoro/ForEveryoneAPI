//
//  RegisterView.swift
//  ForEveryoneAPI
//
//  Created by 송재훈 on 11/9/23.
//

import SwiftUI

struct RegisterView: View {
//    "email": "eve.holt@reqres.in"
//    "password": "pistol"
    @State var email = ""
    @State var password = ""
    @State var isAlertShow = false
    @State var alertMessage = ""
    
    func register() {
        NetworkManger.request(for: .Register(email: email, password: password), type: ResponseAccount.self) {
            _ = $0.map {
                alertMessage = $0.token ?? $0.error!
            }
            isAlertShow = true
        }
    }
    
    var body: some View {
        VStack {
            Group {
                TextField(text: $email) {
                    Text("아이디를 입력해주세요.")
                }
                
                TextField(text: $password) {
                    Text("비밀번호를 입력해주세요.")
                }
            }
            .font(.title)
            .padding()
            
            Button {
                register()
            } label: {
                Text("회원가입")
            }
            .padding()
        }
        .alert(alertMessage, isPresented: $isAlertShow) {}
    }
}

#Preview {
    RegisterView()
}
