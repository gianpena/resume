// ===========================
// Resume of Gian Marco Peña
// ===========================

// ── Page setup ──────────────────────────────────────────────────────────────
#set page(
  paper: "us-letter",
  margin: (x: 0.5in, y: 0.2in),
)
#set text(size: 10pt)
#set par(leading: 0.4em)

// ── Contact info ─────────────────────────────────────────────────────────────
#let my-email   = sys.inputs.at("EMAIL", default: "[REDACTED]")
#let my-phone   = sys.inputs.at("PHONE_NUMBER", default: "[REDACTED]")
#let my-linkedin = sys.inputs.at("LINKEDIN", default: "[REDACTED]")

// ============================================================
// UI FUNCTIONS
// ============================================================

/// Section header with small-caps label and a full-width rule below.
#let section(title) = {
  pad(top: -2pt)[
    #{
      text(size: 12pt, weight: "bold")[#smallcaps(title)]
      v(-10pt)
      line(length: 100%, stroke: 0.6pt)
    }
  ]
}

/// Two-line subheading: bold title + date on the first row,
/// italic subtitle + location on the second row.
///   #subheading("Company", "Date", "Role", "City, ST")
#let subheading(org, date, role, loc) = {
  pad(top: -6pt)[
    #block(width: 100%)[
      #text(weight: "bold", size: 10pt)[#org]
      #h(1fr)
      #text(size: 10pt)[#date]
    ]
  ]
  
  pad(top: -6pt, bottom: -4pt)[
    #block(width: 100%)[
      #text(style: "italic", size: 9pt)[#role]
      #h(1fr)
      #text(style: "italic", size: 9pt)[#loc]
    ]
  ]

}

/// Project heading: bold name | tag | tag  ···  date
///   #project-heading("FIUJudge", ("Contest Environment", "Hybrid"), "June 2025 – Present")
#let project-heading(name, tags, date) = {
  pad(top: -6pt, bottom: -4pt)[
    #grid(
      columns: (1fr, auto),
      {
        text(weight: "bold")[#name]
        for t in tags { text[ $|$ #t] }
      },
      text[#date],
    )
  ]
  // v(-2pt)
}

/// Bulleted list of resume items with consistent small size & spacing.
#let items(..bullets) = {
  // set text(size: 8.5pt)
  set list(indent: 1em, body-indent: 0.4em, spacing: 4pt)
  pad(top: -2pt)[#list(..bullets.pos().map(b => b))]
  v(-1pt)
}

// ============================================================
// HEADER
// ============================================================
#import "@preview/fontawesome:0.5.0": *
#align(center)[
  #text(size: 18pt, weight: "bold")[#smallcaps[Gian Marco Peña]] \
  #text(size: 10pt)[
    #fa-icon("phone") #my-phone #h(6pt) | #h(6pt)
    #fa-icon("envelope") #my-email #h(6pt) | #h(6pt)
    #fa-icon("linkedin") #link(my-linkedin)[#my-linkedin]
  ]
]

// ============================================================
// EDUCATION
// ============================================================

#section("Education")

#subheading(
  "Florida International University",
  "August 2023 – May 2027",
  "B.S. Computer Science",
  "Miami, FL",
)
#items(
  [*Relevant coursework*: Data Structures, Computer Architecture, Systems Programming, Software Engineering],
)

// ============================================================
// EXPERIENCE
// ============================================================

#section("Experience")

#subheading("Capital One", "June 2025 – August 2025", "Software Engineering Intern", "Chicago, IL")
#items(
  [Developed device management feature for one of Capital One's customer-facing mobile applications, enabling *2000*+ members to view active sessions, selectively sign out of devices, and manage account security across platforms.],
  [Built using *React Native* for mobile, *React* for web, *NestJS* backend, and *MySQL* database with *Knex.js* for data interactions.],
  [Wrote comprehensive unit tests using *Jest* across frontend and backend to ensure feature reliability before production release.],
)

