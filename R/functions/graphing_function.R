align_plots_modified <- function (..., plotlist = NULL, align = c("none", "h", "v", "hv"),
                                  axis = c("none", "l", "r", "t", "b", "lr", "tb", "tblr"), 
                                  greedy = TRUE) {
  plots <- c(list(...), plotlist)
  num_plots <- length(plots)
  grobs <- lapply(plots, function(x) {
    if (!is.null(x)) as_gtable(x)
    else NULL
  })
  halign <- switch(align[1], h = TRUE, vh = TRUE, hv = TRUE, FALSE)
  valign <- switch(align[1], v = TRUE, vh = TRUE, hv = TRUE, FALSE)
  vcomplex_align <- hcomplex_align <- FALSE
  if (valign) {
    
    # modification: get x-axis value range associated with each plot, create union of
    # value ranges across all plots, & calculate the proportional width of each plot
    # (with white space on either side) required in order for the plots to align
    plot.x.range <- lapply(plots, function(x) ggplot_build(x)$layout$panel_params[[1]]$x.range)
    full.range <- range(plot.x.range)
    plot.x.range <- lapply(plot.x.range,
                           function(x) c(diff(c(full.range[1], x[1]))/ diff(full.range),
                                         diff(x)/ diff(full.range),
                                         diff(c(x[2], full.range[2]))/ diff(full.range)))
    
    num_widths <- unique(lapply(grobs, function(x) {
      length(x$widths)
    }))
    num_widths[num_widths == 0] <- NULL
    if (length(num_widths) > 1 || length(grep("l|r", axis[1])) > 0) {
      vcomplex_align = TRUE
      warning("Method not implemented for faceted plots. Placing unaligned.")
      valign <- FALSE
    }
    else {
      max_widths <- list(do.call(grid::unit.pmax, 
                                 lapply(grobs, function(x) {x$widths})))
    }
  }
  if (halign) {
    
    # modification: get y-axis value range associated with each plot, create union of
    # value ranges across all plots, & calculate the proportional width of each plot
    # (with white space on either side) required in order for the plots to align
    plot.y.range <- lapply(plots, function(x) ggplot_build(x)$layout$panel_params[[1]]$y.range)
    full.range <- range(plot.y.range)
    plot.y.range <- lapply(plot.y.range,
                           function(x) c(diff(c(full.range[1], x[1]))/ diff(full.range),
                                         diff(x)/ diff(full.range),
                                         diff(c(x[2], full.range[2]))/ diff(full.range)))
    
    num_heights <- unique(lapply(grobs, function(x) {
      length(x$heights)
    }))
    num_heights[num_heights == 0] <- NULL
    if (length(num_heights) > 1 || length(grep("t|b", axis[1])) > 0) {
      hcomplex_align = TRUE
      warning("Method not implemented for faceted plots. Placing unaligned.")
      halign <- FALSE
    }
    else {
      max_heights <- list(do.call(grid::unit.pmax, 
                                  lapply(grobs, function(x) {x$heights})))
    }
  }
  for (i in 1:num_plots) {
    if (!is.null(grobs[[i]])) {
      if (valign) {
        grobs[[i]]$widths <- max_widths[[1]]
        
        # modification: change panel cell's width to a proportion of unit(1, "null"),
        # then add whitespace to the left / right of the plot's existing gtable
        grobs[[i]]$widths[[5]] <- unit(plot.x.range[[i]][2], "null")
        grobs[[i]] <- gtable::gtable_add_cols(grobs[[i]], 
                                              widths = unit(plot.x.range[[i]][1], "null"), 
                                              pos = 0)
        grobs[[i]] <- gtable::gtable_add_cols(grobs[[i]], 
                                              widths = unit(plot.x.range[[i]][3], "null"), 
                                              pos = -1)
      }
      if (halign) {
        grobs[[i]]$heights <- max_heights[[1]]
        
        # modification: change panel cell's height to a proportion of unit(1, "null"),
        # then add whitespace to the bottom / top of the plot's existing gtable
        grobs[[i]]$heights[[7]] <- unit(plot.y.range[[i]][2], "null")
        grobs[[i]] <- gtable::gtable_add_rows(grobs[[i]], 
                                              heights = unit(plot.y.range[[i]][1], "null"), 
                                              pos = -1)
        grobs[[i]] <- gtable::gtable_add_rows(grobs[[i]], 
                                              heights = unit(plot.y.range[[i]][3], "null"), 
                                              pos = 0)
      }
    }
  }
  grobs
}


# To start using (in current R session only; effect will not carry over to subsequent session)
trace(cowplot::plot_grid, edit = TRUE)
# In the pop-up window, change `grobs <- align_plots(...)` (at around line 27) to
# `grobs <- align_plots_modified(...)`

# To stop using
untrace(cowplot::plot_grid)