import SwiftUI

struct CardView: View {
    let drink: Drink
    @State private var offset = CGSize.zero
    @State private var color: Color = .blue
    @State private var overlayOpacity: Double = 0.0 

    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: URL(string: drink.strDrinkThumb)) { image in
                    image.resizable()
                        .overlay(
                            color.opacity(overlayOpacity)
                        )
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 320, height: 420)
                .cornerRadius(12)
                .clipped()
                .padding(.bottom, 16)
                Text(drink.strDrink)
                    .font(.title)
                    .foregroundColor(.black)
                    .bold()
                    .frame(width: 320, height: 80)
                    .multilineTextAlignment(.center)
            }
            .background(.white)
            .cornerRadius(12)
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    withAnimation {
                        changeColor(width: offset.width)
                    }
                }
                .onEnded { _ in
                    withAnimation {
                        swipeCard(width: offset.width)
                        changeColor(width: offset.width)
                    }
                }
        )
    }

    func swipeCard(width: CGFloat) {
        switch width {
        case -500 ... -150:
            print("Card removed")
            offset = CGSize(width: -500, height: 0)
        case 150 ... 500:
            print("Card added")
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }

    func changeColor(width: CGFloat) {
        switch width {
        case -500 ... -10:
            color = .red
            overlayOpacity = min(max((width + 500) / 500, 0), 1)
        case 10 ... 500:
            color = .green
            overlayOpacity = min(max((width - 10) / 490, 0), 1)
        default:
            color = .blue
            overlayOpacity = 0
        }
    }
}
