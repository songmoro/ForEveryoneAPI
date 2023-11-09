//
//  MainView.swift
//  ForEveryoneAPI
//
//  Created by 송재훈 on 11/6/23.
//

import SwiftUI
import Moya

struct MainView: View {
    var body: some View {
        NavigationStack {
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
                
                Group {
                    NavigationLink {
                        
                    } label: {
                        Text("로그인")
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        Text("회원가입")
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    MainView()
}
