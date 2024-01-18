//
//  SwiftUIView.swift
//  SharedState
//
//  Created by 柿崎逸 on 2024/01/13.
//

import SwiftUI
import ComposableArchitecture

struct Prent: Reducer {
    struct State: Equatable {
        var isBool = 1
        var isIss = false
        var child: Child.State {
            get {
                Child.State(aa: self.isBool, bn: self.isIss)
            }
            set {
                self.isBool = newValue.aa
                self.isIss = newValue.bn
            }
        }

        init() {}
    }

    enum Action: Equatable {
        case onAppear
        case child(Child.Action)
    }

    var body: some ReducerOf<Self> {
        Scope(state: \.child, action: /Action.child) {
            Child()
        }
        Reduce<State, Action> { state, action in
            switch action {

            case .onAppear:
                state.isBool += 1
                print("\(state.isBool)")
                print("\(state.isIss)")
                return .none
            case .child(let childAction):
                return .none
            }
        }
    }
}

struct PrentView: View {
    let store: StoreOf<Prent>

    init(store: StoreOf<Prent>) {
        self.store = store
        _ = manager(store: self.store.scope(state: \.child, action: Prent.Action.child))

    }
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Button {
                viewStore.send(.onAppear)
                _ = manager(store: self.store.scope(state: \.child, action: Prent.Action.child))
            } label: {
                Text("+")
            }
            Text("sdss\(viewStore.isBool)")

            ChildView(store: self.store.scope(state: \.child, action: Prent.Action.child))
        }
    }
}

struct Child: Reducer {
    struct State: Equatable {
        var aa: Int
        var bn: Bool

        init(aa: Int, bn: Bool) {
            self.aa = aa
            self.bn = bn
        }
    }

    enum Action: Equatable {
        case onAppear
    }

    init() {
    }

    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {

            case .onAppear:
                print("1にする\(state.aa)")
                state.aa += 1
                state.bn = true
                return .none
            }
        }
    }
}

struct ChildView: View {
    let store: StoreOf<Child>
    init(store: StoreOf<Child>) {
        self.store = store
    }

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text("")
                Button {
                    viewStore.send(.onAppear)
                } label: {
                    Text("+")
                }
            }
        }
    }
}

class manager {
    static let shared = manager(store: .init(initialState: Child.State(aa: 0, bn: false), reducer: {
        Child()
    }))
    private let store: StoreOf<Child>
    init(store: StoreOf<Child>) {
        self.store = store
        self.store.send(.onAppear)
    }
}

//#Preview {
//    PrentView()
//}
