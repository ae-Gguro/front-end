//
//  AnimalStudyListView.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI

struct AnimalStudyListView: View {
    let name: String
    @State private var viewModel = AnimalViewModel()
    @State private var currentPage = 0
    
    private let columns = [
        GridItem(.fixed(489), spacing: 70),
        GridItem(.fixed(489), spacing: 70)
    ]

    var body: some View {
        let pages = viewModel.animalSamples.chunked(into: 6) // 6개씩 한 페이지

        ZStack {
            BackgroundImage()

            VStack {
                ChildrenHeaderView()
                    .padding(.top, 30)

                Spacer().frame(height: 24)

                MessageBox(content: Text("\(name)야! 어떤 동물이 궁금해? 🐾"))

                Spacer().frame(height: 65)

                TabView(selection: $currentPage) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        LazyVGrid(columns: columns, spacing: 60) {
                            ForEach(pages[index]) { sample in
                                CategoryButton(text: sample.title, img: Image(sample.imageName))
                            }
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut, value: currentPage)
                .frame(height: 625)

                Spacer()
            }

            
            HStack {
                TriangleButton(direction: .left) {
                    if currentPage > 0 {
                        currentPage -= 1
                    }
                }
                .opacity(currentPage > 0 ? 1 : 0.3)
                .padding(.leading, 24)

                Spacer()

                TriangleButton(direction: .right) {
                    if currentPage < pages.count - 1 {
                        currentPage += 1
                    }
                }
                .opacity(currentPage < pages.count - 1 ? 1 : 0.3)
                .padding(.trailing, 24)
            }
            .padding(.top, 220)

        }
        
    }
}


#Preview {
    AnimalStudyListView(name: "은서")
}