#subheading("Capital One", "June 2024 – August 2024", "Software Engineering Intern", "McLean, VA")
#items(
  [Developed software in the Capital One case management platform *Ease for Associates* to more efficiently organize the load of cases worked by all teams in order to evenly divide cases between over *1000* teams.],
  [Used *AngularJS* and *NgRx* to develop a seamless user interface by creating a platform for associates to work on cases not necessarily under their team's purview, enabling them to take the initiative on working cases.],
  [Wrote unit tests using *Jest* to ensure rigor in the feature's functionality, verifying that associates without the necessary privileges could not access the feature before it is available to all associates.],
)

// ============================================================
// LEADERSHIP
// ============================================================

#section("Leadership")

#subheading(
  "Director of Technology", "January 2026 - Present",
  "INIT FIU", "Miami, FL"
)
#items(
  [Directed development and deployment of a Python-based Discord bot using *discord.py* and *MySQL*, deployed with *Docker* to automate administrative workflows and deliver timely reminders across the organization's Discord server],
  [Automated key components of the admissions pipeline for ShellHacks, INIT FIU's annual hackathon serving over *1400* participants, reducing manual overhead for organizers through custom bot integrations],
  [Maintained and scaled Discord infrastructure for a *700+* member server, building tooling to streamline community operations and support one of FIU's largest student technology organizations]
)

#subheading(
  "High School Programming Competition Technical Lead",
  "February 2024 – February 2026",
  "FIU Programming Team",
  "Miami, FL",
)
#items(
  [Operated jointly with technical co-leads on the coordination and execution of our annual high school programming competition, overseeing aspects from initial planning to post-event evaluation.],
  [Automated the generation of large-scale test data sets using *Bash* and *Python3*, creating a robust pipeline to validate problem constraints and emulate the judging process.],
  [Configured the contest environment, including setting up and customizing DOMJudge, and authored a diverse set of problem statements to challenge participants' skills across multiple domains.],
)

// ============================================================
// PROJECTS
// ============================================================

#section("Projects")

#project-heading("FIUJudge", ("Contest Environment", "Hybrid"), "June 2025 – Present")
#items(
  [Developed a full-stack web application using *React* and *Express.js* with *SQLite* database to host high school programming contests for *30+* teams, replacing the existing judging platform for university-sponsored competitions.],
  [Implemented comprehensive contest features including real-time scoreboards, submission judging, clarification systems, contest announcements, and administrative oversight tools.],
)

#project-heading("BedStats", ("Discord Bot", "Remote"), "June 2020 – Present")
#items(
  [Leveraged *Node.js*, Discord's API and other *RESTful API* technologies to create a robust and scalable Discord bot, empowering users to access comprehensive Bedwars data within their own profiles or those of other players from the Hypixel Minecraft server.],
  [Successfully deployed the bot to approximately *5000* Discord servers, benefiting a diverse user base and fostering engagement within the gaming community.],
)

#project-heading("HappenIn", ("Event Discovery Platform", "KnightHacks"), "October 2025")
#items(
  [Created a mobile-friendly website inspired by Tinder, enabling users to discover local events and activities, and connect with others who share mutual interests.],
  [Designed the frontend using *React* for a seamless, responsive user experience.],
  [Engineered a backend split into two services: a *RESTful API* built with *Express.js* (Node.js) for core data operations, and a WebSocket server for real-time chat using the *ws* npm package for activity-based group messaging.],
  [Utilized *SQLite* to efficiently store and retrieve chat messages, ensuring reliable persistence and fast access for real-time conversations.],
)

// ============================================================
// TECHNICAL SKILLS
// ============================================================

#section("Technical Skills")

#pad(top:-4pt)[
  #text[- *Languages*: JavaScript, C++, Python3, Java, Typst, LaTeX, Bash, Zsh, SQLite, MySQL
- *Frameworks*: Node.js, Express.js, Next.js, React, React Native, Jest
- *Tools*: Git, Docker, Postman, Insomnia, AWS]
]
