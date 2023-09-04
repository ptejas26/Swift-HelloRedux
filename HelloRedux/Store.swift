//
//  Store.swift
//  HelloRedux
//
//  Created by Tejas on 2023-09-03.
//

import Foundation

struct State {
    var counter: Int = 0
}

typealias Reducer = (_ state: State, _ action: any Action) -> State

protocol Action {}

struct IncrementAction: Action {}
struct DecrementAction: Action {}
struct AddAction: Action {
    var value: Int
}

func reducer(_ state: State, _ action: Action) -> State {
    var state = state
    switch action {
    case _ as IncrementAction:
        state.counter += 1
    case _ as DecrementAction:
        state.counter -= 1
    case let addValue as AddAction:
        state.counter += addValue.value
    default: break
    }
    return state
}

class Store: ObservableObject {
    var reducer: Reducer
    @Published var state: State
    
    init(reducer: @escaping Reducer, state: State = State()) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action: Action) {
        state = reducer(state, action)
    }
}
