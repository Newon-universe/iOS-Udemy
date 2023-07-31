//
//  File.swift
//  Today
//
//  Created by Kim Yewon on 2023/07/07.
//

import EventKit
import Foundation

// EKEventStore objects can access a user's calendar events and reminders.
extension EKEventStore {
    func reminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
        
        // The await keyword indicates that your task suspends until the continuation resuems.
        // All paths of execution must resume the continuation.
        try await withCheckedThrowingContinuation { continuation in
            fetchReminders(matching: predicate) { reminders in
                if let reminders {
                    continuation.resume(returning: reminders)
                } else {
                    continuation.resume(throwing: TodayError.failedReadingReminders)
                }
            }
        }
    }
}
