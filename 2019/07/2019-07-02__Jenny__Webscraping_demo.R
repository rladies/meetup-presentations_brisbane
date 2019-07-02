
library (rvest)

CODE <- '0260'

  URL <- paste0('https://training.gov.au/Organisation/Details/', CODE, 
                '?tabIndex=3&ScopeQualification-page=', 1, 
                '&pageSizeKey=Organisation_Details_ScopeQualification&pageSize=100&setFocus=ScopeQualification')
  print(URL)

  LINK_2 <- read_html(URL)
    
  TEST <- html_table(LINK_2)[[2]] %>% mutate (rto_code = CODE)
  
  TEST <- TEST[!grepl('Refresh information', TEST$Extent),] %>%
      setNames( c('course_code',
                  'course_name',
                  'extent',
                  'nsw', 'vic', 'qld', 'sa', 'wa', 'tas', 'nt','act','int',
                  'rto_code'))

#----------------------------------

COURSE <- 'RII20715'

URL <- paste0("https://www.myskills.gov.au/RegisteredTrainers/Details?rtocode=", CODE, 
                  "&CourseCode=", COURSE)
print(URL)

try({
      LINK <- read_html(URL)
      
      # As myskills is not set out as an table, scraped as free text 
      FREE_TEXT <- LINK %>%
        html_nodes("#campuses") %>%
        html_text()
      
      PATTERN <- "[[:space:]]+[0-9]+[0-9]+[0-9]+[0-9]"
      
      POSTCODES <- str_extract_all (FREE_TEXT, PATTERN)
      
      TEMP <- do.call(cbind.data.frame, POSTCODES) %>%
        setNames(c("postcode")) %>%
        mutate(rto_code = CODE,
               postcode_type = "Campus",
               course_code = COURSE)
      TEMP[1, 3] = "Head office"
      
    })