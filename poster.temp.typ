// define a template, just edit body in your own way.
#let poster(

  // The poster's title.
  title: "Paper Title",

  // A array of authors, a dict as inner like: (name:"Wenjie Wei", staff:"1,2").
  authors: (),

  // A array of departments, a dict as inner line: (id: "1", name: "Insitute Name")
  departments: (),

  // University logo.
  univ_logo: "Logo Path",

  // Team or Lab logo.
  team_logo: "Team logo path",

  // Footer center text.
  // For instance, Name of Conference, Date, Location.
  footer_center_text: "Footer Text",

  // Footer left text. Just DIY
  footer_left_text: "Footer Left DIY",

  // Footer right text. Usually emails.
  footer_right_text: "your@gmail.com",

  // Fill color of the footer.
  footer_color: "Hex Color Code",

  // Number of columns in the poster.
  num_columns: "2",

  // body font size.
  body_font_size: "30",

  // body_font, default: Scientific and Technical Information Exchange
  body_font: "STIX Two Text",

  // paragragh spacing.
  body_spacing: "1",

  // Poster title's font size (in pt).
  title_font_size: "72",

  // Authors' font size (in pt).
  authors_font_size: "28",

  // Footer's URL and email font size (in pt).
  footer_left_text_font_size: "30",

  // Footer's text font size (in pt).
  footer_center_text_font_size: "40",

  // The poster's content.
  body
) = {
  // Set the body font.
  set text(font: body_font, size: int(body_font_size) * 1pt)
  title_font_size = int(title_font_size) * 1pt
  authors_font_size = int(authors_font_size) * 1pt
  num_columns = int(num_columns)

  footer_left_text_font_size = int(footer_left_text_font_size) * 1pt
  footer_center_text_font_size = int(footer_center_text_font_size) * 1pt

  // Configure the page.
  // This poster defaults to 36in x 48in.
  // NOTE: If modified the page size, some issues may occur.
  // NOTE: In chinese, the poster size is usually 90cm x 120cm
  set page(
    width: 36in,
    height: 48in,
    margin:
      (top: 1in, left: 2in, right: 2in, bottom: 2in),
    footer: [
      #set align(center)
      #set text(32pt)
      #block(
        fill: rgb(footer_color),
        width: 100%,
        inset: 20pt,
        radius: 10pt,
        [
          #text(font: "Courier", size: footer_left_text_font_size, footer_left_text)
          #h(1fr)
          #text(size: footer_center_text_font_size, smallcaps(footer_center_text))
          #h(1fr)
          #text(font: "Courier", size: footer_left_text_font_size, footer_right_text)
        ]
      )
    ]
  )

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)

  // Configure lists.
  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt)
  // Configure headings.
  // set heading(numbering: "I.A.1.")
  show heading: it => locate(loc => {
    // Find out the final number of the heading counter.
    let levels = counter(heading).at(loc)
    let deepest = if levels != () {
      levels.last()
    } else {
      1
    }

    set text(40pt, weight: 900)
    if it.level == 1 [
      // First-level headings are centered smallcaps.
      #set align(center)
      #set text({ 48pt })
      #show: smallcaps
      #v(50pt, weak: true)
      #if it.numbering != none {
        numbering("I.", deepest)
        h(7pt, weak: true)
      }
      #it.body
      #v(35.75pt, weak: true)
      #line(length: 100%)
    ] else if it.level == 2 [
      // Second-level headings are run-ins.
      #set text(style: "italic")
      #v(32pt, weak: true)
      #if it.numbering != none {
        numbering("i.", deepest)
        h(7pt, weak: true)
      }
      #it.body
      #v(10pt, weak: true)
    ] else [
      // Third level headings are run-ins too, but different.
      #if it.level == 3 {
        numbering("1)", deepest)
        [ ]
      }
      _#(it.body):_
    ]
  })


  // Arranging the logo, title, authors, and department in the header.
  set par(leading: 1.5em) // set header line-spaces.
  align(center,
    grid(
      rows: 2,
      columns: (4in, 24in, 4in), // TODO: should adjust it by logo sizes.
      column-gutter: 0pt,
      row-gutter: 50pt,
      image(univ_logo, width: 100%),
      text(weight: "extrabold", size: title_font_size, title+"\n") +
      text(size: authors_font_size, (authors.map(author => [#author.name#super[#author.staff]]).join(", ")) + "\n")+
      text(size: authors_font_size, (departments.map(d => [#super[#d.id]#d.name]).join("\n ")) + "\n"),
      image(team_logo, width: 100%)
    )
  )

  // Start three column mode and configure paragraph properties.
  show: columns.with(num_columns, gutter: 64pt)
  set par(justify: true, first-line-indent: 0em)
  show par: set block(spacing: 0.65em)

  // Display the poster's contents.
  set par(leading: float(body_spacing) * 1em)
  body
}