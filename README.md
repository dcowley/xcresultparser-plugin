# xcresultparser-plugin

A Swift Package Manager **Command Plugin** for [xcresultparser][xcresultparser].

This plugin allows you to parse `.xcresult` bundles and convert them into formats like JUnit, Cobertura, SonarQube, or JSON directly via `swift package`, eliminating the need to install the binary manually (e.g., via Homebrew) in your CI/CD environment.

> **Note:** All credit for the parsing logic goes to the [xcresultparser][xcresultparser] library.

## Installation

Add this repository to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/dcowley/xcresultparser-plugin", from: "1.0.0")
]
```

## Usage

You can run the tool from the root of your project using the swift package command. All arguments are passed directly to the underlying xcresultparser executable.

### Basic syntax

```bash
swift package xcresultparser <path-to-xcresult> <options>
```

### Examples

#### Coloured CLI

```bash
swift package xcresultparser build/Test.xcresult \
    --project-root PackageDir \
    --output-format cli \
    --coverage
```

This command parses the Test.xcresult bundle located in the build directory and outputs the results directly to the terminal in a human-readable, coloured format. The --output-format cli option is ideal for quickly reviewing test results and coverage data during local development.

#### Cobertura coverage report:

```bash
swift package xcresultparser build/Test.xcresult \
    --project-root PackageDir \
    --output-format cobertura \
    > cobertura-coverage.xml
```

This command processes the test results and generates a Cobertura XML coverage report. Cobertura is a widely supported format for code coverage, making this output (cobertura-report.xml) suitable for consumption by various CI/CD tools or reporting services that monitor code quality and coverage trends.

#### Markdown

```bash
swift package xcresultparser build/Test.xcresult \
    --project-root PackageDir \
    --output-format md \
    --coverage \
    > markdown-report.md
```

This command generates a Markdown file named coverage-report.md. The --output-format md combined with the --coverage flag means the report will include detailed test run information and code coverage metrics, which can be easily displayed and read in a repository's Pull Request summary or documentation.

[xcresultparser]: https://github.com/a7ex/xcresultparser
