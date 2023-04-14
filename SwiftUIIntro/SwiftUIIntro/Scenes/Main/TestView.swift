//
//  TestView.swift
//  SwiftUIIntro
//
//  Created by Ильдар Аглиуллов on 13.04.2023.
//

import SwiftUI
import AGLUI

struct TestView: View {
    
    
    var isLoading: Bool = false
    @State var currentImageIndex: Int = 0
    var scaleSumCart: Int = 1
    
    var textarray = ["WELCOME TO Monumental habits", "CREATE NEW HABIT EASILY", "KEEP TRACK OF YOUR PROGRESS", "JOIN A SUPPORTIVE COMMUNITY"]
    var imageArray = ["PageView1", "PageView2", "PageView3", "PageView4"]
    
    let text: String
    let color: Color
    
    var body: some View {
            PagingView(index: $currentImageIndex.animation(), maxIndex: imageArray.count - 1) {
                ForEach(imageArray, id: \.self) { imageURL in
                    VStack {
                        Text(imageURL)
                        .lineLimit(2)
                        .font(.custom(DynaPuff.bold, size: 32))
                    
                    Image(imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    }
                    .padding(.top, 80)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//            .padding()
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(text: "one", color: .red)
    }
}
