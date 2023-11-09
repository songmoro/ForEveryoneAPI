//
//  UserListView.swift
//  ForEveryoneAPI
//
//  Created by 송재훈 on 11/9/23.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        VStack {
            ForEach(0..<5) { _ in
                NavigationLink {
                    
                } label: {
                    Text("ID: Moro")
                        .multilineTextAlignment(.leading)
                }
                .font(.title)
                .padding()
            }
            
            Spacer()
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.accentColor)
                }
                .disabled(true)
                
                Text("1 페이지")
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.accentColor)
                }
            }
            .font(.title3)
            .padding()
        }
        .navigationTitle("유저 목록")
    }
}

#Preview {
    UserListView()
}
