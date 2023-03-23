//
//  ContentView.swift
//  Memorize
//
//  Created by Kevin Velasco on 15/3/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame;
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit).onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                }
                
            }
            Spacer()
//            HStack {
//                remove
//                Spacer()
//                add
//            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        
    }
    
    
//    var remove: some View {
//        Button {
//            if (size > 1) {
//                print(size)
//                size -= 1;
//            }
//        } label: {
//            Image(systemName: "minus.circle")
//                   .resizable()
//                   .frame(width: 30, height: 30, alignment: .center)
//                   .foregroundColor(.blue)
//        }
//    }
//
//    var add: some View {
//        Button {
//            if(size < emojis.count) {
//              size += 1;
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//                    .resizable()
//                    .frame(width: 30, height: 30, alignment: .center)
//                    .foregroundColor(.blue).foregroundColor(.blue)
//        }
//    }
//
    struct ContentView_Previews: PreviewProvider {
        
        static var previews: some View {
            let game: EmojiMemoryGame = EmojiMemoryGame();
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
        }
    }
    
    
    struct CardView: View {
        let card: MemoryGame<String>.Card
        @State var isfaceUp: Bool = true;
        
        var body: some View {
            let shape: RoundedRectangle = RoundedRectangle(cornerRadius: 20)
            ZStack(alignment: .center, content: {
                if card.isfaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3).foregroundColor(.red)
                    Text(card.content)
                        .font(.largeTitle)
                        .padding(.all)
                        
                        
                } else {
                    shape.fill().foregroundColor(.red)
                    
                }
                
            })
        }
    }
}
