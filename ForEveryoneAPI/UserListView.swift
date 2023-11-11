//
//  UserListView.swift
//  ForEveryoneAPI
//
//  Created by 송재훈 on 11/9/23.
//

import SwiftUI

struct UserListView: View {
    @Environment(\.dismiss) var dismiss
    @State var users = Users(page: 0, perPage: 0, total: 0, totalPages: 0, data: [], support: Support(url: "", text: ""))
    @State var isSearchShow = false
    @State var isSearchSuccess = false
    @State var searchResult = UserInfomation(id: 1, email: "", firstName: "", lastName: "", avatar: "")
    @State var searchId = ""
    
    func load(page: Int) {
        NetworkManger.request(for: .GetUserList(page: page), type: Users.self) {
            _ = $0.map {
                users = $0
            }
        }
    }
    
    func search() {
        NetworkManger.request(for: .GetSingleUser(id: searchId), type: User.self) {
            isSearchSuccess = false
            _ = $0.map {
                isSearchSuccess = true
                searchResult = $0.data
            }
        }
    }
    
    var body: some View {
        VStack {
            UserList
            
            Spacer()
        }
        .onAppear {
            load(page: 1)
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
        ForEach(0..<users.perPage, id: \.self) { idx in
            NavigationLink {
                DetailedUserView(user: users.data[idx])
            } label: {
                Text("Name: \(users.data[idx].firstName) \(users.data[idx].lastName)")
                    .multilineTextAlignment(.leading)
            }
            .font(.title)
            .padding()
        }
    }
    
    var SearchSheet: some View {
        VStack {
            HStack {
                TextField(text: $searchId) {
                    Text("유저 아이디")
                }
                
                Button {
                    search()
                } label: {
                    Text("검색")
                }
            }
            
            if isSearchSuccess {
                AsyncImage(url: URL(string: searchResult.avatar))
                Text("Email: \(searchResult.email)")
                Text("Name: \(searchResult.firstName) \(searchResult.lastName)")
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
                load(page: 1)
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.accentColor)
            }
            .disabled(users.page == 1)
            
            Text("\(users.page) 페이지")
            
            Button {
                load(page: 2)
            } label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(.accentColor)
            }
            .disabled(users.page == 2)
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    UserListView()
}
