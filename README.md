### Devops Challenge 1

Some of the test wording is pretty vague, and I don't have a Mac/XCode at home to integrate developer workflows properly into the XCode project, so there are limits to how much of this I could complete. 
It is also very unclear what the line "The backend needs to be written in Node.js" means, as this is the only mention of any backend anywhere. 
As far as I can tell the closest thing to a backend the app uses is its persistence store, but that hardly counts. 
I have done my best to fulfil the directions but they don't entirely make sense. 
Some of this reads like I am supposed to be writing unit tests, but the rules specified are not the sort of thing you use unit testing for. 
The rules stated are linting rules, not unit tests. 
So, I have added swiftlint to the project's dependencies and it is run against the files any time they try to commit using a git pre-commit hook. 
The hook runs a script that runs a normal swiftlint command, tests to see if it output anything, and if not (which means we're on linux and not macos), it will fall back to running the linting tests on a docker container.

The devops pipeline is a basic Github Actions pipeline that lints, tests, and builds the application. It may need more configuration to build this exact application, but macos job runners are expensive.
