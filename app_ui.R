library(shiny)
library(plotly)
library(knitr)

### Interaction Page One
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
                "Montana" = "Montana"
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

# Main content of interaction page one
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

### Interaction Page Two
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
                "Montana" = "MT"
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

# Main content of interaction page two
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
  h2("Overview"),
  p(
    "Our domain of interest was to find out how different demographics of",
    "each state have affected the political affiliation of the states which",
    "leads to a positive result of the 2020 president election. With this",
    "interest in mind we wanted to compare two different datasets: age",
    "and race demographics of each state and the numbers of actual votes",
    "from each state. As we progress through our research and analyzing",
    "data, we found out that age distribution did not seem to be a factor",
    "of the election results. So we chose to focus more on race distribution",
    "which showed us some sort of correlation."
    ),
  h2("Major Questions"),
  p("Did age distribution have any sort of affect on the political",
    "affiliation within each state?"),
  p("Did race distribution have any sort of affect on the political",
    "affiliation within each state?"),
  p("What was the number of actual votes casted to each candidate and what",
    "was the result within each state?"),
  h2("Datasets"),
  p("To answer our major questions, we have endeavored to find age and race",
    "demographics datasets of each state and the dataset that contains data",
    "of actual number of votes and the corresponding party affiliation of",
    "each state.")
)

# Has the image for the page
overview_sidebar_content <- sidebarPanel(
  div(id = "map",
      h3("2020 Election Map"),
      img(
        alt = "2020 Election Map", src =
        "https://d28695kzbtos76.cloudfront.net/elections/election-results/components/NationalMap/president/screenshots/2020-11-03_USA_G_P_NationalMap-0-232.png"
        )
    )
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
  h2("States with a higher population of white people tend to have higher",
     "odds of Donald Trump winning in that state."),
  p("States including West Virginia, Kentucky, and North Dakota had a",
    "projected 99.9% of Trump winning in that state. What all these states",
    "have in common is the large white majority, West Virginia's population",
    "being 0.925 white. This correlation gives us implications that Trump's",
    "leading demographic is white people, and gives us insight on how race",
    "plays into political view."),
  h2("States with a large population of non-white people tend to have",
     "lower odds of Trump winning in that state."),
  p("States including Hawaii, California, and Maryland had extremely low odds",
    "of Trump winning in that state. Hawaii having a non-white populace of",
    "0.796, had a projected 0.1% of Trump winning in that state, as well as",
    "the other states listed above. This tells us that there is an",
    "association between non-white voters and political view, in this",
    "case, not voting for Trump"),
  h2("States with more young eligible voters had a higher chance of Joe Biden",
     "winning in that state."),
  p("States including California, Rhode Island, and Illinois had the highest",
    "numbers of people aged 19-25 (0.092, 0.088, 0.087 respectively). In all",
    "these states, Biden's odds of winning were 99.9%. 19-25 being among the",
    "youngest of eligible voters, this tells us there is a correlation",
    "between voting age and political view. That states with large",
    "populations of young voters were more likely to vote for Biden, and",
    "that there may be a correlation between young people and voting",
    "for Biden.")
)

conclusion_panel <- tabPanel(
  "Takeaways",
  titlePanel("Takeaways:"),
    conclusion_page
)

ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(
    "AF2 - 2020 Presidential Election",
    overview_panel,
    race_panel,
    election_panel,
    conclusion_panel
  )
)