/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A grid that displays all cards.
*/

import SwiftUI
import SwiftData

struct CardGallery: View {
    @Query private var cards: [Card] // (4) @Query 를 통해 Observable 유형의 속성이 변경되면 데이터를 자동으로 View에 업데이트
    /// [모델 컨테이너]에서 [모델 컨텍스트]를 가져와 데이터 소스로 사용
    /// 정렬, 필터링 및 애니메이션 변경을 구성하는 간단한 구문을 제공
    @Binding var editing: Bool
    let selectCard: (Card) -> Void
    let addCard: () -> Void

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(Design.galleryGridSize)],
                spacing: 20
            ) {
                if Design.editFeatureEnabled {
                    CardGalleryItem(backgroundStyle: .fill.tertiary, action: addCard) {
                        LabeledContent("Add Card") {
                            Image(systemName: "plus")
                                .imageScale(.large)
                        }
                        .labelsHidden()
                    }
                    .shadow(radius: 2)
                }

                ForEach(cards) { card in
                    CardGalleryItem(backgroundStyle: Color.cardFront) {
                        selectCard(card)
                    } label: {
                        Text(card.front)
                    }
                }
            }
        }
        .scrollClipDisabled()
        .navigationDestination(for: Card.self) { [editing] selectedCard in
            CardCarousel(editing: editing, cards: cards, selectedCard: selectedCard)
                .toolbar { EditorToolbar(isEnabled: true, editing: $editing) }
                .onDisappear { $editing.wrappedValue = false }
        }
    }
}
