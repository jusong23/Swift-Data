/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The main view that contains the majority of the app's content.
*/

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var cards: [Card] // (4) @Query 를 통해 Observable 유형의 속성이 변경되면 데이터를 자동으로 View에 업데이트
    /// [모델 컨테이너]에서 [모델 컨텍스트]를 가져와 데이터 소스로 사용
    /// 정렬, 필터링 및 애니메이션 변경을 구성하는 간단한 구문을
    @State private var editing = false
    @State private var navigationPath: [Card] = []

    var body: some View {
        NavigationStack(path: $navigationPath) {
            CardGallery(cards: cards, editing: $editing) { card in
                withAnimation { navigationPath.append(card) }
            } addCard: {
                let newCard = Card(front: "Sample Front", back: "Sample Back")
                // save card
                withAnimation {
                    navigationPath.append(newCard)
                    editing = true
                }
            }
            .padding()
            .toolbar { EditorToolbar(isEnabled: false, editing: $editing) }
        }
    }
}

#Preview {
    ContentView()
        .frame(minWidth: 500, minHeight: 500)
}
