//
//  Header.swift
//  NASA Cards
//
//  Created by dtermined on 27.04.2021.
//

import SwiftUI

struct HeaderContainer<T: View>: View {
    var content: T
    
    init(content: @escaping () -> T) {
        self.content = content()
        
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().shadowImage = UIImage()
        
        UINavigationBar.appearance().titleTextAttributes = [
            .font : UIFont(name: "IBMPlexSans-Medium", size: 15)!]
    }
    
    var body: some View {
        Group {
            content
        }
            .foregroundColor(Color.black)
            .navigationBarBackButtonHidden(true)
    }
}
