/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The main entry for the app.
*/

import SwiftUI

@main
struct SwiftDataFlashCardSample: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Card.self) // (5) 컨테이너를 설정하여 모델 컨텍스트로 데이터를 가져오고 저장할 준비
        /// 저장하려는 모델 유형 목록을 지정
        /// 하위 뷰에서 @Query가 사용할 컨텍스트를 포함하여 전체 스토리지 스택을 생성
        /// 하나의 뷰는 하나 이상의 모델 컨테이너를 포함할 수 있습니다.
    }
}
