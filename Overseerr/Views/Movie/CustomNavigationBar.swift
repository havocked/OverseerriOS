//
//  CustomNavigationBar.swift
//  Overseerr
//
//  Created by Nataniel Martin on 15/12/2022.
//

import SwiftUI

struct CustomNavigationBar: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Rectangle()
                    .fill(.red)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .offset(
                        y: check(geometry) ? -geometry.frame(in: .global).minY : 0
                    )
                    .opacity(check(geometry) ? -0.01 * geometry.frame(in: .global).minY : 0)
                Spacer()
            }.ignoresSafeArea()
        }
    }
    
    func check(_ proxy: GeometryProxy) -> Bool {
        return proxy.frame(in: .named("scroll")).minY < 0
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar()
    }
}
