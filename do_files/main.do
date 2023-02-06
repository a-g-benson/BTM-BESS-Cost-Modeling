////Set your working directory

cd "C:\Users\agben\Desktop\BESS_Cost_Analysis_replication"

////De-comment the commands below to install packages
//ssc install ftools, replace
//ssc install reghdfe, replace
//ssc install ranktest, replace
//ssc install ivreg2, replace
//ssc install ivreghdfe, replace
//ssc install estout, replace
//ssc install crossfold, replace
//ssc install censusapi, replace
//ssc install freduse, replace
//ssc install coefplot, replace
//net install grc1leg,from(http://www.stata.com/users/vwiggins/) replace

////Import data from XLSX, CSV, and the net; save as .dta

do "do_files\CA_SGIP\data_prep\data_fetcher.do"

do "do_files\TTS\data_prep\tts_import.do"


////Clean, merge, and transform .dta files

do "do_files\TTS\data_prep\tts_clean.do"

do "do_files\CA_SGIP\data_prep\data_prep.do"

do "do_files\portable_batteries\portable_data_prep.do"



////Compute summary statistics

//Various Numbers mentioned in the text of Section 3.1
do "do_files\CA_SGIP\data_presentation\summary_stats.do"

//Table 4
do "do_files\portable_batteries\summary_stats.do"

//Various numbers mentioned in the text of Section 3.3
do "do_files\TTS\data_presentation\summary_stats.do"

////Create Graphs

//Figure 1
do "do_files\CA_SGIP\data_presentation\size_histograms.do"

//Figure 2 (some manual editing applied outside of Stata)
do "do_files\CA_SGIP\data_presentation\mfr_pie_chart.do"

//Figure 3
do "do_files\CA_SGIP\data_presentation\cost_trend_graphs.do"

//Figure 4
do "do_files\CA_SGIP\data_presentation\model_fit_graphs.do"

//Figures 5, 6, 7 & C.17
do "do_files\CA_SGIP\data_presentation\csci.do"

//Figures 8 & 9
do "do_files\CA_SGIP\data_presentation\MC_graphs.do"

//Figure 10 + Table 8
do "do_files\CA_SGIP\data_presentation\EOS_graphs.do"

//Figure B.13
do "do_files\CA_SGIP\data_presentation\cobb_douglas_vs_translog.do"

//Figures B.14, B.15, & B.16, plus AIC mentioned in text of Appendix B.5
do "do_files\CA_SGIP\data_presentation\linear_model_coefs.do"


////Create Tables & Other Stuff

//Table 7 & Table C.16, along with numbers mentioned in the text of Section 6.3 and Appendix C
do "do_files\CA_SGIP\analysis\prediction.do"

//Section 6.3: Prediction Intervals
do "do_files\CA_SGIP\analysis\prediction_intervals.do"

//Section 6.4 & Table 10: Forecast Validation
do "do_files\CA_SGIP\analysis\forecast_validation.do"

//Appendix A
do "do_files\TTS\data_presentation\appendix_A.do"

//Appendix B
do "do_files\CA_SGIP\analysis\model_selection_AIC.do"

//Table B.12
do "do_files\CA_SGIP\analysis\crossfold_validation.do"

//Table B.13
do "do_files\CA_SGIP\analysis\MC_estimates.do"

//Table B.14
do "do_files\TTS\analysis\model_selection_AIC.do"

//Appendix B.4 (Portable Batteries)
do "do_files\portable_batteries\portable_analysis.do"

//Table B.15
do "do_files\portable_batteries\model_selection_AIC.do"
