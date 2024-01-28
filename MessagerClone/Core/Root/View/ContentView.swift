//
//  ContentView.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 20/01/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                InboxView()
            }else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
