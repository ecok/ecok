if (require("RefManageR")) {
  BibOptions(check.entries = FALSE, style = "markdown", bib.style = "authoryear")
}
if (requireNamespace("bibtex")) {
  bib <- ReadBib("../../../static/bib/scholar.bib", check = F)
}
