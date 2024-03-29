library(httr)
library(jsonlite)

get_api_data <- function() {
  headers <- c(
    'authority' = 'uwf.joinhandshake.com',
    'accept' = 'application/json, text/javascript, */*; q=0.01',
    'accept-language' = 'en-US,en;q=0.9',
    'cache-control' = 'no-cache',
    'cookie' = 'iterableEndUserId=dsd16%40students.uwf.edu; hss-global=eyJhbGciOiJkaXIiLCJjdHkiOiJKV1QiLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwidHlwIjoiSldUIn0..SmaAiRr-qzcSR7ThEE58IA.-letwLIyYNDXe10HFRLxePi_TGjfmXowALCQKYQSd_QwxvgvooVc6rm0xdG9pjAHjA6xGkIteSssYEAgw_4uA5TL2NCKhGn7SdnE_25lbgGmQ_bAlSHNIeyc7CruTaqmKgxXnrPuyY7DuwQvA4pdOLxuyHl93deCx_Iq-bKBr0jMmt6J5xeYGzGLt2jtSkDuYrZhovcuJbzAIJ-W7Tb24RcOxQZ4UXNIgHbkmbndOwnEobuKZ3DzaZ-7mj44bHRluiN1Dk9bazi5JfOA0cZN30Q4J-o-eEVvi0D5MPyxJzZkq7xFlR0f8ckZZC_r4Mg6u7NB8S4U08G6KmfP1-5AGo_ZqbmnYYDPfNCEX2HONH3_d-jHxkGLkuG99peWc7Cy.CwJSpb2s0XtA7605PL7wf4WTPUe9NSq66S5c0TPSz68;',
    'dnt' = '1',
    'pragma' = 'no-cache',
    'referer' = 'https://uwf.joinhandshake.com/stu/postings?page=1&per_page=25&sort_direction=desc&sort_column=created_at',
    'sec-ch-ua' = '"Not A(Brand";v="99", "Google Chrome";v="121", "Chromium";v="121"',
    'sec-ch-ua-mobile' = '?0',
    'sec-ch-ua-platform' = '"macOS"',
    'sec-fetch-dest' = 'empty',
    'sec-fetch-mode' = 'cors',
    'sec-fetch-site' = 'same-origin',
    'user-agent' = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',
    'x-requested-with' = 'XMLHttpRequest'
  )
  currentTimeStamp <- as.numeric(Sys.time()) * 1000
  url = paste0('https://uwf.joinhandshake.com/stu/postings?category=Posting&ajax=true&including_all_facets_in_searches=true&page=1&per_page=1000&sort_direction=desc&sort_column=created_at&_=',currentTimeStamp)
  response <- GET(url, add_headers(.headers=headers))
  cat("Response Status:", response$status_code, "\n")
  if (response$status_code == 200) {
    json_data <- content(response, as = "text") %>% fromJSON()
    return(json_data$results$job)
  } else {
    stop("Error: Failed to retrieve data from the API.")
  }
}
get_api_data()
