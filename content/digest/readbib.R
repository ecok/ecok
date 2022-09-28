if (require("RefManageR")) {
  BibOptions(check.entries = FALSE, style = "markdown", 
             bib.style = "authoryear",
             no.print.fields = c("urldate"))
}
if (requireNamespace("bibtex")) {
  bib <- ReadBib("../../../static/bib/scholar.bib", check = F)
}
