#import "./poster.temp.typ": *

/// HERE START CONFIGURE YOUR POSTER
#show: poster.with(
  title: [#text[TYPST: a #emph[rust] tool to compose essays faster, Maybe your looooonger title to 2 rows.]],
  authors: (
    (name: "Wenjie Wei", staff: "1"),
    (name: "Russell Westbrook", staff: "2*")
  ),
  departments: (
    (id: "1", name: "National Unnatural Phenomena Institute"),
    (id: "2", name: "Oklahoma Thunders")
  ),
  univ_logo: "images/logo.png",
  team_logo: "images/logo.png",
  footer_center_text: "The 6th Maize Biology Conference of China @ Harbin",
  footer_left_text: "Wenjie Wei: www.wjwei.blog",
  footer_right_text: "E-mail: wjwei9908@gmail.com",
  footer_color: "ebcfb2",
  num_columns: "2",
)
/// HERE END CONFIGURE YOUR POSTER


/// HERE START YOUR POSTER CONTENTS

= #lorem(2)
#lorem(200)


= Overview of Multi Omics
#figure(
    image("images/fig1.jpg",
        width: 100%),
    caption: lorem(2),
)

+ #lorem(20)
+ #lorem(20)
+ #lorem(20)
+ #lorem(20)
- #lorem(20)
- #lorem(20)
- #lorem(20)
  - #lorem(20)
  - #lorem(20)
  - #lorem(20)



= #lorem(3)

#grid(
    columns: (auto, auto),
    rows: (auto, auto),
    image("images/fig2.jpg",width: 100%),
    image("images/fig3.jpg",width: 100%),
    image("images/fig4.jpg",width: 100%),
    image("images/fig5.jpg",width: 100%),
)
#lorem(100)


= #lorem(3)
#lorem(100)


= #lorem(3)
#lorem(200)


/// HERE END YOUR POSTER CONTENTS
