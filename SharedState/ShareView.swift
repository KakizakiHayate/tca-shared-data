////
////  ShareView.swift
////  SharedState
////
////  Created by 柿崎逸 on 2024/01/18.
////
//
//import SwiftUI
//import ComposableArchitecture
//
//struct Share: Reducer {
//
//    struct ShareData: Equatable {
//        var isFirstUser = false
//    }
//
//    struct State: Equatable {
//        var sharedData: ShareData
//        var _share2: Share2.State
//    }
//
//    enum Action: Equatable {
//        case confirm
//    }
//
//    var body: some ReducerOf<Self> {
//        Reduce<State, Action> { state, action in
//            switch action {
//
//            case .confirm:
//                print(state.sharedData.isFirstUser)
//                return .none
//            }
//        }
//    }
//}
//
//extension Share.State {
//    var share2: Share2.State {
//        get {
//            return _share2.with(sharedData: sharedData)
//        }
//        set {
//            _share2 = newValue
//            sharedData = newValue.shareData
//        }
//    }
//}
//
//extension Share.State {
//    static func initial(sharedData: Share.ShareData) -> Share.State {
//        Share.State(sharedData: sharedData, _share2: .initial(sharedData: sharedData))
//    }
//}
//
//struct ShareView: View {
//    let store: StoreOf<Share>
//    var body: some View {
//        WithViewStore(self.store, observe: { $0 }) { viewStore in
//            Button {
//                viewStore.send(.confirm)
//            } label: {
//                Text("確認")
//            }
//            .padding()
//            ShareView2(store: self.store.scope(state: <#T##(Share.State) -> ChildState##(Share.State) -> ChildState##(_ state: Share.State) -> ChildState#>, action: <#T##(ChildAction) -> Share.Action##(ChildAction) -> Share.Action##(_ childAction: ChildAction) -> Share.Action#>)
//        }
//    }
//}
//
//struct Share2: Reducer {
//
//    struct State: Equatable {
//        var shareData: Share.ShareData
//    }
//
//    enum Action: Equatable {
//        case increment
//    }
//
//    var body: some ReducerOf<Self> {
//        Reduce<State, Action> { state, action in
//            switch action {
//
//            case .increment:
//                state.shareData.isFirstUser = true
//                print("trueに変更")
//                return .none
//            }
//        }
//    }
//}
//
//extension Share2.State {
//    static func initial(sharedData: Share.ShareData) -> Share2.State {
//        Share2.State(shareData: sharedData)
//    }
//}
//
//extension Share2.State {
//    func with(sharedData: Share.ShareData) -> Self {
//        var result = self
//        result.shareData = sharedData
//        return result
//    }
//}
//
//struct ShareView2: View {
//    let store: StoreOf<Share2>
//    var body: some View {
//        WithViewStore(self.store, observe: { $0 }) { viewStore in
//            Button {
//                viewStore.send(.increment)
//            } label: {
//                Text("+")
//            }
//        }
//    }
//}
//
////#Preview {
////    ShareView()
////}
