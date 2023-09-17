import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

/*
                +-------------+
                |             |
                |     App     | Contains HelloWorld App target and HelloWorld unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project.app(name: "HelloWorld",
                          platform: .iOS,
                          additionalTargets: ["HelloWorldKit", "HelloWorldUI"])

let project2 = Project.app(name: "HelloWorld2",
                           platform: .iOS,
                           additionalTargets: ["HelloWorld2Kit, HelloWorld2UI"]
)
