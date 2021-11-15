#' Read file
#'
#' Check if file exists and read it. If file doesn't exist it throw an error.
#'
#' @param filename Path to file
#'
#' @return A tibble data frame
#'
#' @examples
#'
#' df <- fars_read("accident_2015.csv.bz2")
#' head(df)
fars_read <- function(filename) {
        if(!file.exists(filename))
                stop("file '", filename, "' does not exist")
        data <- suppressMessages({
                readr::read_csv(filename, progress = FALSE)
        })
        dplyr::tbl_df(data)
}

#' Make filename path
#'
#' Make a filename path to FARS csv data for a given year.
#'
#' @param year Year (in numbers)
#'
#' @return String
#'
#' @examples
#'
#' make_filename(2013)
make_filename <- function(year) {
        year <- as.integer(year)
        system.file('extdata', sprintf("accident_%d.csv.bz2", year), package='fars')
}

#' Read files for indicated years
#'
#' Read files for years passed as arguments. If some year doesn't exists,
#' it throw an error.
#'
#' @param years List or vector of years
#'
#' @return List of tibble data frames
#'
#' @examples
#'
#' fars_read_years(list(2013, 2015))
#'
#' @importFrom magrittr %>%
fars_read_years <- function(years) {
        lapply(years, function(year) {
                print(year)
                file <- make_filename(year)
                print(file)
                tryCatch({
                        dat <- fars_read(file)
                        dplyr::mutate(dat, year = year) %>%
                                dplyr::select(MONTH, year)
                }, error = function(e) {
                        warning("invalid year: ", year)
                        return(NULL)
                })
        })
}

#' N for year and month
#'
#' Frecuency table by months for years passed as arguments
#'
#' @inheritParams fars_read_years
#'
#' @return A summary tibble data frame.
#'
#' @examples
#'
#' fars_summarize_years(list(2013, 2015))
#'
#' @importFrom magrittr %>%
#' @import dplyr
#'
#' @export
fars_summarize_years <- function(years) {
        dat_list <- fars_read_years(years)
        dplyr::bind_rows(dat_list) %>%
                dplyr::group_by(year, MONTH) %>%
                dplyr::summarize(n = n()) %>%
                tidyr::spread(year, n)
}

#' Plot the location of the accident
#'
#' Plot the location of the accident for the specified state number and year.
#'
#' @param state.num State number
#' @param year Year (in numbers)
#'
#' @return Returns "NULL". The function plot the accidents.
#'
#' @examples
#'
#' fars_map_state(21, 2013)
#'
#' @export
fars_map_state <- function(state.num, year) {
        filename <- make_filename(year)
        data <- fars_read(filename)
        state.num <- as.integer(state.num)

        if(!(state.num %in% unique(data$STATE)))
                stop("invalid STATE number: ", state.num)
        data.sub <- dplyr::filter(data, STATE == state.num)
        if(nrow(data.sub) == 0L) {
                message("no accidents to plot")
                return(invisible(NULL))
        }
        is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
        is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
        with(data.sub, {
                maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
                          xlim = range(LONGITUD, na.rm = TRUE))
                graphics::points(LONGITUD, LATITUDE, pch = 46)
        })
}
