//
//  ContentView.swift
//  Memorize
//
//  Created by Kevin Velasco on 15/3/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame;
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit).onTapGesture {
                            game.choose(card)
                        }
                    }
                }
                
            }
//            Spacer()
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
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.dark)
        }
    }
    
    
    struct CardView: View {
        let card: EmojiMemoryGame.Card
        @State var isfaceUp: Bool = true;
        
        var body: some View {
            GeometryReader{ geometry in
                let shape: RoundedRectangle = RoundedRectangle(cornerRadius: DrawingContants.conerRadius)
                ZStack(alignment: .center, content: {
                    if(card.isMatched) {
                        shape.opacity(0)
                    } else {
                        if card.isfaceUp {
                            shape.fill().foregroundColor(.white)
                            shape.strokeBorder(lineWidth: DrawingContants.lineWidth).foregroundColor(.red)
                            Text(card.content)
                                .font(font(in: geometry.size))
                                                        
                                
                        } else {
                            shape.fill().foregroundColor(.red)
                            
                        }
                    }
                })
            }
        }
        
        private func font(in size: CGSize) -> Font {
            Font.system(size: min(size.width, size.height) * DrawingContants.fontScale )
        }
        
        private struct DrawingContants {
            static let conerRadius: CGFloat = 20
            static let lineWidth: CGFloat = 3
            static let fontScale: CGFloat = 0.8
        }
    }
}
