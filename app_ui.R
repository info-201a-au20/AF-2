library(shiny)
library(plotly)


### Page One
# Lets the users input four states where they want to compare
race_sidebar_content <- sidebarPanel(
  selectInput("Location1",
              label = "State A to H",
              choices = list(
                "Alabama" = "Alabama",
                "Alaska" = "Alaska",
                "Arizona" = "Arizona",
                "Arkansas" = "Arkansas",
                "California" = "California",
                "Colorado" = "Colorado",
                "Connecticut" = "Connecticut",
                "Delaware" = "Delaware",
                "District of Columbia" = "District of Columbia",
                "Florida" = "Florida",
                "Georgia" = "Georgia",
                "Hawaii" = "Hawaii"
              ),
              selected = "Alabama"
  ),
  selectInput("Location2",
              label = "State I to M",
              choices = list(
                "Idaho" = "Idaho",
                "Illinois" = "Illinois",
                "Indiana" = "Indiana",
                "Iowa" = "Iowa",
                "Kansas" = "Kansas",
                "Kentucky" = "Kentucky",
                "Louisiana" = "Louisiana",
                "Maine" = "Maine",
                "Maryland" = "Maryland",
                "Massachusetts" = "Massachusetts",
                "Michigan" = "Michigan",
                "Minnesota" = "Minnesota",
                "Mississippi" = "Mississippi",
                "Missouri" = "Missouri",
                "Montana"= "Montana"
              ),
              selected = "Idaho"
  ),
  selectInput("Location3",
              label = "State N to P",
              choices = list(
                "Nebraska" = "Nebraska",
                "Nevada" = "Nevada",
                "New Hampshire" = "New Hampshire",
                "New Jersey" = "New Jersey",
                "New Mexico" = "New Mexico",
                "New York" = "New York",
                "North Carolina" = "North Carolina",
                "North Dakota" = "North Dakota",
                "Ohio" = "Ohio",
                "Oklahoma" = "Oklahoma",
                "Oregon" = "Oregon",
                "Pennsylvania" = "Pennsylvania"
              ),
              selected = "Nebraska"
  ),
  selectInput("Location4",
              label = "State R to W",
              choices = list(
                "Rhode Island" = "Rhode Island",
                "South Carolina" = "South Carolina",
                "South Dakota" = "South Dakota",
                "Tennessee" = "Tennessee",
                "Texas" = "Texas",
                "Utah" = "Utah",
                "Vermont" = "Vermont",
                "Virginia" = "Virginia",
                "Washington" = "Washington",
                "West Virginia" = "West Virginia",
                "Wisconsin" = "Wisconsin",
                "Wyoming" = "Wyoming"
              ),
              selected = "Rhode Island"
  )
)

# Main content of page one
race_main_content <- mainPanel(
  p("United States consists of 52 distinct states and each state has",
    "its own unique ratio of various races. This page lets the user choose",
    "four states to compare, then the bar chart will provide the race",
    "distribution accordingly in four different states."),
  plotlyOutput(outputId = "bar_race")
)

# Combines sidepanel and mainpanel
race_panel <- tabPanel(
  "Race Distribution",
  titlePanel("Race Distribution in Different States"),
  sidebarLayout(
    race_main_content,
    race_sidebar_content
  )
)

