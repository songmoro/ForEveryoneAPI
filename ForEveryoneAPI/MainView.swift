//
//  MainView.swift
//  ForEveryoneAPI
//
//  Created by 송재훈 on 11/6/23.
//

import SwiftUI
import Moya

struct MainView: View {
//    "email": "eve.holt@reqres.in"
//    "password": "cityslicka"
    @State var email = ""
    @State var password = ""
    @State var isCertified = false
    @State var isAlertShow = false
    @State var alertMessage = ""
    
    func login() {
        NetworkManger.request(for: .Login(email: email, password: password), type: ResponseAccount.self) {
            _ = $0.map {
                if $0.token != nil {
                    isCertified = true
                }
                else {
                    alertMessage = $0.error!
                    isAlertShow = true
                }
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                InputField
                AuthButton
            }
            .alert(alertMessage, isPresented: $isAlertShow) { }
        }
    }
    
    var InputField: some View {
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
    }
    
    var AuthButton: some View {
        Group {
            Button {
                login()
            } label: {
                Text("로그인")
            }
            .navigationDestination(isPresented: $isCertified) {
                UserListView()
            }
            
            NavigationLink {
                RegisterView()
            } label: {
                Text("회원가입")
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
