//
//  CustomTabBarView.swift
//  SwiftUIIntro
//
//  Created by Ильдар Аглиуллов on 13.04.2023.
//

import SwiftUI

struct CustomTabBarView: View {
    
    
    @Namespace private var menuItemTransition
    
    var tabbarItems: [String]
 
    @Binding var selectedIndex: Int
 
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tabbarItems.indices, id: \.self) { index in
                     
                        TabbarItem(name: tabbarItems[index], isActive: selectedIndex == index, namespace: menuItemTransition)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    selectedIndex = index
                                }
                            }
                    }
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(25)
            .onChange(of: selectedIndex) { index in
                withAnimation {
                    scrollView.scrollTo(index, anchor: .center)
                }
            }
        }
 
    }
}

//struct CustomTabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabBarView(tabbarItems: [ "Random", "Travel", "Wallpaper", "Food", "Interior Design" ])
//    }
//}

struct TabbarItem: View {
    var name: String
    var isActive: Bool = false
    let namespace: Namespace.ID
 
    var body: some View {
        if isActive {
            Text(name)
                .font(.subheadline)
                .padding(.horizontal)
                .padding(.vertical, 4)
                .foregroundColor(.white)
                .background(Capsule().foregroundColor(.purple))
                .matchedGeometryEffect(id: "highlightmenuitem", in: namespace)
        } else {
            Text(name)
                .font(.subheadline)
                .padding(.horizontal)
                .padding(.vertical, 4)
                .foregroundColor(.black)
        }
 
    }
}