### Page Two
# Lets the users input four states where they want to compare
election_sidebar_content <- sidebarPanel(
  selectInput("State1",
              label = "State A to H",
              choices = list(
                "Alabama" = "AL",
                "Alaska" = "AK",
                "Arizona" = "AZ",
                "Arkansas" = "AR",
                "California" = "CA",
                "Colorado" = "CO",
                "Connecticut" = "CT",
                "Delaware" = "DE",
                "District of Columbia" = "D.C.",
                "Florida" = "FL",
                "Georgia" = "GA",
                "Hawaii" = "HI"
              ),
              selected = "Alabama"
  ),
  selectInput("State2",
              label = "State I to M",
              choices = list(
                "Idaho" = "ID",
                "Illinois" = "IL",
                "Indiana" = "IN",
                "Iowa" = "IA",
                "Kansas" = "KS",
                "Kentucky" = "KY",
                "Louisiana" = "LA",
                "Maine" = "ME",
                "Maryland" = "MD",
                "Massachusetts" = "MA",
                "Michigan" = "MI",
                "Minnesota" = "MN",
                "Mississippi" = "MS",
                "Missouri" = "MO",
                "Montana"= "MT"
              ),
              selected = "Idaho"
  ),
  selectInput("State3",
              label = "State N to P",
              choices = list(
                "Nebraska" = "NE",
                "Nevada" = "NV",
                "New Hampshire" = "NH",
                "New Jersey" = "NJ",
                "New Mexico" = "NM",
                "New York" = "NY",
                "North Carolina" = "NC",
                "North Dakota" = "ND",
                "Ohio" = "OH",
                "Oklahoma" = "OK",
                "Oregon" = "OR",
                "Pennsylvania" = "PA"
              ),
              selected = "Nebraska"
  ),
  selectInput("State4",
              label = "State R to W",
              choices = list(
                "Rhode Island" = "RI",
                "South Carolina" = "SC",
                "South Dakota" = "SD",
                "Tennessee" = "TN",
                "Texas" = "TX",
                "Utah" = "UT",
                "Vermont" = "VT",
                "Virginia" = "VA",
                "Washington" = "WA",
                "West Virginia" = "WV",
                "Wisconsin" = "WI",
                "Wyoming" = "WY"
              ),
              selected = "Rhode Island"
  )
)

# Main content of page two
election_main_content <- mainPanel(
  p("From the result of 2020 president election, we were able to see that",
    "this election was a very close call. From this page, users are able to",
    "pick and choose four different state and a stacked bar chart will show",
    "the number of votes voted in favor of Biden and Trump represented in",
    "blue and red along with the popular political affiliation amongst those",
    "states."),
  plotlyOutput(outputId = "bar_election")
)

# Combines sidepanel and mainpanel
election_panel <- tabPanel(
  "Election",
  titlePanel("Election Results in Different States"),
  sidebarLayout(
    election_main_content,
    election_sidebar_content
  )
)

# Main content of overview page
overview_main_content <- mainPanel(
  h2("Focus of the project"),
  p(
    "In this project we wanted to know the affect of Race in elections.",
    " We determined not to focus on the white race because in almost every",
    " state they are the majority. So it would be hard to determine if race",
    " played a factor in that state. So we decided to look at",
    strong("Non-White"),
    "races. First we took the demographical data of each state and converted",
    " it into percentages. We created a graph for the race percentages in",
    " each state. we also determined the odds of the white race and non-white",
    " race would vote for trump."
    ),
)

# Has the image for the page
overview_sidebar_content <- sidebarPanel(
    img(src = "data/electoral_map_2020"),
    h6("This is the Final electoral map of the 2020 election")
)

# combines  sidepanel and mainpanel
overview_panel <- tabPanel(
  "Overview",
  titlePanel("Overview of the Project"),
  sidebarLayout(
    overview_main_content,
    overview_sidebar_content
  )
)

# Conclusion Page
conclusion_page <- mainPanel(
  tableOutput(trump_white_table(race_and_vote)),
  tableOutput(trump_nonwhite_table(race_and_vote)),
  tableOutput(biden_age_table(age_and_vote))
)
conclusion_sidebar <- sidebarPanel(
  h1("Testing")
)
conclusion_panel <- tabPanel(
  "Conclusion Information",
  titlePanel("Conclusion Information of Odds, Race, and Age"),
  sidebarLayout(
    conclusion_page,
    conclusion_sidebar
  )
  
)

ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(
    "AF2 - 2020 Presidential Election",
    overview_panel,
    race_panel,
    election_panel
  )
)

