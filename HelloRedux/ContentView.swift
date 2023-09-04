//
//  ContentView.swift
//  HelloRedux
//
//  Created by Tejas on 2023-09-03.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store
    
    // Local prop of the global store prop
    struct Props {
        let counter: Int
        let onIncrement: () -> Void
        let onDecrement: () -> Void
        let onAdd: (Int) -> Void
    }
    
    private func maps(state: State) -> Props {
        return Props(counter: state.counter) {
            store.dispatch(action: IncrementAction())
        } onDecrement: {
            store.dispatch(action: DecrementAction())
        } onAdd: { value in
            store.dispatch(action: AddAction(value: value))
        }
    }
    
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
            let props = maps(state: store.state)
            HStack {
                Button("+") {
                    props.onIncrement()
                }
                Text("\(props.counter)")
    
                Button("-") {
                    props.onDecrement()
                }
            }
            Button("Add Value") {
                props.onAdd(120)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: reducer)
        ContentView().environmentObject(store)
    }
}
