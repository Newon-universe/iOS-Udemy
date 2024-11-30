//
//  StandupForm.swift
//  Standups
//
//  Created by Kim Yewon on 11/26/24.
//

import SwiftUI
import ComposableArchitecture

struct StandupFormFeature: Reducer {
    
    @ObservableState
    struct State: Equatable {
        var focus: Field?
        var standup: Standup
        
        enum Field: Hashable {
            case attendee(Attendee.ID)
            case title
        }
        
        init(focus: Field? = .title, standup: Standup) {
            self.focus = focus
            self.standup = standup
            
            if self.standup.attendees.isEmpty {
                self.standup.attendees.append(Attendee(id: UUID()))
            }
        }
    }
    
    enum Action: BindableAction {
        case addAttendeeButtonTapped
        case deleteAttendees(atOffsets: IndexSet)
        
        // Action should adopt BindableAction and State should annotated @ObservableState
        case binding(BindingAction<State>)
//        case setTitle(String)
//        case setDuration(Duration)
//        case setTheme(Theme)
        
    }
    
    @Dependency(\.uuid) var uuid
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
                
            case .addAttendeeButtonTapped:
                let id = self.uuid()
                state.standup.attendees.append(Attendee(id: id))
                state.focus = .attendee(id)
                return .none
                
            case .deleteAttendees(atOffsets: let indices):
                state.standup.attendees.remove(atOffsets: indices)
                if state.standup.attendees.isEmpty {
                    state.standup.attendees.append((Attendee(id: self.uuid())))
                }
                
                guard let firstIndex = indices.first else { return .none }
                let index = min(firstIndex, state.standup.attendees.count - 1)
                state.focus = .attendee(state.standup.attendees[index].id)
                
                return .none
                
            case .binding(_):
                return .none
            }
        }
    }
    
}

struct StandupFormView: View {
    @State var store: StoreOf<StandupFormFeature>
    /*
     That allows you to specify a binding to some hashable state, which is the thing that describes the current focus, as well as a hashable value that represents the focus of this text field. When the binding changes to a value matching the hashable value provided, the text field will be focused.

     So, sounds straightforward, but sadly it is not. If you look closely you will notice that the focused modifier doesn’t take a regular binding. It takes a FocusState.Binding, which is something that can only be created from the @FocusState property wrapper, and that only works in views.

     That’s right, focus in SwiftUI can only be controlled with constructs that work only in views. If you have complex and nuanced logic around how focus flows throughout your feature, then according to SwiftUI you must put all that logic in your view. You are not directly allowed to do that work in an observable object if you are using vanilla SwiftUI, or a reducer if you are using the Composable Architecture.

     There is a way to work around this luckily, but you do have to do a bit of work. What we need to do is add some focus state to our view:
     
     */
    
    @FocusState var focus: StandupFormFeature.State.Field?
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $store.standup.title)
                    .focused(self.$focus, equals: .title)
                HStack {
                    Slider(value: $store.standup.duration.minutes, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    Spacer()
                    Text(store.standup.duration.formatted(.units()))
                }
                ThemePicker(selection: $store.standup.theme)
            } header: {
                Text("Standup Info")
            }
            
            Section {
                ForEach($store.standup.attendees) { $attendee in
                    TextField("Name", text: $attendee.name)
                        .focused(self.$focus, equals: .attendee(attendee.id))
                }
                .onDelete { indices in
                    store.send(.deleteAttendees(atOffsets: indices))
                }
                
                Button("Add attendee") {
                    store.send(.addAttendeeButtonTapped)
                }
            } header: {
                Text("Attendees")
            }
        }
        .bind($store.focus, to: self.$focus)
    }
}

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: self.$selection) {
            ForEach(Theme.allCases) { theme in
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(theme.mainColor)
                    Label(theme.name, systemImage: "paintpalette")
                        .padding(4)
                }
                .foregroundColor(theme.accentColor)
                .fixedSize(horizontal: false, vertical: true)
                .tag(theme)
            }
        }
    }
}

extension Duration {
  fileprivate var minutes: Double {
    get { Double(self.components.seconds / 60) }
    set { self = .seconds(newValue * 60) }
  }
}

#Preview {
    NavigationStack {
        StandupFormView(
            store: Store(
                initialState: StandupFormFeature.State(standup: .mock)
            ) {
                    StandupFormFeature()
            }
        )
    }
}
