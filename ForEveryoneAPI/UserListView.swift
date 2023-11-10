//
//  UserListView.swift
//  ForEveryoneAPI
//
//  Created by 송재훈 on 11/9/23.
//

import SwiftUI

struct UserListView: View {
    @State var isSearchShow = false
    
    var body: some View {
        VStack {
            UserList
            
            Spacer()
        }
        .navigationTitle("유저 목록")
        .toolbar {
            ToolbarItem {
                SearchButton
            }
            
            ToolbarItem(placement: .bottomBar) {
                PageButton
            }
        }
        .sheet(isPresented: $isSearchShow) {
            SearchSheet
        }
    }
    
    var UserList: some View {
        ForEach(0..<5) { _ in
            NavigationLink {
                DetailedUserView()
            } label: {
                Text("ID: Moro")
                    .multilineTextAlignment(.leading)
            }
            .font(.title)
            .padding()
        }
    }
    
    var SearchSheet: some View {
        VStack {
            HStack {
                TextField(text: .constant("")) {
                    Text("유저 명")
                }
                
                Button {
                    
                } label: {
                    Text("검색")
                }
            }
        }
        .padding()
    }
    
    var SearchButton: some View {
        Button {
            isSearchShow = true
        } label: {
            Text("검색")
        }
    }
    
    var PageButton: some View {
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
}

#Preview {
    UserListView()
}
