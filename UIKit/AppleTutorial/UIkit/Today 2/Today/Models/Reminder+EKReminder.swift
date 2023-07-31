//
//  Reminder+EKReminder.swift
//  Today
//
//  Created by Kim Yewon on 2023/07/07.
//

import EventKit
import Foundation

extension Reminder {
    init(with ekReminder: EKReminder) throws {
        guard let dueDate = ekReminder.alarms?.first?.absoluteDate else {
            throw TodayError.reminderHasNoDueDate
        }
        id = ekReminder.calendarItemIdentifier
        self.title = ekReminder.title
        self.dueDate = dueDate
        self.notes = ekReminder.notes
        self.isComplete = ekReminder.isCompleted
    }
}
