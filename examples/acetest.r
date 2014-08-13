library(shiny)
library(shinyAce)
library(restorepoint)

keys = list(runLineKey="Ctrl-Enter", helpKey="F1", runKey="Ctrl-R|Ctrl-Alt-R", hintKey="Ctrl-H")
ui = bootstrapPage(
  aceEditor("ace",value="text1\nline2", height=100,
            keyId=keys, showLineNumbers=FALSE,highlightActiveLine=FALSE)
  ,aceEditor("ace2",value="text2", height=100,keyId=keys)
)

server = function(input, output, session) {
  observe({
    print(input$cursorId)
    print(input$cursorId2)
  })
  observe({
    cat("\nrunLineKey pressed:")
    print(input$runLineKey)
  })
  observe({
    cat("\nhelpKey pressed:")
    print(input$helpKey)
  })

}

runApp(list(ui=ui, server=server), launch.browser=rstudio::viewer)
