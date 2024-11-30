//
//  StandupFormTests.swift
//  StandupsTests
//
//  Created by Kim Yewon on 11/26/24.
//

import Foundation
import Testing
import ComposableArchitecture
@testable import Standups

struct StandupFormTests {

    @Test func testAddDeleteAttendee() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let store = await TestStore(
            initialState: StandupFormFeature.State(
                standup: Standup(
                    id: UUID(),
                    attendees: [
                        Attendee(id: UUID())
                    ]
                )
            )
        ) {
            StandupFormFeature()
        } withDependencies: {
            $0.uuid = .incrementing
        }
        
        await store.send(.addAttendeeButtonTapped) {
            $0.focus = .attendee(UUID(0))
            $0.standup.attendees.append(
                Attendee(id: UUID(0))
            )
        }
        
        await store.send(.deleteAttendees(atOffsets: [1])) {
            $0.focus = .attendee($0.standup.attendees[0].id)
            $0.standup.attendees.remove(at: 1)
        }
    }

}
