/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A model that represents a card.
*/

import Foundation
import SwiftData

@Model // (1) Card가 Observable을 준수하게 됨 -> ObservableObject로 사용할 수 있음.
final class Card {
    var front: String // (2) Observable 및 @Published 속성 래퍼를 사용할 필요가 없어짐. (데이터 바인딩 방식의 간소화)
    var back: String
    var creationDate: Date

    init(front: String, back: String, creationDate: Date = .now) {
        self.front = front
        self.back = back
        self.creationDate = creationDate
    }
}

extension Card: Identifiable { }

extension Card: Hashable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.front == rhs.front &&
        lhs.back == rhs.back &&
        lhs.creationDate == rhs.creationDate
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(front)
        hasher.combine(back)
        hasher.combine(creationDate)
    }
}
