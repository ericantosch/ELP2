(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("tocbibind" "nottoc" "numbib") ("babel" "ngerman") ("fncychap" "Glenn") ("geometry" "	includehead" "	headheight=17mm" "	footskip=\\dimexpr\\headsep+\\ht\\strutbox\\relax" "	tmargin=0mm" "	bmargin=\\dimexpr17mm+2\\ht\\strutbox\\relax" "")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "report"
    "rep10"
    "fontenc"
    "inputenc"
    "amsmath"
    "multirow"
    "enumerate"
    "trfsigns"
    "graphicx"
    "fancyhdr"
    "lettrine"
    "hyperref"
    "subcaption"
    "tikz"
    "cite"
    "listings"
    "tocbibind"
    "babel"
    "fncychap"
    "parskip"
    "microtype"
    "geometry"
    "anyfontsize"
    "float"
    "xcolor")
   (LaTeX-add-labels
    "eq:1"
    "tab:drehzahl_drehmoment"
    "fig:zahl_moment"
    "fig:zahl_leistung"
    "fig:aufbau_direkt"
    "tab:asm_direkt_ohneBlind_ruhig"
    "eq:3"
    "eq:2"
    "fig:oszi_direkt_spannung"
    "fig:oszi_direkt_spannung_mitKomp"
    "fig:oszi_direkt_dynamisch"
    "subsec:stat-voll"
    "fig:aufbau_umrichter"
    "fig:oszi_umrichter"
    "fig:oszi_umrichter_turbulent"
    "sec:windkr-mit-dopp"
    "fig:asm_aufbau_doppelt"
    "fig:oszi_dopp"
    "sec:auswertung"
    "fig:auswertung_pel"
    "fig:auswertung_eta"
    "fig:auswertung_leistung"
    "sec:fazit")
   (LaTeX-add-xcolor-definecolors
    "DarkGreenBlue"
    "LightGreenBlue"
    "LightOrange"
    "DarkOrange"
    "RedOrange"
    "BrightRed"
    "DeepBlue"
    "codegreen"
    "codegray"
    "codepurple"
    "backcolour")
   (LaTeX-add-listings-lstdefinestyles
    "code"))
 :latex)

