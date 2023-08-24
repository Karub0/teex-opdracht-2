# To be able to browse through this model in the form of images:
# - docker run -it --rm -p 8080:8080 -v <SPECIFIC_LOCATION_OF_THIS_REPO_ON_YOUR_DISK>:/usr/local/structurizr structurizr/lite
# - visit http://localhost:8080

workspace "ANSIE" "This is the model for the ANSIE application" {
    model {
        student = person "Student"
        docent = person "Docent"
        ansie = softwareSystem "ANSIE" {
            browser = container "Browser" {
                app = component "App" "Retrieves next and previous questions and maintains state for current question"
                openQuestion = component "OpenQuestion" "Shows the current question from the App Component and its properties"
                navigator = component "Navigator" "Provides buttons to retrieve next and previous question based on the current question in the App component"
                restGateway = component "REST Gateway" "Responsible for communicating with the API"
            }
            apiApplication = container "Back-end" {
                questionController = component "OpenQuestion Controller" "Allows people to perform CRUD operations on open questions through a REST API"
                openQuestionRepository = component "OpenQuestion Repository" "Provides logic to communicate with the OpenQuestions table"
            }
            database = container "Database" {
                openQuestionsTable = component "OpenQuestions" "Table with all open ended questions"
            }
        }

        # relationships between people and software systems
        student -> ansie "Views exam questions"
        docent -> ansie "Manages exam questions"

        # relationships to/from containers
        student -> browser "Visits ANSIE" "HTTP"
        docent -> database "Manages exam data" "TCP/IP"

        # relationships to/from components
        student -> navigator "Button clicks"
        student -> app "Starts application"
        app -> app "Renders"
        app -> restGateway "Uses"
        app -> openQuestion "Renders"
        app -> navigator "Renders"
        navigator -> app "Dispatches events to"
        restGateway -> questionController "Retrieves openquestions data" "JSON / HTTP"
        questionController -> openQuestionRepository "Retrieves openquestions data"
        openQuestionRepository -> openQuestionsTable "Retrieves openquestions data" "SQL / TCP/IP"
    }

    views {
        systemlandscape "SystemLandscape" {
            include *
            autoLayout
        }

        systemcontext ansie "SystemContext" {
            include *
            animation {
                ansie
            }
            autoLayout
            description "The system context diagram for ANSIE."
            properties {
                structurizr.groups false
            }
        }

        container ansie "Containers" {
            include *
            animation {
                browser
                apiApplication
                database
            }
            autoLayout
            description "The container diagram for ANSIE."
        }

        component apiApplication "API-Components" {
            include *
            animation {
                questionController
                openQuestionRepository
            }
            autoLayout
            description "The component diagram for the API Application."
        }
        component browser "Browser-Components" {
            include *
            animation {
                app
                restGateway
                openQuestion
                navigator
            }
            autoLayout
            description "The component diagram for the API Application."
        }
        component database "Database-Components" {
            include *
            animation {
                openQuestionsTable
            }
            autoLayout
            description "The component diagram for the Database."
        }
        dynamic browser "Load-first-question" "Summarises how the question feature works in the single-page application." {
            student -> app "Application started"
            app -> app "useEffect()"
            app -> restGateway "fetchQuestion(index, setQuestion, setIndex)"
            restGateway -> app "setQuestion(question)"
            app -> openQuestion "render(question)"
            app -> navigator "render(question.id, nextEventHandler, previousEventHandler)"
            autoLayout
            description "Summarises how the question feature works in the single-page application."
        }
        dynamic browser "Load-next-question" "Summarises how the next question feature works in the single-page application." {
            student -> navigator "nextButton clicked"
            navigator -> app "nextEventHandler()"
            app -> app "setIndex(index+1)"
            app -> restGateway "fetchQuestion(index, setQuestion, setIndex)"
            restGateway -> app "setQuestion(question)"
            app -> openQuestion "render(question)"
            app -> navigator "render(question.id, nextEventHandler, previousEventHandler)"
            autoLayout
            description "Summarises how the next question feature works in the single-page application."
        }

        styles {
            element "Person" {
                background #08427b
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "browser" {
                shape WebBrowser
            }
            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
        }
    }


}
