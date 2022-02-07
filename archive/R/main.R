
build_toc = function(toc) {
  # Set the TOC depth
  toc_depth = 0
  
  # Remove all 'li' elements
  toc <- stringr::str_replace_all(
    string = toc, 
    pattern = "<li>|</li>", 
    replacement = ""
  )
  
  # Loop over each element in the TOC vector and adjust the content if needed
  for (i in 1:length(toc)) {
    x = toc[i]
    
    if (stringr::str_detect(x, "<ul>")) {
      toc_depth = toc_depth + 1
      
      if (toc_depth == 1) {
        toc[i] <- stringr::str_replace(x, "<ul>", 
          '<div id="TOC" class="list-group list-group-flush">')
      } else {
        toc[i] <- stringr::str_replace(x, "<ul>", 
          '<div class="list-group list-group-flush list-subgroup">')
      }
    }
    
    if (stringr::str_detect(x, "</ul>")) {
      toc_depth = toc_depth - 1
      toc[i] <- stringr::str_replace(x, "</ul>", '</div>')
    }
    
    if (stringr::str_detect(x, "<a href=")) {
      id = stringr::str_extract(toc[i], '(?<=html#).+?(?=")')
      toc[i] <- stringr::str_replace(x, "<a href=", 
        paste0('<a id="item-', id, '" class="list-group-item list-group-item-light ps-3" href='))
    }
  } 
  
  return(toc)
}

build_nav = function() {
  paste(
    '<!-- Top navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
      <div class="container-fluid">
        <button class="btn btn-primary" id="sidebarToggle">Toggle Menu</button>
        <button 
          class="navbar-toggler" 
          type="button" 
          data-bs-toggle="collapse" 
          data-bs-target="#navbarSupportedContent" 
          aria-controls="navbarSupportedContent" 
          aria-expanded="false" 
          aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
            <li class="nav-item dropdown">
              <a 
                class="nav-link dropdown-toggle" 
                id="navbarDropdown" 
                href="#" 
                role="button" 
                data-bs-toggle="dropdown" 
                aria-haspopup="true" 
                aria-expanded="false">
                  Settings
              </a>
              <div 
                class="dropdown-menu dropdown-menu-end" 
                aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="#!">Toggle code</a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>'
  )
}

build_chapter = function(chapter) {
  in_div <- FALSE
  
  for (i in 1:length(chapter)) {
    x <- chapter[i]
    
    if (x == '<div class="foldable">') {
      in_div <- TRUE
      chapter[i] <- '<div class="foldable"><a>Show me more</a><div class="collapse">'
    }
    
    if (in_div) {
      if (x == "</div>") {
        in_div <- FALSE
        chapter[i] <- "</div></div>"
      }
    }
  }
  
  return(chapter)
}

build_page = function(
  head, toc, chapter, link_prev, link_next, rmd_cur, html_cur, foot
) {

  toc <- build_toc(toc)
  nav <- build_nav()
  chapter <- build_chapter(chapter)
  
  paste(c(
    head,
    toc,
   '<!-- Page content wrapper-->
    <div id="page-content-wrapper">',
    nav,
    '<!-- Page content-->
    <div id="main-container" class="container-fluid">',
    '<main class="mx-md-5">',
    chapter,
    '<p style="text-align: center;">',
    ifelse(
      length(link_prev) != 0, 
      sprintf(
        '<a href="%s"><button class="btn btn-secondary">%s</button></a>', 
        link_prev, 'Previous'
      ), 
      ""
    ),
    ifelse(
      length(link_next) != 0, 
      sprintf(
        '<a href="%s"><button class="btn btn-secondary">%s</button></a>', 
        link_next, 'Next'
      ), 
      ""
    ),
    '</p>',
    '</main>',
    '</div>',
    '</div>',
    foot
  ), collapse = '\n')
}

config <- bookdown::html_chapters(
  template = "assets/html/book.html",
  page_builder = build_page, 
  split_by = "chapter", 
  css = "assets/css/style.css", 
  highlight = "tango"
)

bookdown::render_book(output_format = config)
