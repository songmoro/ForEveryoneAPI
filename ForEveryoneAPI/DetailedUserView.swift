//
//  DetailedUserView.swift
//  ForEveryoneAPI
//
//  Created by 송재훈 on 11/9/23.
//

import SwiftUI

struct DetailedUserView: View {
    @Environment(\.dismiss) var dismiss
    
    let user: UserInfomation
    @State var isContextShow = false
    
    func update() {
        NetworkManger.request(for: .UpdateUser(id: user.id, name: user.firstName, job: "zion resident"), type: ResponseUser.self) {
            print($0)
        }
    }
    
    func delete() {
        NetworkManger.request(for: .DeleteUser(id: 2), type: ResponseUser.self) { _ in }
        dismiss()
    }
    
    var body: some View {
        ZStack {
            detailedUser
        }
        .toolbar {
            ToolbarItem {
                Button {
                    isContextShow = true
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
        .confirmationDialog("수정하기", isPresented: $isContextShow) {
            ContextButton
        }
    }
    
    var detailedUser: some View {
        VStack {
            AsyncImage(url: URL(string: user.avatar)) {
                if let image = $0.image {
                    image
                }
                else {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
            .padding()
            
            Text("Email: \(user.email)")
            Text("name: \(user.firstName) \(user.lastName)")
        }
    }
    
    @ViewBuilder
    var ContextButton: some View {
        Button {
            update()
        } label: {
            Text("수정하기")
        }
        
        Button {
            delete()
        } label: {
            Text("삭제하기")
        }
    }
}

#Preview {
    DetailedUserView(user: UserInfomation(id: 1, email: "", firstName: "", lastName: "", avatar: ""))
}
