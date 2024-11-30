//
//  StandupsListView.swift
//  Standups
//
//  Created by Kim Yewon on 11/26/24.
//

import SwiftUI
import ComposableArchitecture

struct StandupsListFeature: Reducer {
    @ObservableState
    struct State {
        /*
         "The reaseon why don't use plane array but instead using IdentifiedArray from TCA "
         
         
         A plain array forces us to refer to elements in the array by their positional index, which is not a stable identifier. It is often the case that some work occurs in a row that causes some asynchronous work to be performed, and then when that work finishes you want to update or remove that element from the array. However, by the time you get around to updating or removing, the element may have moved to a different position or already been removed, and so the positional index you are referring to may be invalid. That can lead you to update the wrong row or possibly even crash.
         */
        
        var standups: IdentifiedArrayOf<Standup> = []
        
        /*
         
         IdentifiedArrayOf use stable ID instead positional ID that will makes easy to manage array.
         */
    }
    
    enum Action {
        case addButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                state.standups.append(
                    Standup(id: UUID(), theme: .allCases.randomElement()!)
                )
                return .none
            }
        }
    }
}

struct StandupsListView: View {
    let store: StoreOf<StandupsListFeature>
    
    var body: some View {
        List {
            ForEach(store.standups) { standup in
                CardView(standup: standup)
                    .listRowBackground(standup.theme.mainColor)
            }
        }
        .navigationTitle("Daily Standups")
        .toolbar {
            ToolbarItem {
                Button("Add") {
                    store.send(.addButtonTapped)
                }
            }
        }
    }
}

struct CardView: View {
  let standup: Standup

  var body: some View {
    VStack(alignment: .leading) {
      Text(self.standup.title)
        .font(.headline)
      Spacer()
      HStack {
        Label(
          "\(self.standup.attendees.count)",
          systemImage: "person.3"
        )
        Spacer()
        Label(
          self.standup.duration.formatted(.units()),
          systemImage: "clock"
        )
        .labelStyle(.trailingIcon)
      }
      .font(.caption)
    }
    .padding()
    .foregroundColor(self.standup.theme.accentColor)
  }
}

struct TrailingIconLabelStyle: LabelStyle {
  func makeBody(
    configuration: Configuration
  ) -> some View {
    HStack {
      configuration.title
      configuration.icon
    }
  }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
  static var trailingIcon: Self { Self() }
}

#Preview {
    MainActor.assumeIsolated {
        NavigationStack {
            StandupsListView(
                store: Store(
                    initialState: StandupsListFeature.State(
                        standups: [.mock]
                    )
                ) {
                    StandupsListFeature()
                }
            )
        }
    }
}
