REPO = "https://cloud.r-project.org/"
install.packages(
 c('devtools','ggplot2','plyr','dplyr','tidyr','sqldf',
   'quantmod','leaflet','DT','forecast','tseries',
   'iterators','bit','plogr','DBI','blob','doMC','rio',
   'bit64','proto','mvtnorm','expm','numDeriv','MBESS',
   'pbivnorm','mnormt','lavaan','jpeg','checkmate',
   'RcppEigen','statmod','nloptr','minqa','htmlTable',
   'data.table','latticeExtra','Formula','Hmisc','coda',
   'abind','lme4','arm','mi','matrixcalc','ez','coin',
   'RcppParallel','rpf','StanHeaders','sandwich','TH.data',
   'mitools','rematch','progress','cellranger','openxlsx',
   'readxl','matrixStats','conquer','MatrixModels','SparseM',
   'maptools','quantreg','pbkrtest','carData','combinat',
   'broom','Deriv','foreach','chron','RSQLite','lmerTest',
   'gsubfn','polycor','msm','semTools','sem','car','lsr',
   'OpenMx','gsl','multcomp','modeltools','libcoin','ltm',
   'insight','estimability','survey','doBy','DTK','effects'
),
 repos=REPO
)
update.packages(
 ask=FALSE,
 repos=REPO
)
