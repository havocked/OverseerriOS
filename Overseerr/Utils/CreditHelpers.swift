//
//  CreditHelpers.swift
//  Overseerr
//
//  Created by Nataniel Martin on 29/11/2022.
//

import Foundation

let priorityJobs: [String] =
[
    "Director",
    "Creator",
    "Screenplay",
    "Writer",
    "Composer",
    "Editor",
    "Producer",
    "Co-Producer",
    "Executive Producer",
    "Animation"
]

extension Array where Element == Crew {
    func sortCrewPriority() -> [Crew] {
        return self
            .filter({priorityJobs.contains($0.job) })
            .sorted { crewA, crewB in
                guard let aScore = priorityJobs.firstIndex(of: crewA.job).map({ Int($0) }), let bScore = priorityJobs.firstIndex(of: crewB.job).map({ Int($0) }) else {
                    return true
                }
                return (aScore - bScore > 0) ? false : true
            }
    }
}
