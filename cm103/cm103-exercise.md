cm103 Worksheet
================

``` r
suppressPackageStartupMessages(library(tidyverse)) # Loads purrr, too
library(repurrrsive) # Contains data examples
library(listviewer) # For viewing JSON/lists interactively
```

## Resources

This week, we’ll be drawing from [Jenny Bryan’s `purrr`
tutorial](https://jennybc.github.io/purrr-tutorial/). Specifically:

  - The [`map`
    tutorial](https://jennybc.github.io/purrr-tutorial/ls01_map-name-position-shortcuts.html)
  - The [GitHub users
    tutorial](https://jennybc.github.io/purrr-tutorial/ls02_map-extraction-advanced.html)
    is similar.

In addition:

  - Do you feel that you need a refresher on lists and vectors in R?
    Check out the [Vectors and
    Lists](https://jennybc.github.io/purrr-tutorial/bk00_vectors-and-lists.html)
    part of the tutorial.
  - Are you familiar with the `apply` family of functions in Base R? You
    might find Jenny’s [“Relationship to base and plyr
    functions”](https://jennybc.github.io/purrr-tutorial/bk01_base-functions.html)
    great for bridging the gap to `purrr`.

## Review Vectors and Lists

Vectors:

  - hold multiple entries of the same type.
  - coerced to the least-informative data type in the vector. eg.
    c(“hi”, 5) -\> “hi”, “5”
  - subset with single square brackets letters\[7\] -\> “g”

Lists:

  - hold multiple entries of anything.
  - no entries are coerced (as a result of being able to hold anything)
  - subset with `[`, `[[`, or `$`.
      - single `[` I want a list with the first component (Python
        dctionary key)
      - double `[[` I want the contents for the first component, get
        single component with `$`

## Review Vectorization

\= element-wise application of a function.

Examples:

``` r
(1:10) ^ 2
```

    ##  [1]   1   4   9  16  25  36  49  64  81 100

``` r
(1:10) * (1:2)
```

    ##  [1]  1  4  3  8  5 12  7 16  9 20

``` r
commute <- c(40, 20, 35, 15)
person <- c("Parveen", "Leo", "Shawn", "Emmotions")
str_c(person, " takes ", commute, " minutes to commute to work.")
```

    ## [1] "Parveen takes 40 minutes to commute to work."  
    ## [2] "Leo takes 20 minutes to commute to work."      
    ## [3] "Shawn takes 35 minutes to commute to work."    
    ## [4] "Emmotions takes 15 minutes to commute to work."

## `purrr`

`purrr` is great when vectorization does not apply\!

Particularly useful if your data is in JSON format.

Example:

1.  Explore the `wesanderson` list (comes with `repurrrsive` package).
    Hint: `str()` might help. It’s a list of vectors.
2.  Use what you know about R to write code that extracts a vector of
    the first elements of each vector contained in `wesanderson`.

<!-- end list -->

``` r
x <- character(0)
for (i in 1:length(wesanderson)) x[i] <- wesanderson[[i]][1]
x
```

    ##  [1] "#F1BB7B" "#F3DF6C" "#899DA4" "#798E87" "#D8B70A" "#9A8822" "#E6A0C4"
    ##  [8] "#85D4E3" "#446455" "#3B9AB2" "#DD8D29" "#FF0000" "#E1BD6D" "#A42820"
    ## [15] "#ECCBAE"

`str()` is not always useful\! Try checking the structure of `got_chars`
(= Game of Thrones characters):

``` r
# str(got_chars)
```

## Exploring lists

1.  `str()`: embrace `list.len` and `max.level`

<!-- end list -->

``` r
str(got_chars, list.len = 4, max.level = 2)
```

    ## List of 30
    ##  $ :List of 18
    ##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1022"
    ##   ..$ id         : int 1022
    ##   ..$ name       : chr "Theon Greyjoy"
    ##   ..$ gender     : chr "Male"
    ##   .. [list output truncated]
    ##  $ :List of 18
    ##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1052"
    ##   ..$ id         : int 1052
    ##   ..$ name       : chr "Tyrion Lannister"
    ##   ..$ gender     : chr "Male"
    ##   .. [list output truncated]
    ##  $ :List of 18
    ##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1074"
    ##   ..$ id         : int 1074
    ##   ..$ name       : chr "Victarion Greyjoy"
    ##   ..$ gender     : chr "Male"
    ##   .. [list output truncated]
    ##  $ :List of 18
    ##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1109"
    ##   ..$ id         : int 1109
    ##   ..$ name       : chr "Will"
    ##   ..$ gender     : chr "Male"
    ##   .. [list output truncated]
    ##   [list output truncated]

2.  Interactive exploration: `View()` and `listviewer::jsonedit(...,
    mode = "view")`

<!-- end list -->

``` r
# View(got_chars)
jsonedit(got_chars, mode="view")
```

<!--html_preserve-->

<div id="htmlwidget-dc7df66e605828c8e86c" class="jsonedit html-widget" style="width:672px;height:480px;">

</div>

<script type="application/json" data-for="htmlwidget-dc7df66e605828c8e86c">{"x":{"data":[{"url":"https://www.anapioficeandfire.com/api/characters/1022","id":1022,"name":"Theon Greyjoy","gender":"Male","culture":"Ironborn","born":"In 278 AC or 279 AC, at Pyke","died":"","alive":true,"titles":["Prince of Winterfell","Captain of Sea Bitch","Lord of the Iron Islands (by law of the green lands)"],"aliases":["Prince of Fools","Theon Turncloak","Reek","Theon Kinslayer"],"father":"","mother":"","spouse":"","allegiances":"House Greyjoy of Pyke","books":["A Game of Thrones","A Storm of Swords","A Feast for Crows"],"povBooks":["A Clash of Kings","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Alfie Allen"},{"url":"https://www.anapioficeandfire.com/api/characters/1052","id":1052,"name":"Tyrion Lannister","gender":"Male","culture":"","born":"In 273 AC, at Casterly Rock","died":"","alive":true,"titles":["Acting Hand of the King (former)","Master of Coin (former)"],"aliases":["The Imp","Halfman","The boyman","Giant of Lannister","Lord Tywin's Doom","Lord Tywin's Bane","Yollo","Hugor Hill","No-Nose","Freak","Dwarf"],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/2044","allegiances":"House Lannister of Casterly Rock","books":["A Feast for Crows","The World of Ice and Fire"],"povBooks":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Peter Dinklage"},{"url":"https://www.anapioficeandfire.com/api/characters/1074","id":1074,"name":"Victarion Greyjoy","gender":"Male","culture":"Ironborn","born":"In 268 AC or before, at Pyke","died":"","alive":true,"titles":["Lord Captain of the Iron Fleet","Master of the Iron Victory"],"aliases":"The Iron Captain","father":"","mother":"","spouse":"","allegiances":"House Greyjoy of Pyke","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords"],"povBooks":["A Feast for Crows","A Dance with Dragons"],"tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/1109","id":1109,"name":"Will","gender":"Male","culture":"","born":"","died":"In 297 AC, at Haunted Forest","alive":false,"titles":"","aliases":"","father":"","mother":"","spouse":"","allegiances":[],"books":"A Clash of Kings","povBooks":"A Game of Thrones","tvSeries":"","playedBy":"Bronson Webb"},{"url":"https://www.anapioficeandfire.com/api/characters/1166","id":1166,"name":"Areo Hotah","gender":"Male","culture":"Norvoshi","born":"In 257 AC or before, at Norvos","died":"","alive":true,"titles":"Captain of the Guard at Sunspear","aliases":"","father":"","mother":"","spouse":"","allegiances":"House Nymeros Martell of Sunspear","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords"],"povBooks":["A Feast for Crows","A Dance with Dragons"],"tvSeries":["Season 5","Season 6"],"playedBy":"DeObia Oparei"},{"url":"https://www.anapioficeandfire.com/api/characters/1267","id":1267,"name":"Chett","gender":"Male","culture":"","born":"At Hag's Mire","died":"In 299 AC, at Fist of the First Men","alive":false,"titles":"","aliases":"","father":"","mother":"","spouse":"","allegiances":[],"books":["A Game of Thrones","A Clash of Kings"],"povBooks":"A Storm of Swords","tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/1295","id":1295,"name":"Cressen","gender":"Male","culture":"","born":"In 219 AC or 220 AC","died":"In 299 AC, at Dragonstone","alive":false,"titles":"Maester","aliases":"","father":"","mother":"","spouse":"","allegiances":[],"books":["A Storm of Swords","A Feast for Crows"],"povBooks":"A Clash of Kings","tvSeries":"Season 2","playedBy":"Oliver Ford"},{"url":"https://www.anapioficeandfire.com/api/characters/130","id":130,"name":"Arianne Martell","gender":"Female","culture":"Dornish","born":"In 276 AC, at Sunspear","died":"","alive":true,"titles":"Princess of Dorne","aliases":"","father":"","mother":"","spouse":"","allegiances":"House Nymeros Martell of Sunspear","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"povBooks":"A Feast for Crows","tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/1303","id":1303,"name":"Daenerys Targaryen","gender":"Female","culture":"Valyrian","born":"In 284 AC, at Dragonstone","died":"","alive":true,"titles":["Queen of the Andals and the Rhoynar and the First Men, Lord of the Seven Kingdoms","Khaleesi of the Great Grass Sea","Breaker of Shackles/Chains","Queen of Meereen","Princess of Dragonstone"],"aliases":["Dany","Daenerys Stormborn","The Unburnt","Mother of Dragons","Mother","Mhysa","The Silver Queen","Silver Lady","Dragonmother","The Dragon Queen","The Mad King's daughter"],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/1346","allegiances":"House Targaryen of King's Landing","books":"A Feast for Crows","povBooks":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Emilia Clarke"},{"url":"https://www.anapioficeandfire.com/api/characters/1319","id":1319,"name":"Davos Seaworth","gender":"Male","culture":"Westeros","born":"In 260 AC or before, at King's Landing","died":"","alive":true,"titles":["Ser","Lord of the Rainwood","Admiral of the Narrow Sea","Hand of the King"],"aliases":["Onion Knight","Davos Shorthand","Ser Onions","Onion Lord","Smuggler"],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/1676","allegiances":["House Baratheon of Dragonstone","House Seaworth of Cape Wrath"],"books":"A Feast for Crows","povBooks":["A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"tvSeries":["Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Liam Cunningham"},{"url":"https://www.anapioficeandfire.com/api/characters/148","id":148,"name":"Arya Stark","gender":"Female","culture":"Northmen","born":"In 289 AC, at Winterfell","died":"","alive":true,"titles":"Princess","aliases":["Arya Horseface","Arya Underfoot","Arry","Lumpyface","Lumpyhead","Stickboy","Weasel","Nymeria","Squan","Saltb","Cat of the Canaly","Bets","The Blind Girh","The Ugly Little Girl","Mercedenl","Mercye"],"father":"","mother":"","spouse":"","allegiances":"House Stark of Winterfell","books":[],"povBooks":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Feast for Crows","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Maisie Williams"},{"url":"https://www.anapioficeandfire.com/api/characters/149","id":149,"name":"Arys Oakheart","gender":"Male","culture":"Reach","born":"At Old Oak","died":"In 300 AC, at the Greenblood","alive":false,"titles":"Ser","aliases":"","father":"","mother":"","spouse":"","allegiances":"House Oakheart of Old Oak","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"povBooks":"A Feast for Crows","tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/150","id":150,"name":"Asha Greyjoy","gender":"Female","culture":"Ironborn","born":"In 275 AC or 276 AC, at Pyke","died":"","alive":true,"titles":["Princess","Captain of the Black Wind","Conqueror of Deepwood Motte"],"aliases":["Esgred","The Kraken's Daughter"],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/1372","allegiances":["House Greyjoy of Pyke","House Ironmaker"],"books":["A Game of Thrones","A Clash of Kings"],"povBooks":["A Feast for Crows","A Dance with Dragons"],"tvSeries":["Season 2","Season 3","Season 4"],"playedBy":"Gemma Whelan"},{"url":"https://www.anapioficeandfire.com/api/characters/168","id":168,"name":"Barristan Selmy","gender":"Male","culture":"Westeros","born":"In 237 AC","died":"","alive":true,"titles":["Ser","Hand of the Queen"],"aliases":["Barristan the Bold","Arstan Whitebeard","Ser Grandfather","Barristan the Old","Old Ser"],"father":"","mother":"","spouse":"","allegiances":["House Selmy of Harvest Hall","House Targaryen of King's Landing"],"books":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Feast for Crows","The World of Ice and Fire"],"povBooks":"A Dance with Dragons","tvSeries":["Season 1","Season 3","Season 4","Season 5"],"playedBy":"Ian McElhinney"},{"url":"https://www.anapioficeandfire.com/api/characters/2066","id":2066,"name":"Varamyr","gender":"Male","culture":"Free Folk","born":"At a village Beyond the Wall","died":"In 300 AC, at a village Beyond the Wall","alive":false,"titles":"","aliases":["Varamyr Sixskins","Haggon","Lump"],"father":"","mother":"","spouse":"","allegiances":[],"books":"A Storm of Swords","povBooks":"A Dance with Dragons","tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/208","id":208,"name":"Brandon Stark","gender":"Male","culture":"Northmen","born":"In 290 AC, at Winterfell","died":"","alive":true,"titles":"Prince of Winterfell","aliases":["Bran","Bran the Broken","The Winged Wolf"],"father":"","mother":"","spouse":"","allegiances":"House Stark of Winterfell","books":"A Feast for Crows","povBooks":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 6"],"playedBy":"Isaac Hempstead-Wright"},{"url":"https://www.anapioficeandfire.com/api/characters/216","id":216,"name":"Brienne of Tarth","gender":"Female","culture":"","born":"In 280 AC","died":"","alive":true,"titles":"","aliases":["The Maid of Tarth","Brienne the Beauty","Brienne the Blue"],"father":"","mother":"","spouse":"","allegiances":["House Baratheon of Storm's End","House Stark of Winterfell","House Tarth of Evenfall Hall"],"books":["A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"povBooks":"A Feast for Crows","tvSeries":["Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Gwendoline Christie"},{"url":"https://www.anapioficeandfire.com/api/characters/232","id":232,"name":"Catelyn Stark","gender":"Female","culture":"Rivermen","born":"In 264 AC, at Riverrun","died":"In 299 AC, at the Twins","alive":false,"titles":"Lady of Winterfell","aliases":["Catelyn Tully","Lady Stoneheart","The Silent Sistet","Mother Mercilesr","The Hangwomans"],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/339","allegiances":["House Stark of Winterfell","House Tully of Riverrun"],"books":["A Feast for Crows","A Dance with Dragons"],"povBooks":["A Game of Thrones","A Clash of Kings","A Storm of Swords"],"tvSeries":["Season 1","Season 2","Season 3"],"playedBy":"Michelle Fairley"},{"url":"https://www.anapioficeandfire.com/api/characters/238","id":238,"name":"Cersei Lannister","gender":"Female","culture":"Westerman","born":"In 266 AC, at Casterly Rock","died":"","alive":true,"titles":["Light of the West","Queen Dowager","Protector of the Realm","Lady of Casterly Rock","Queen Regent"],"aliases":[],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/901","allegiances":"House Lannister of Casterly Rock","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords"],"povBooks":["A Feast for Crows","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Lena Headey"},{"url":"https://www.anapioficeandfire.com/api/characters/339","id":339,"name":"Eddard Stark","gender":"Male","culture":"Northmen","born":"In 263 AC, at Winterfell","died":"In 299 AC, at Great Sept of Baelor in King's Landing","alive":false,"titles":["Lord of Winterfell","Warden of the North","Hand of the King","Protector of the Realm","Regent"],"aliases":["Ned","The Ned","The Quiet Wolf"],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/232","allegiances":"House Stark of Winterfell","books":["A Clash of Kings","A Storm of Swords","A Feast for Crows","A Dance with Dragons","The World of Ice and Fire"],"povBooks":"A Game of Thrones","tvSeries":["Season 1","Season 6"],"playedBy":["Sean Bean","Sebastian Croft","Robert Aramayo"]},{"url":"https://www.anapioficeandfire.com/api/characters/529","id":529,"name":"Jaime Lannister","gender":"Male","culture":"Westerlands","born":"In 266 AC, at Casterly Rock","died":"","alive":true,"titles":["Ser","Lord Commander of the Kingsguard","Warden of the East (formerly)"],"aliases":["The Kingslayer","The Lion of Lannister","The Young Lion","Cripple"],"father":"","mother":"","spouse":"","allegiances":"House Lannister of Casterly Rock","books":["A Game of Thrones","A Clash of Kings"],"povBooks":["A Storm of Swords","A Feast for Crows","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5"],"playedBy":"Nikolaj Coster-Waldau"},{"url":"https://www.anapioficeandfire.com/api/characters/576","id":576,"name":"Jon Connington","gender":"Male","culture":"Stormlands","born":"In or between 263 AC and 265 AC","died":"","alive":true,"titles":["Lord of Griffin's Roost","Hand of the King","Hand of the True King"],"aliases":"Griffthe Mad King's Hand","father":"","mother":"","spouse":"","allegiances":["House Connington of Griffin's Roost","House Targaryen of King's Landing"],"books":["A Storm of Swords","A Feast for Crows","The World of Ice and Fire"],"povBooks":"A Dance with Dragons","tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/583","id":583,"name":"Jon Snow","gender":"Male","culture":"Northmen","born":"In 283 AC","died":"","alive":true,"titles":"Lord Commander of the Night's Watch","aliases":["Lord Snow","Ned Stark's Bastard","The Snow of Winterfell","The Crow-Come-Over","The 998th Lord Commander of the Night's Watch","The Bastard of Winterfell","The Black Bastard of the Wall","Lord Crow"],"father":"","mother":"","spouse":"","allegiances":"House Stark of Winterfell","books":"A Feast for Crows","povBooks":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Kit Harington"},{"url":"https://www.anapioficeandfire.com/api/characters/60","id":60,"name":"Aeron Greyjoy","gender":"Male","culture":"Ironborn","born":"In or between 269 AC and 273 AC, at Pyke","died":"","alive":true,"titles":["Priest of the Drowned God","Captain of the Golden Storm (formerly)"],"aliases":["The Damphair","Aeron Damphair"],"father":"","mother":"","spouse":"","allegiances":"House Greyjoy of Pyke","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"povBooks":"A Feast for Crows","tvSeries":"Season 6","playedBy":"Michael Feast"},{"url":"https://www.anapioficeandfire.com/api/characters/605","id":605,"name":"Kevan Lannister","gender":"Male","culture":"","born":"In 244 AC","died":"In 300 AC, at King's Landing","alive":false,"titles":["Ser","Master of laws","Lord Regent","Protector of the Realm"],"aliases":"","father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/327","allegiances":"House Lannister of Casterly Rock","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Feast for Crows"],"povBooks":"A Dance with Dragons","tvSeries":["Season 1","Season 2","Season 5","Season 6"],"playedBy":"Ian Gelder"},{"url":"https://www.anapioficeandfire.com/api/characters/743","id":743,"name":"Melisandre","gender":"Female","culture":"Asshai","born":"At Unknown","died":"","alive":true,"titles":"","aliases":["The Red Priestess","The Red Woman","The King's Red Shadow","Lady Red","Lot Seven"],"father":"","mother":"","spouse":"","allegiances":[],"books":["A Clash of Kings","A Storm of Swords","A Feast for Crows"],"povBooks":"A Dance with Dragons","tvSeries":["Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Carice van Houten"},{"url":"https://www.anapioficeandfire.com/api/characters/751","id":751,"name":"Merrett Frey","gender":"Male","culture":"Rivermen","born":"In 262 AC","died":"In 300 AC, at Near Oldstones","alive":false,"titles":"","aliases":"Merrett Muttonhead","father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/712","allegiances":"House Frey of the Crossing","books":["A Game of Thrones","A Clash of Kings","A Feast for Crows","A Dance with Dragons"],"povBooks":"A Storm of Swords","tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/844","id":844,"name":"Quentyn Martell","gender":"Male","culture":"Dornish","born":"In 281 AC, at Sunspear, Dorne","died":"In 300 AC, at Meereen","alive":false,"titles":"Prince","aliases":["Frog","Prince Frog","The prince who came too late","The Dragonrider"],"father":"","mother":"","spouse":"","allegiances":"House Nymeros Martell of Sunspear","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Feast for Crows"],"povBooks":"A Dance with Dragons","tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/954","id":954,"name":"Samwell Tarly","gender":"Male","culture":"Andal","born":"In 283 AC, at Horn Hill","died":"","alive":true,"titles":"","aliases":["Sam","Ser Piggy","Prince Pork-chop","Lady Piggy","Sam the Slayer","Black Sam","Lord of Ham"],"father":"","mother":"","spouse":"","allegiances":"House Tarly of Horn Hill","books":["A Game of Thrones","A Clash of Kings","A Dance with Dragons"],"povBooks":["A Storm of Swords","A Feast for Crows"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"John Bradley-West"},{"url":"https://www.anapioficeandfire.com/api/characters/957","id":957,"name":"Sansa Stark","gender":"Female","culture":"Northmen","born":"In 286 AC, at Winterfell","died":"","alive":true,"titles":"Princess","aliases":["Little bird","Alayne Stone","Jonquil"],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/1052","allegiances":["House Baelish of Harrenhal","House Stark of Winterfell"],"books":"A Dance with Dragons","povBooks":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Feast for Crows"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Sophie Turner"}],"options":{"mode":"view","modes":["code","form","text","tree","view"]}},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

3.  Don’t be afraid to check out a subset\! `names()` comes in handy,
    too.

<!-- end list -->

``` r
str(got_chars[[1]])
```

    ## List of 18
    ##  $ url        : chr "https://www.anapioficeandfire.com/api/characters/1022"
    ##  $ id         : int 1022
    ##  $ name       : chr "Theon Greyjoy"
    ##  $ gender     : chr "Male"
    ##  $ culture    : chr "Ironborn"
    ##  $ born       : chr "In 278 AC or 279 AC, at Pyke"
    ##  $ died       : chr ""
    ##  $ alive      : logi TRUE
    ##  $ titles     : chr [1:3] "Prince of Winterfell" "Captain of Sea Bitch" "Lord of the Iron Islands (by law of the green lands)"
    ##  $ aliases    : chr [1:4] "Prince of Fools" "Theon Turncloak" "Reek" "Theon Kinslayer"
    ##  $ father     : chr ""
    ##  $ mother     : chr ""
    ##  $ spouse     : chr ""
    ##  $ allegiances: chr "House Greyjoy of Pyke"
    ##  $ books      : chr [1:3] "A Game of Thrones" "A Storm of Swords" "A Feast for Crows"
    ##  $ povBooks   : chr [1:2] "A Clash of Kings" "A Dance with Dragons"
    ##  $ tvSeries   : chr [1:6] "Season 1" "Season 2" "Season 3" "Season 4" ...
    ##  $ playedBy   : chr "Alfie Allen"

``` r
names(got_chars[[1]])
```

    ##  [1] "url"         "id"          "name"        "gender"      "culture"    
    ##  [6] "born"        "died"        "alive"       "titles"      "aliases"    
    ## [11] "father"      "mother"      "spouse"      "allegiances" "books"      
    ## [16] "povBooks"    "tvSeries"    "playedBy"

## Exploring `purrr` fundamentals

Apply a function to each element in a list/vector with `map`.

General usage: `purrr::map(VECTOR_OR_LIST, YOUR_FUNCTION)`

Note:

  - `map` always returns a list.
  - `YOUR_FUNCTION` can return anything\!

Toy example 1: without using vectorization, take the square root of the
following vector:

``` r
x <- 1:10
map(x, sqrt)
```

    ## [[1]]
    ## [1] 1
    ## 
    ## [[2]]
    ## [1] 1.414214
    ## 
    ## [[3]]
    ## [1] 1.732051
    ## 
    ## [[4]]
    ## [1] 2
    ## 
    ## [[5]]
    ## [1] 2.236068
    ## 
    ## [[6]]
    ## [1] 2.44949
    ## 
    ## [[7]]
    ## [1] 2.645751
    ## 
    ## [[8]]
    ## [1] 2.828427
    ## 
    ## [[9]]
    ## [1] 3
    ## 
    ## [[10]]
    ## [1] 3.162278

Toy example 2 (functions on-the-fly): without using vectorization,
square each component of `x`:

``` r
map(x, function(w) w^2)
```

    ## [[1]]
    ## [1] 1
    ## 
    ## [[2]]
    ## [1] 4
    ## 
    ## [[3]]
    ## [1] 9
    ## 
    ## [[4]]
    ## [1] 16
    ## 
    ## [[5]]
    ## [1] 25
    ## 
    ## [[6]]
    ## [1] 36
    ## 
    ## [[7]]
    ## [1] 49
    ## 
    ## [[8]]
    ## [1] 64
    ## 
    ## [[9]]
    ## [1] 81
    ## 
    ## [[10]]
    ## [1] 100

NOTE: use `map_*` for different vector outputs:

  - dbl = decimal
  - chr = character
  - lgl =

Want a vector to be returned? Must specify the `typeof()` of the vector.
Use `map_dbl()` to specify an output vector of type “double” for the
above (check out the documentation `?map` for the acceptable vector
types):

``` r
map_dbl(x, sqrt)
```

    ##  [1] 1.000000 1.414214 1.732051 2.000000 2.236068 2.449490 2.645751
    ##  [8] 2.828427 3.000000 3.162278

Does your function have other arguments? You can specify them afterwards
in the ellipses
    (`...`).

``` r
map_chr(x, str_c, "potato.", sep="-")
```

    ##  [1] "1-potato."  "2-potato."  "3-potato."  "4-potato."  "5-potato." 
    ##  [6] "6-potato."  "7-potato."  "8-potato."  "9-potato."  "10-potato."

## Your Turn: `purrr` fundamentals

1.  Let’s retry the `wesanderson` example: use `purrr` to write code
    that extracts a vector of the first elements of each vector
    contained in `wesanderson`. Play around with the following, too:
      - Use `head` instead of writing your own function.
      - Try different `map` functions, even the “wrong” types.
      - Use the ` ``[`` ` function if you’re feeling daring.

<!-- end list -->

``` r
# Method 1
vec1 <- function(x) x[1]
map_chr(wesanderson, vec1)
```

    ##  GrandBudapest      Moonrise1         Royal1      Moonrise2     Cavalcanti 
    ##      "#F1BB7B"      "#F3DF6C"      "#899DA4"      "#798E87"      "#D8B70A" 
    ##         Royal2 GrandBudapest2      Moonrise3      Chevalier         Zissou 
    ##      "#9A8822"      "#E6A0C4"      "#85D4E3"      "#446455"      "#3B9AB2" 
    ##   FantasticFox     Darjeeling       Rushmore   BottleRocket    Darjeeling2 
    ##      "#DD8D29"      "#FF0000"      "#E1BD6D"      "#A42820"      "#ECCBAE"

``` r
# Method 2: head
map_chr(wesanderson, head, n=1)
```

    ##  GrandBudapest      Moonrise1         Royal1      Moonrise2     Cavalcanti 
    ##      "#F1BB7B"      "#F3DF6C"      "#899DA4"      "#798E87"      "#D8B70A" 
    ##         Royal2 GrandBudapest2      Moonrise3      Chevalier         Zissou 
    ##      "#9A8822"      "#E6A0C4"      "#85D4E3"      "#446455"      "#3B9AB2" 
    ##   FantasticFox     Darjeeling       Rushmore   BottleRocket    Darjeeling2 
    ##      "#DD8D29"      "#FF0000"      "#E1BD6D"      "#A42820"      "#ECCBAE"

``` r
# Method 3:
map_chr(wesanderson, `[`, 1)
```

    ##  GrandBudapest      Moonrise1         Royal1      Moonrise2     Cavalcanti 
    ##      "#F1BB7B"      "#F3DF6C"      "#899DA4"      "#798E87"      "#D8B70A" 
    ##         Royal2 GrandBudapest2      Moonrise3      Chevalier         Zissou 
    ##      "#9A8822"      "#E6A0C4"      "#85D4E3"      "#446455"      "#3B9AB2" 
    ##   FantasticFox     Darjeeling       Rushmore   BottleRocket    Darjeeling2 
    ##      "#DD8D29"      "#FF0000"      "#E1BD6D"      "#A42820"      "#ECCBAE"

``` r
# map_dbl is not working
```

2.  Check that each character’s list entry in `got_chars` has the same
    names as everyone else (that is, list component names, not character
    names). Here’s one way to do it:
    1.  Use the `names` function.
    2.  Then, bind the names together in a single character.
    3.  Then, apply the `table()` function.

<!-- end list -->

``` r
# YOUR_CODE_HERE
```

## Shortcut functions

We can do the subsetting much easier with these shortcuts: just replace
function with either:

  - index you’d like to subset by, or
  - name you’d like to subset
    by.

<!-- end list -->

``` r
map_chr(wesanderson, 1) %>% unname() # no vector names
```

    ##  [1] "#F1BB7B" "#F3DF6C" "#899DA4" "#798E87" "#D8B70A" "#9A8822" "#E6A0C4"
    ##  [8] "#85D4E3" "#446455" "#3B9AB2" "#DD8D29" "#FF0000" "#E1BD6D" "#A42820"
    ## [15] "#ECCBAE"

## Your turn: shortcut functions

1.  For the `got_chars` data:

<!-- end list -->

  - What are the titles of each character?
  - Is a vector output appropriate here?
  - Use a pipe.

Note: each character’s list entry has a component named `titles` as the
9th entry.

``` r
got_chars %>%
  map("titles")
```

    ## [[1]]
    ## [1] "Prince of Winterfell"                                
    ## [2] "Captain of Sea Bitch"                                
    ## [3] "Lord of the Iron Islands (by law of the green lands)"
    ## 
    ## [[2]]
    ## [1] "Acting Hand of the King (former)" "Master of Coin (former)"         
    ## 
    ## [[3]]
    ## [1] "Lord Captain of the Iron Fleet" "Master of the Iron Victory"    
    ## 
    ## [[4]]
    ## [1] ""
    ## 
    ## [[5]]
    ## [1] "Captain of the Guard at Sunspear"
    ## 
    ## [[6]]
    ## [1] ""
    ## 
    ## [[7]]
    ## [1] "Maester"
    ## 
    ## [[8]]
    ## [1] "Princess of Dorne"
    ## 
    ## [[9]]
    ## [1] "Queen of the Andals and the Rhoynar and the First Men, Lord of the Seven Kingdoms"
    ## [2] "Khaleesi of the Great Grass Sea"                                                  
    ## [3] "Breaker of Shackles/Chains"                                                       
    ## [4] "Queen of Meereen"                                                                 
    ## [5] "Princess of Dragonstone"                                                          
    ## 
    ## [[10]]
    ## [1] "Ser"                       "Lord of the Rainwood"     
    ## [3] "Admiral of the Narrow Sea" "Hand of the King"         
    ## 
    ## [[11]]
    ## [1] "Princess"
    ## 
    ## [[12]]
    ## [1] "Ser"
    ## 
    ## [[13]]
    ## [1] "Princess"                    "Captain of the Black Wind"  
    ## [3] "Conqueror of Deepwood Motte"
    ## 
    ## [[14]]
    ## [1] "Ser"               "Hand of the Queen"
    ## 
    ## [[15]]
    ## [1] ""
    ## 
    ## [[16]]
    ## [1] "Prince of Winterfell"
    ## 
    ## [[17]]
    ## [1] ""
    ## 
    ## [[18]]
    ## [1] "Lady of Winterfell"
    ## 
    ## [[19]]
    ## [1] "Light of the West"      "Queen Dowager"         
    ## [3] "Protector of the Realm" "Lady of Casterly Rock" 
    ## [5] "Queen Regent"          
    ## 
    ## [[20]]
    ## [1] "Lord of Winterfell"     "Warden of the North"   
    ## [3] "Hand of the King"       "Protector of the Realm"
    ## [5] "Regent"                
    ## 
    ## [[21]]
    ## [1] "Ser"                              "Lord Commander of the Kingsguard"
    ## [3] "Warden of the East (formerly)"   
    ## 
    ## [[22]]
    ## [1] "Lord of Griffin's Roost" "Hand of the King"       
    ## [3] "Hand of the True King"  
    ## 
    ## [[23]]
    ## [1] "Lord Commander of the Night's Watch"
    ## 
    ## [[24]]
    ## [1] "Priest of the Drowned God"             
    ## [2] "Captain of the Golden Storm (formerly)"
    ## 
    ## [[25]]
    ## [1] "Ser"                    "Master of laws"        
    ## [3] "Lord Regent"            "Protector of the Realm"
    ## 
    ## [[26]]
    ## [1] ""
    ## 
    ## [[27]]
    ## [1] ""
    ## 
    ## [[28]]
    ## [1] "Prince"
    ## 
    ## [[29]]
    ## [1] ""
    ## 
    ## [[30]]
    ## [1] "Princess"

2.  For the `got_chars` data:

<!-- end list -->

  - Extract a list of the “name” and “born” data for each person.
      - Use the function ` ``[`` ` or `extract()` (from the `magrittr`
        package, does the same thing) function to do the subsetting
  - What happens when we switch to `map_dfr` instead of `map`? How about
    `map_dfc`?

<!-- end list -->

``` r
desired_info <- c("name", "born")
map(got_chars, `[`, desired_info) %>% head()
```

    ## [[1]]
    ## [[1]]$name
    ## [1] "Theon Greyjoy"
    ## 
    ## [[1]]$born
    ## [1] "In 278 AC or 279 AC, at Pyke"
    ## 
    ## 
    ## [[2]]
    ## [[2]]$name
    ## [1] "Tyrion Lannister"
    ## 
    ## [[2]]$born
    ## [1] "In 273 AC, at Casterly Rock"
    ## 
    ## 
    ## [[3]]
    ## [[3]]$name
    ## [1] "Victarion Greyjoy"
    ## 
    ## [[3]]$born
    ## [1] "In 268 AC or before, at Pyke"
    ## 
    ## 
    ## [[4]]
    ## [[4]]$name
    ## [1] "Will"
    ## 
    ## [[4]]$born
    ## [1] ""
    ## 
    ## 
    ## [[5]]
    ## [[5]]$name
    ## [1] "Areo Hotah"
    ## 
    ## [[5]]$born
    ## [1] "In 257 AC or before, at Norvos"
    ## 
    ## 
    ## [[6]]
    ## [[6]]$name
    ## [1] "Chett"
    ## 
    ## [[6]]$born
    ## [1] "At Hag's Mire"

``` r
map_dfr(got_chars, `[`, desired_info)
```

    ## # A tibble: 30 x 2
    ##    name               born                                  
    ##    <chr>              <chr>                                 
    ##  1 Theon Greyjoy      In 278 AC or 279 AC, at Pyke          
    ##  2 Tyrion Lannister   In 273 AC, at Casterly Rock           
    ##  3 Victarion Greyjoy  In 268 AC or before, at Pyke          
    ##  4 Will               ""                                    
    ##  5 Areo Hotah         In 257 AC or before, at Norvos        
    ##  6 Chett              At Hag's Mire                         
    ##  7 Cressen            In 219 AC or 220 AC                   
    ##  8 Arianne Martell    In 276 AC, at Sunspear                
    ##  9 Daenerys Targaryen In 284 AC, at Dragonstone             
    ## 10 Davos Seaworth     In 260 AC or before, at King's Landing
    ## # ... with 20 more rows

Note: as Jenny says, it’s always safer (from a programming perspective)
to work with output that’s more predictable. The following would be
safer, and is still readable:

``` r
got_chars %>% {
    tibble(
        name = map_chr(., "name"),
        born = map_chr(., "born")
    )
}
```

    ## # A tibble: 30 x 2
    ##    name               born                                  
    ##    <chr>              <chr>                                 
    ##  1 Theon Greyjoy      In 278 AC or 279 AC, at Pyke          
    ##  2 Tyrion Lannister   In 273 AC, at Casterly Rock           
    ##  3 Victarion Greyjoy  In 268 AC or before, at Pyke          
    ##  4 Will               ""                                    
    ##  5 Areo Hotah         In 257 AC or before, at Norvos        
    ##  6 Chett              At Hag's Mire                         
    ##  7 Cressen            In 219 AC or 220 AC                   
    ##  8 Arianne Martell    In 276 AC, at Sunspear                
    ##  9 Daenerys Targaryen In 284 AC, at Dragonstone             
    ## 10 Davos Seaworth     In 260 AC or before, at King's Landing
    ## # ... with 20 more rows

Note the curly braces “tricks” the object prior to the pipe from
entering as the first argument to `tibble`, because ` ``{`` ` only
returns the last line evaluated. In this case there are two: the above
code is equivalent to

``` r
got_chars %>% {
    .
    tibble(
        name = map_chr(., "name"),
        born = map_chr(., "born")
    )
}
```

    ## # A tibble: 30 x 2
    ##    name               born                                  
    ##    <chr>              <chr>                                 
    ##  1 Theon Greyjoy      In 278 AC or 279 AC, at Pyke          
    ##  2 Tyrion Lannister   In 273 AC, at Casterly Rock           
    ##  3 Victarion Greyjoy  In 268 AC or before, at Pyke          
    ##  4 Will               ""                                    
    ##  5 Areo Hotah         In 257 AC or before, at Norvos        
    ##  6 Chett              At Hag's Mire                         
    ##  7 Cressen            In 219 AC or 220 AC                   
    ##  8 Arianne Martell    In 276 AC, at Sunspear                
    ##  9 Daenerys Targaryen In 284 AC, at Dragonstone             
    ## 10 Davos Seaworth     In 260 AC or before, at King's Landing
    ## # ... with 20 more rows
