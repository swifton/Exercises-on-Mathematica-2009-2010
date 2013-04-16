(* ::Package:: *)

BeginPackage["Tensors`", {"Combinatorica`", "GraphUtilities`"}]; 
makeBasis::usage = "makeBasis[e_Symbol, n_Integer] \:0441\:043e\:0437\:0434\:0430\:0435\:0442 \:0431\:0430\:0437\:0438\:0441 \:0441 \:0438\:043c\:0435\:043d\:0435\:043c e_Symbol \:0432 \:043b\:0438\:043d\:0435\:0439\:043d\:043e\:043c \:043f\:0440\:043e\:0441\:0442\:0440\:0430\:043d\:0441\:0442\:0432\:0435 \:0440\:0430\:0437\:043c\:0435\:0440\:043d\:043e\:0441\:0442\:0438 n. \
\n\nmakeBasis[e_Symbol,n_Integer,num_Integer:-1,mat_List:{}] \:043c\:0430\:0442\:0440\:0438\:0446\:0430 \:043f\:0435\:0440\:0435\:0445\:043e\:0434\:0430 mat_List \:0437\:0430\:0434\:0430\:0435\:0442 \:0441\:0432\:044f\:0437\:044c \:0441 \:0431\:0430\:0437\:0438\:0441\:043e\:043c \:043d\:043e\:043c\:0435\:0440 num_Integer"\
; 
makeBasisDif::usage = "makeBasisDif[x_Symbol, n_] \:0441\:043e\:0437\:0434\:0430\:0435\:0442 \:043b\:043e\:043a\:0430\:043b\:044c\:043d\:044b\:0435 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442\:044b \:0441 \:0438\:043c\:0435\:043d\:0435\:043c x_Symbol \:043d\:0430 n-\:043c\:0435\:0440\:043d\:043e\:0439 \:043e\:0431\:043b\:0430\:0441\:0442\:0438 \:0438 \
\:0441\:043e\:043e\:0442\:0432\:0435\:0442\:0441\:0442\:0432\:0443\:044e\:0449\:0438\:0439 \:043a\:0430\:043d\:043e\:043d\:0438\:0447\:0435\:0441\:043a\:0438\:0439 \:0431\:0430\:0437\:0438\:0441. \n\nmakeBasisDif[x_Symbol, n_, num_Integer:-1, funs_List:{}, invfuns_List:{}] \n\:0444\:0443\:043d\:043a\:0446\:0438\:0438 \
funs_List \:0438 invfuns_List \:0437\:0430\:0434\:0430\:044e\:0442 \:0441\:0432\:044f\:0437\:044c \:0441 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442\:0430\:043c\:0438 num_Integer.\n\nmakeBasisDif[x_List] \:0441\:043e\:0437\:0434\:0430\:0435\:0442 \:043b\:043e\:043a\:0430\:043b\:044c\:043d\:044b\:0435 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442\:044b \:0441 \:0438\:043c\:0435\:043d\:0430\:043c\:0438 \
\:0438\:0437 \:0441\:043f\:0438\:0441\:043a\:0430 x_List \:043d\:0430 \:043e\:0431\:043b\:0430\:0441\:0442\:0438 \:0438 \:0441\:043e\:043e\:0442\:0432\:0435\:0442\:0441\:0442\:0432\:0443\:044e\:0449\:0438\:0439 \:043a\:0430\:043d\:043e\:043d\:0438\:0447\:0435\:0441\:043a\:0438\:0439 \:0431\:0430\:0437\:0438\:0441.\n\nmakeBasisDif[x_List, num_Integer:-1, funs_List:{}, \
invfuns_List:{}] \:0444\:0443\:043d\:043a\:0446\:0438\:0438 funs_List \:0438 invfuns_List \:0437\:0430\:0434\:0430\:044e\:0442 \:0441\:0432\:044f\:0437\:044c \:0441 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442\:0430\:043c\:0438 num_Integer."\
; 
makeTensor::usage = "makeTensor[T_, p_Integer, q_Integer] \:0441\:043e\:0437\:0434\:0430\:0435\:0442 \:0442\:0435\:043d\:0437\:043e\:0440 \:0442\:0438\:043f\:0430 (p,q) \:0441 \:0438\:043c\:0435\:043d\:0435\:043c T \:0432 \:043b\:0438\:043d\:0435\:0439\:043d\:043e\:043c \:043f\:0440\:043e\:0441\:0442\:0440\:0430\:043d\:0441\:0442\:0432\:0435 \:0441 \:0442\:0435\:043a\:0443\:0449\:0438\:043c \
\:0431\:0430\:0437\:0438\:0441\:043e\:043c"; 
makeSkew::usage = "makeSkew[T_, q_Integer] \:0441\:043e\:0437\:0434\:0430\:0435\:0442 \:043a\:043e\:0441\:043e\:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:044b\:0439 \:0442\:0435\:043d\:0437\:043e\:0440 \:0442\:0438\:043f\:0430 (0,q) \:0441 \:0438\:043c\:0435\:043d\:0435\:043c T \:0432 \:043b\:0438\:043d\:0435\:0439\:043d\:043e\:043c \:043f\:0440\:043e\:0441\:0442\:0440\:0430\:043d\:0441\:0442\:0432\:0435 \:0441 \:0442\:0435\:043a\:0443\:0449\:0438\:043c \
\:0431\:0430\:0437\:0438\:0441\:043e\:043c."; 
makeSymm::usage = "makeSymm[T_, q_Integer] \:0441\:043e\:0437\:0434\:0430\:0435\:0442 \:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:044b\:0439 \:0442\:0435\:043d\:0437\:043e\:0440 \:0442\:0438\:043f\:0430 (0,q) \:0441 \:0438\:043c\:0435\:043d\:0435\:043c T \:0432 \:043b\:0438\:043d\:0435\:0439\:043d\:043e\:043c \:043f\:0440\:043e\:0441\:0442\:0440\:0430\:043d\:0441\:0442\:0432\:0435 \:0441 \:0442\:0435\:043a\:0443\:0449\:0438\:043c \
\:0431\:0430\:0437\:0438\:0441\:043e\:043c."; 
makeTensorTab::usage = "makeTensorTab[T_, tab_, p_Integer, q_Integer] \:0441\:043e\:0437\:0434\:0430\:0435\:0442 \:0442\:0435\:043d\:0437\:043e\:0440 \:0442\:0438\:043f\:0430 (p,q) \:0441 \:0438\:043c\:0435\:043d\:0435\:043c T \:0432 \:043b\:0438\:043d\:0435\:0439\:043d\:043e\:043c \:043f\:0440\:043e\:0441\:0442\:0440\:0430\:043d\:0441\:0442\:0432\:0435 \:0441 \:0442\:0435\:043a\:0443\:0449\:0438\:043c \
\:0431\:0430\:0437\:0438\:0441\:043e\:043c, \:043f\:0440\:0438\:0447\:0435\:043c \:0437\:043d\:0430\:0447\:0435\:043d\:0438\:044f \:043a\:043e\:043c\:043f\:043e\:043d\:0435\:043d\:0442 \:0442\:0435\:043d\:0437\:043e\:0440\:0430 T \:0437\:0430\:0434\:0430\:044e\:0442\:0441\:044f \:0442\:0430\:0431\:043b\:0438\:0446\:0435\:0439 tab."; 
makeSkewTab::usage = "makeSkewTab[T_, tab_] \:0441\:043e\:0437\:0434\:0430\:0435\:0442 \:043a\:043e\:0441\:043e\:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:044b\:0439 \:0442\:0435\:043d\:0437\:043e\:0440 \:0442\:0438\:043f\:0430 (0,q) \:0441 \:0438\:043c\:0435\:043d\:0435\:043c T \:0432 \:043b\:0438\:043d\:0435\:0439\:043d\:043e\:043c \:043f\:0440\:043e\:0441\:0442\:0440\:0430\:043d\:0441\:0442\:0432\:0435 \:0441 \:0442\:0435\:043a\:0443\:0449\:0438\:043c \
\:0431\:0430\:0437\:0438\:0441\:043e\:043c, \:043f\:0440\:0438\:0447\:0435\:043c \:0437\:043d\:0430\:0447\:0435\:043d\:0438\:044f \:043a\:043e\:043c\:043f\:043e\:043d\:0435\:043d\:0442 \:0442\:0435\:043d\:0437\:043e\:0440\:0430 T \:0437\:0430\:0434\:0430\:044e\:0442\:0441\:044f \:0442\:0430\:0431\:043b\:0438\:0446\:0435\:0439 tab."; 
makeSymmTab::usage = "makeSymmTab[T_, tab_] \:0441\:043e\:0437\:0434\:0430\:0435\:0442 \:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:044b\:0439 \:0442\:0435\:043d\:0437\:043e\:0440 \:0442\:0438\:043f\:0430 (0,q) \:0441 \:0438\:043c\:0435\:043d\:0435\:043c T \:0432 \:043b\:0438\:043d\:0435\:0439\:043d\:043e\:043c \:043f\:0440\:043e\:0441\:0442\:0440\:0430\:043d\:0441\:0442\:0432\:0435 \:0441 \:0442\:0435\:043a\:0443\:0449\:0438\:043c \
\:0431\:0430\:0437\:0438\:0441\:043e\:043c, \:043f\:0440\:0438\:0447\:0435\:043c \:0437\:043d\:0430\:0447\:0435\:043d\:0438\:044f \:043a\:043e\:043c\:043f\:043e\:043d\:0435\:043d\:0442 \:0442\:0435\:043d\:0437\:043e\:0440\:0430 T \:0437\:0430\:0434\:0430\:044e\:0442\:0441\:044f \:0442\:0430\:0431\:043b\:0438\:0446\:0435\:0439 tab."; 
toBasis::usage = "toBasis[T_] \:0437\:0430\:043f\:0438\:0441\:044b\:0432\:0430\:0435\:0442 \:0442\:0435\:043d\:0437\:043e\:0440 T \:0432 \:0432\:0438\:0434\:0435 \:043b\:0438\:043d\:0435\:0439\:043d\:043e\:0439 \:043a\:043e\:043c\:0431\:0438\:043d\:0430\:0446\:0438\:0438 \:0431\:0430\:0437\:0438\:0441\:043d\:044b\:0445 \:0442\:0435\:043d\:0437\:043e\:0440\:043e\:0432."; 
toList::usage = "toList[T_] \:043f\:043e \:0440\:0430\:0437\:043b\:043e\:0436\:0435\:043d\:0438\:044e T \:0442\:0435\:043d\:0437\:043e\:0440\:0430 \:043f\:043e \:0431\:0430\:0437\:0438\:0441\:043d\:044b\:043c \:0442\:0435\:043d\:0437\:043e\:0440\:0430\:043c \:0432\:044b\:0447\:0438\:0441\:043b\:044f\:0435\:0442\:0441\:044f \:0442\:0430\:0431\:043b\:0438\:0446\:0430 \:0437\:043d\:0430\:0447\:0435\:043d\:0438\:0439 \:043a\:043e\:043c\:043f\:043e\:043d\:0435\:043d\:0442."; 
toBasisSkew::usage = "toBasisSkew[T_] \:0437\:0430\:043f\:0438\:0441\:044b\:0432\:0430\:0435\:0442 \:043a\:043e\:0441\:043e\:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:044b\:0439 \:0442\:0435\:043d\:0437\:043e\:0440 T \:0432 \:0432\:0438\:0434\:0435 \:043b\:0438\:043d\:0435\:0439\:043d\:043e\:0439 \:043a\:043e\:043c\:0431\:0438\:043d\:0430\:0446\:0438\:0438 \:0431\:0430\:0437\:0438\:0441\:043d\:044b\:0445 \:043a\:043e\:0441\:043e\:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:044b\:0445 \:0442\:0435\:043d\:0437\:043e\:0440\:043e\:0432."; 
toListSkew::usage = "toListSkew[T_] \:043f\:043e \:0440\:0430\:0437\:043b\:043e\:0436\:0435\:043d\:0438\:044e T \:043a\:043e\:0441\:043e\:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:043e\:0433\:043e \:0442\:0435\:043d\:0437\:043e\:0440\:0430 \:043f\:043e \:0431\:0430\:0437\:0438\:0441\:043d\:044b\:043c \:043a\:043e\:0441\:043e\:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:044b\:043c \:0442\:0435\:043d\:0437\:043e\:0440\:0430\:043c \:0432\:044b\:0447\:0438\:0441\:043b\:044f\:0435\:0442\:0441\:044f \:0442\:0430\:0431\:043b\:0438\:0446\:0430 \:0437\:043d\:0430\:0447\:0435\:043d\:0438\:0439 \:043a\:043e\:043c\:043f\:043e\:043d\:0435\:043d\:0442."; 
toBasisSymm::usage = "toBasisSymm[T_] \:0437\:0430\:043f\:0438\:0441\:044b\:0432\:0430\:0435\:0442 \:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:044b\:0439 \:0442\:0435\:043d\:0437\:043e\:0440 T \:0432 \:0432\:0438\:0434\:0435 \:043b\:0438\:043d\:0435\:0439\:043d\:043e\:0439 \:043a\:043e\:043c\:0431\:0438\:043d\:0430\:0446\:0438\:0438 \:0431\:0430\:0437\:0438\:0441\:043d\:044b\:0445 \:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:044b\:0445 \:0442\:0435\:043d\:0437\:043e\:0440\:043e\:0432."; 
toListSymm::usage = "toListSymm[T_] \:043f\:043e \:0440\:0430\:0437\:043b\:043e\:0436\:0435\:043d\:0438\:044e T \:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:043e\:0433\:043e \:0442\:0435\:043d\:0437\:043e\:0440\:0430 \:043f\:043e \:0431\:0430\:0437\:0438\:0441\:043d\:044b\:043c \:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:044b\:043c \:0442\:0435\:043d\:0437\:043e\:0440\:0430\:043c \:0432\:044b\:0447\:0438\:0441\:043b\:044f\:0435\:0442\:0441\:044f \:0442\:0430\:0431\:043b\:0438\:0446\:0430 \:0437\:043d\:0430\:0447\:0435\:043d\:0438\:0439 \:043a\:043e\:043c\:043f\:043e\:043d\:0435\:043d\:0442."; 
apply::usage = "apply[T_, v___] \:0432\:044b\:0447\:0438\:0441\:043b\:044f\:0435\:0442 \:0437\:043d\:0430\:0447\:0435\:043d\:0438\:0435 \:0442\:0435\:043d\:0437\:043e\:0440\:0430 T, \:0440\:0430\:0441\:0441\:043c\:0430\:0442\:0440\:0438\:0432\:0430\:0435\:043c\:043e\:0433\:043e \:043a\:0430\:043a \:043f\:043e\:043b\:0438\:043b\:0438\:043d\:0435\:0439\:043d\:043e\:0435 \:043e\:0442\:043e\:0431\:0440\:0430\:0436\:0435\:043d\:0438\:0435, \:043d\:0430 \:043f\:043e\:0441\:043b\:0435\:0434\:043e\:0432\:0430\:0442\:0435\:043b\:044c\:043d\:043e\:0441\:0442\:0438 v \:043a\:043e\:0432\:0435\:043a\:0442\:043e\:0440\:043e\:0432 \:0438 \:0432\:0435\:043a\:0442\:043e\:0440\:043e\:0432."; 
makeTrans::usage = "makeTrans[i_Integer, j_Integer] \:043f\:044b\:0442\:0430\:0435\:0442\:0441\:044f \:0432\:044b\:0447\:0438\:0441\:043b\:0438\:0442\:044c \:043c\:0430\:0442\:0440\:0438\:0446\:044b \:043f\:0435\:0440\:0435\:0445\:043e\:0434\:0430 \:043c\:0435\:0436\:0434\:0443 \:0431\:0430\:0437\:0438\:0441\:0430\:043c\:0438 \:0441 \:043d\:043e\:043c\:0435\:0440\:0430\:043c\:0438 i \:0438 j \:043f\:043e \:0443\:0436\:0435 \:0438\:043c\:0435\:044e\:0449\:0438\:043c\:0441\:044f \:043f\:0435\:0440\:0435\:0445\:043e\:0434\:0430\:043c. \:0415\:0441\:043b\:0438 \:0442\:0435\:0440\:043f\:0438\:0442 \:043d\:0435\:0443\:0434\:0430\:0447\:0443, \:0432\:044b\:0434\:0430\:0435\:0442 \:043f\:0440\:0435\:0434\:043b\:043e\:0436\:0435\:043d\:0438\:0435 \:0432\:0432\:0435\:0441\:0442\:0438 \:0432 \:043a\:0430\:0447\:0435\:0441\:0442\:0432\:0435 \:0442\:0440\:0435\:0442\:044c\:0435\:0433\:043e \:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442\:0430 \:043c\:0430\:0442\:0440\:0438\:0446\:0443 \:043f\:0435\:0440\:0435\:0445\:043e\:0434\:0430 \:043e\:0442 \:0431\:0430\:0437\:0438\:0441\:0430 \:0441 \:043d\:043e\:043c\:0435\:0440\:043e\:043c i \:043a \:0431\:0430\:0437\:0438\:0441\:0443 \:0441 \:043d\:043e\:043c\:0435\:0440\:043e\:043c j.
makeTrans[i_Integer, j_Integer, mat_] \:0437\:0430\:0434\:0430\:0435\:0442 \:043c\:0430\:0442\:0440\:0438\:0446\:0443 \:043f\:0435\:0440\:0435\:0445\:043e\:0434\:0430 \:043e\:0442 \:0431\:0430\:0437\:0438\:0441\:0430 \:0441 \:043d\:043e\:043c\:0435\:0440\:043e\:043c i \:043a \:0431\:0430\:0437\:0438\:0441\:0443 \:0441 \:043d\:043e\:043c\:0435\:0440\:043e\:043c j \:0440\:0430\:0432\:043d\:043e\:0439 \:043c\:0430\:0442\:0440\:0438\:0446\:0435 mat, \:0430 \:043e\:0431\:0440\:0430\:0442\:043d\:0443\:044e \:043a mat \:043c\:0430\:0442\:0440\:0438\:0446\:0443 \:0438\:0441\:043f\:043e\:043b\:044c\:0437\:0443\:0435\:0442 \:0432 \:043a\:0430\:0447\:0435\:0441\:0442\:0432\:0435 \:043c\:0430\:0442\:0440\:0438\:0446\:044b \:043e\:0431\:0440\:0430\:0442\:043d\:043e\:0433\:043e \:043f\:0435\:0440\:0435\:0445\:043e\:0434\:0430."; 
makeTransDif::usage = "makeTransDif[i_Integer, j_Integer] \:043f\:044b\:0442\:0430\:0435\:0442\:0441\:044f \:0432\:044b\:0447\:0438\:0441\:043b\:0438\:0442\:044c \:043c\:0430\:0442\:0440\:0438\:0446\:044b \:042f\:043a\:043e\:0431\:0438 \:043f\:0435\:0440\:0435\:0445\:043e\:0434\:0430 \:043c\:0435\:0436\:0434\:0443 \:0441\:0438\:0441\:0442\:0435\:043c\:0430\:043c\:0438 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442 \:0441 \:043d\:043e\:043c\:0435\:0440\:0430\:043c\:0438 i \:0438 j \:043f\:043e \:0443\:0436\:0435 \:0438\:043c\:0435\:044e\:0449\:0438\:043c\:0441\:044f \:043f\:0435\:0440\:0435\:0445\:043e\:0434\:0430\:043c. \:0415\:0441\:043b\:0438 \:0442\:0435\:0440\:043f\:0438\:0442 \:043d\:0435\:0443\:0434\:0430\:0447\:0443, \:0432\:044b\:0434\:0430\:0435\:0442 \:043f\:0440\:0435\:0434\:043b\:043e\:0436\:0435\:043d\:0438\:0435 \:0432\:0432\:0435\:0441\:0442\:0438 \:0432 \:043a\:0430\:0447\:0435\:0441\:0442\:0432\:0435 \:0442\:0440\:0435\:0442\:044c\:0435\:0433\:043e \:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442\:0430 \:0444\:0443\:043d\:043a\:0446\:0438\:0438 \:043f\:0435\:0440\:0435\:0445\:043e\:0434\:0430 \:043e\:0442 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442 \:0441 \:043d\:043e\:043c\:0435\:0440\:043e\:043c i \:043a \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442\:0430\:043c \:0441 \:043d\:043e\:043c\:0435\:0440\:043e\:043c j. makeTransDif[i_Integer, j_Integer, funs_] \:0437\:0430\:0434\:0430\:0435\:0442 \:043c\:0430\:0442\:0440\:0438\:0446\:0443 \:042f\:043a\:043e\:0431\:0438 \:043f\:0435\:0440\:0435\:0445\:043e\:0434\:0430 \:043e\:0442 \:0431\:0430\:0437\:0438\:0441\:0430 \:0441 \:043d\:043e\:043c\:0435\:0440\:043e\:043c i \:043a \:0431\:0430\:0437\:0438\:0441\:0443 \:0441 \:043d\:043e\:043c\:0435\:0440\:043e\:043c j \:0440\:0430\:0432\:043d\:043e\:0439 \:043c\:0430\:0442\:0440\:0438\:0446\:0435 \:042f\:043a\:043e\:0431\:0438 \:0437\:0430\:043c\:0435\:043d\:044b \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442 funs.";
addAssumptions::usage = "addAssumptions[ass__] \:043f\:043e\:0437\:0432\:043e\:043b\:044f\:0435\:0442 \:0434\:043e\:0431\:0430\:0432\:0438\:0442\:044c \:043d\:043e\:0432\:044b\:0435 \:043f\:0440\:0435\:0434\:043f\:043e\:043b\:043e\:0436\:0435\:043d\:0438\:044f \:043a \:0441\:043f\:0438\:0441\:043a\:0443 $Assumptions, \:043a\:043e\:0442\:043e\:0440\:044b\:043c\:0438 \:043f\:043e\:043b\:044c\:0437\:0443\:0435\:0442\:0441\:044f Simplify \:043f\:0440\:0438 \:0443\:043f\:0440\:043e\:0449\:0435\:043d\:0438\:0438. \:041e\:0442\:043c\:0435\:0442\:0438\:043c, \:0447\:0442\:043e \:0430\:0432\:0442\:043e\:043c\:0430\:0442\:0438\:0447\:0435\:0441\:043a\:0438 \:0432 \:044d\:0442\:043e\:0442 \:0441\:043f\:0438\:0441\:043e\:043a \:0434\:043e\:0431\:0430\:0432\:043b\:044f\:0435\:0442\:0441\:044f \:043f\:0440\:0435\:0434\:043f\:043e\:043b\:043e\:0436\:0435\:043d\:0438\:0435 \:043e \:0432\:0435\:0449\:0435\:0441\:0442\:0432\:0435\:043d\:043d\:043e\:0441\:0442\:0438 \:0438\:0441\:043f\:043e\:043b\:044c\:0437\:0443\:0435\:043c\:044b\:0445 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442."; 
clearAssumptions::usage = "clearAssumptions[ass__] \:043f\:043e\:0437\:0432\:043e\:043b\:044f\:0435\:0442 \:0443\:0431\:0440\:0430\:0442\:044c \:043f\:0440\:0435\:0434\:043f\:043e\:043b\:043e\:0436\:0435\:043d\:0438\:044f \:0438\:0437 \:0441\:043f\:0438\:0441\:043a\:0430 $Assumptions"; 
val::usage = "val[T_?tensorQ] \:0432\:043e\:0437\:0432\:0440\:0430\:0449\:0430\:0435\:0442 \:0442\:0430\:0431\:043b\:0438\:0446\:0443 \:0437\:043d\:0430\:0447\:0435\:043d\:0438\:0439 \:043a\:043e\:043c\:043f\:043e\:043d\:0435\:043d\:0442 \:0442\:0435\:043d\:0437\:043e\:0440\:0430 (\:0442\:0435\:043d\:0437\:043e\:0440\:043d\:043e\:0433\:043e \:043f\:043e\:043b\:044f) \:0432 \:0442\:0435\:043a\:0443\:0449\:0435\:043c \:0431\:0430\:0437\:0438\:0441\:0435 (\:0432 \:0442\:0435\:043a\:0443\:0449\:0438\:0445 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442\:0430\:0445)."; 
d::usage = "d - \:0432\:043d\:0435\:0448\:043d\:0435\:0435 \:0434\:0438\:0444\:0444\:0435\:0440\:0435\:043d\:0446\:0438\:0440\:043e\:0432\:0430\:043d\:0438\:0435"; 
Wedge::usage = "\:0432\:043d\:0435\:0448\:043d\:0435\:0435 \:0443\:043c\:043d\:043e\:0436\:0435\:043d\:0438\:0435 \[EscapeKey] ^ \[EscapeKey]"; 
CircleTimes::usage = "\:0442\:0435\:043d\:0437\:043e\:0440\:043d\:043e\:0435 \:043f\:043e\:0438\:0437\:0432\:0435\:0434\:0435\:043d\:0438\:0435 \[EscapeKey] \:0441* \[EscapeKey]"; 
SmallCircle::usage = "\:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:043e\:0435 \:043f\:043e\:0438\:0437\:0432\:0435\:0434\:0435\:043d\:0438\:0435 \[EscapeKey] s\:0441 \[EscapeKey]"; 
resetTensors::usage = "\:043f\:0435\:0440\:0435\:0437\:0430\:043f\:0443\:0441\:0442\:0438\:0442\:044c \:0432\:0441\:0435"; 
makeRiemann::usage = "makeRiemann (\:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442\:043e\:0432 \:043d\:0435\:0442) \:0437\:0430\:0432\:043e\:0434\:0438\:0442 \:043c\:0435\:0442\:0440\:0438\:0447\:0435\:0441\:043a\:0438\:0435 \:0442\:0435\:043d\:0437\:043e\:0440\:044b: g \:0442\:0438\:043f\:0430 (0,2) \:0438 ig \:0442\:0438\:043f\:0430 (2,0). \:0422\:0435\:043d\:0437\:043e\:0440\:044b \:043f\:0440\:0435\:0434\:043f\:043e\:043b\:0430\:0433\:0430\:044e\:0442\:0441\:044f \:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:044b\:043c\:0438."; 
makeRiemannTab::usage = "makeRiemannTab[tab_] \:0437\:0430\:0432\:043e\:0434\:0438\:0442 \:043c\:0435\:0442\:0440\:0438\:0447\:0435\:0441\:043a\:0438\:0435 \:0442\:0435\:043d\:0437\:043e\:0440\:044b: g \:0442\:0438\:043f\:0430 (0,2) \:0441 \:043c\:0430\:0442\:0440\:0438\:0446\:0435\:0439 tab \:0438 ig \:0442\:0438\:043f\:0430 (2,0) \:0441 \:043c\:0430\:0442\:0440\:0438\:0446\:0435\:0439, \:043e\:0431\:0440\:0430\:0442\:043d\:043e\:0439 \:043a tab ."; 
makeCrRiemann::usage = "makeCrRiemann (\:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442\:043e\:0432 \:043d\:0435\:0442) \:0432\:044b\:0447\:0438\:0441\:043b\:044f\:0435\:0442 \:0441\:0438\:043c\:0432\:043e\:043b\:044b \:041a\:0440\:0438\:0441\:0442\:043e\:0444\:0444\:0435\:043b\:044f \[CapitalGamma] \:0441\:0438\:043c\:043c\:0435\:0440\:0438\:0447\:043d\:043e\:0439 \:0440\:0438\:043c\:0430\:043d\:043e\:0432\:043e\:0439 \:0441\:0432\:044f\:0437\:043d\:043e\:0441\:0442\:0438, \:0441\:043e\:0433\:043b\:0430\:0441\:043e\:0432\:0430\:043d\:043d\:044b\:0435 \:0441 \:0437\:0430\:0434\:0430\:043d\:043d\:043e\:0439 \:043c\:0435\:0442\:0440\:0438\:043a\:043e\:0439."; 
makeCrAffine::usage = "makeCrAffine[\:043d\:0435\:043e\:0431\:044f\:0437\:0430\:0442\:0435\:043b\:044c\:043d\:044b\:0439 \:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442_Symbol] \:0437\:0430\:0432\:043e\:0434\:0438\:0442 \:0430\:0431\:0441\:0442\:0440\:0430\:043a\:0442\:043d\:044b\:0435 \:0441\:0438\:043c\:0432\:043e\:043b\:044b \:041a\:0440\:0438\:0441\:0442\:043e\:0444\:0444\:0435\:043b\:044f \:0432 \:0442\:0435\:043a\:0443\:0449\:0438\:0445 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442\:0430\:0445. \:0415\:0441\:043b\:0438 \:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442 \:043d\:0435 \:0443\:043a\:0430\:0437\:0430\:043d, \:0442\:043e \:0438\:043c \:043f\:0440\:0438\:0441\:0432\:0430\:0438\:0432\:0430\:0435\:0442\:0441\:044f \:0438\:043c\:044f \[CapitalGamma], \:0438\:043d\:0430\:0447\:0435 - \:0438\:043c\:044f, \:0443\:043a\:0430\:0437\:0430\:043d\:043d\:043e\:0435 \:0432 \:043a\:0430\:0447\:0435\:0441\:0442\:0432\:0435 \:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442\:0430."; 
makeCrAffineTab::usage = "makeCrAffineTab[tab_List, \:043d\:0435\:043e\:0431\:044f\:0437\:0430\:0442\:0435\:043b\:044c\:043d\:044b\:0439 \:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442_Symbol] \:0437\:0430\:0432\:043e\:0434\:0438\:0442 \:0441\:0438\:043c\:0432\:043e\:043b\:044b \:041a\:0440\:0438\:0441\:0442\:043e\:0444\:0444\:0435\:043b\:044f \:0432 \:0442\:0435\:043a\:0443\:0449\:0438\:0445 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442\:0430\:0445 \:0441\:043e \:0437\:043d\:0430\:0447\:0435\:043d\:0438\:044f\:043c\:0438 \:0438\:0437 tab. \:0415\:0441\:043b\:0438 \:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442 \:043d\:0435 \:0443\:043a\:0430\:0437\:0430\:043d, \:0442\:043e \:0438\:043c \:043f\:0440\:0438\:0441\:0432\:0430\:0438\:0432\:0430\:0435\:0442\:0441\:044f \:0438\:043c\:044f \[CapitalGamma], \:0438\:043d\:0430\:0447\:0435 - \:0438\:043c\:044f, \:0443\:043a\:0430\:0437\:0430\:043d\:043d\:043e\:0435 \:0432 \:043a\:0430\:0447\:0435\:0441\:0442\:0432\:0435 \:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442\:0430.";  
makeTensorField::usage = "makeTensorField[<name>,p_Integer,q_Integer] \:0441\:043e\:0437\:0434\:0430\:0435\:0442 \:0442\:0435\:043d\:0437\:043e\:0440\:043d\:043e\:0435 \:043f\:043e\:043b\:0435 \:0442\:0438\:043f\:0430 (p,q) \:0441 \:0438\:043c\:0435\:043d\:0435\:043c <name>, \:043a\:043e\:043c\:043f\:043e\:043d\:0435\:043d\:0442\:044b \:043a\:043e\:0442\:043e\:0440\:043e\:0433\:043e \:0441\:0443\:0442\:044c \:0444\:0443\:043d\:043a\:0446\:0438\:0438 \:043e\:0442 \:0442\:0435\:043a\:0443\:0449\:0438\:0445 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442. ";
makeSkewField::usage = "makeSkewField[<name>,q_Integer] \:0441\:043e\:0437\:0434\:0430\:0435\:0442 \:043a\:043e\:0441\:043e\:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:043e\:0435 \:0442\:0435\:043d\:0437\:043e\:0440\:043d\:043e\:0435 \:043f\:043e\:043b\:0435 \:0442\:0438\:043f\:0430 (0,q) \:0441 \:0438\:043c\:0435\:043d\:0435\:043c <name>, \:043a\:043e\:043c\:043f\:043e\:043d\:0435\:043d\:0442\:044b \:043a\:043e\:0442\:043e\:0440\:043e\:0433\:043e \:0441\:0443\:0442\:044c \:0444\:0443\:043d\:043a\:0446\:0438\:0438 \:043e\:0442 \:0442\:0435\:043a\:0443\:0449\:0438\:0445 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442. ";
makeSymmField::usage = "makeSymmField[<name>,q_Integer] \:0441\:043e\:0437\:0434\:0430\:0435\:0442 \:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:043e\:0435 \:0442\:0435\:043d\:0437\:043e\:0440\:043d\:043e\:0435 \:043f\:043e\:043b\:0435 \:0442\:0438\:043f\:0430 (0,q) \:0441 \:0438\:043c\:0435\:043d\:0435\:043c <name>, \:043a\:043e\:043c\:043f\:043e\:043d\:0435\:043d\:0442\:044b \:043a\:043e\:0442\:043e\:0440\:043e\:0433\:043e \:0441\:0443\:0442\:044c \:0444\:0443\:043d\:043a\:0446\:0438\:0438 \:043e\:0442 \:0442\:0435\:043a\:0443\:0449\:0438\:0445 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442. ";
makeRiemannField::usage = "makeRiemannField (\:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442\:043e\:0432 \:043d\:0435\:0442) \:0441\:043e\:0437\:0434\:0430\:0435\:0442 \:0442\:0435\:043d\:0437\:043e\:0440\:043d\:044b\:0435 \:043f\:043e\:043b\:044f \:0440\:0438\:043c\:0430\:043d\:043e\:0432\:043e\:0439 \:043c\:0435\:0442\:0440\:0438\:043a\:0438: \:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:043e\:0435 \:043f\:043e\:043b\:0435 g \:0442\:0438\:043f\:0430 (0,2) \:0438 \:0441\:0438\:043c\:043c\:0435\:0442\:0440\:0438\:0447\:043d\:043e\:0435 \:043f\:043e\:043b\:0435 ig \:0442\:0438\:043f\:0430 (2,0). \:041a\:043e\:043c\:043f\:043e\:043d\:0435\:043d\:0442\:044b \:043f\:043e\:043b\:0435\:0439 \:0441\:0443\:0442\:044c \:0444\:0443\:043d\:043a\:0446\:0438\:0438 \:043e\:0442 \:0442\:0435\:043a\:0443\:0449\:0438\:0445 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442. ";
makeCrAffineField::usage = "makeCrAffine[\:043d\:0435\:043e\:0431\:044f\:0437\:0430\:0442\:0435\:043b\:044c\:043d\:044b\:0439 \:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442_Symbol] \:0441\:043e\:0437\:0434\:0430\:0435\:0442 \:043a\:043e\:043c\:043f\:043e\:043d\:0435\:043d\:0442\:044b \:0430\:0444\:0444\:0438\:043d\:043d\:043e\:0439 \:0441\:0432\:044f\:0437\:043d\:043e\:0441\:0442\:0438 \:0432 \:0434\:0430\:043d\:043d\:044b\:0445 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442\:0430\:0445, \:044f\:0432\:043b\:044f\:044e\:0449\:0438\:0435\:0441\:044f \:0444\:0443\:043d\:043a\:0446\:0438\:044f\:043c\:0438 \:043e\:0442 \:043a\:043e\:043e\:0440\:0434\:0438\:043d\:0430\:0442. \:0415\:0441\:043b\:0438 \:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442 \:043d\:0435 \:0443\:043a\:0430\:0437\:0430\:043d, \:0442\:043e \:0438\:043c \:043f\:0440\:0438\:0441\:0432\:0430\:0438\:0432\:0430\:0435\:0442\:0441\:044f \:0438\:043c\:044f \[CapitalGamma], \:0438\:043d\:0430\:0447\:0435 - \:0438\:043c\:044f, \:0443\:043a\:0430\:0437\:0430\:043d\:043d\:043e\:0435 \:0432 \:043a\:0430\:0447\:0435\:0441\:0442\:0432\:0435 \:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442\:0430.";


Protect[alt, sym, EE, SE, DE, g, ig, \[CapitalGamma]]; 
tensor[Plus[T__]] := Head[T] === Plus && typeQ @@ T; 
tensor[(a_)*(T_)] /; tensor[T] := True; 
tensor[\[CircleTimes](T__)] := tensorQ[T]; 
tensor[Wedge[T__]] := skewQ[T]; 
tensor[SmallCircle[T__]] := symmQ[T]; 
tensor[Overscript[(T_)?tensorQ, {(\[Tau]_)?PermutationQ}]] /; Length[\[Tau]] == First[type[T]] := True; 
tensor[Underscript[(T_)?tensorQ, {(\[Tau]_)?PermutationQ}]] /; Length[\[Tau]] == Last[type[T]] := True; 
tensor[Underoverscript[(T_)?tensorQ, {(\[Sigma]_)?PermutationQ}, {(\[Tau]_)?PermutationQ}]] /; 
    Length[\[Tau]] == First[type[T]] && Length[\[Sigma]] == Last[type[T]] := True; 
tensor[Underscript[(T_)?tensorQ, alt]] := True; 
tensor[Overscript[(T_)?tensorQ, alt]] := True; 
tensor[Underscript[(T_)?tensorQ, sym]] := True; 
tensor[Overscript[(T_)?tensorQ, sym]] := True; 
tensor[Underoverscript[(T_)?tensorQ, j_Integer, i_Integer]] /; Inequality[0, Less, i, LessEqual, First[type[T]]] && 
     Inequality[0, Less, j, LessEqual, Last[type[T]]] := True; 
tensor[h_[T_]]/;h===d:=skewQ[T];
skew[Plus[T__]] := Head[T] === Plus && skewQ @@ T; 
skew[(a_)*(T_)] /; skew[T] := True; 
skew[Wedge[T__]] := skewQ[T]; 
skew[Underscript[(T_)?skewQ, {(\[Tau]_)?PermutationQ}]] /; Length[\[Tau]] == Last[type[T]] := True; 
skew[Underscript[(T_)?tensorQ, alt]] /; First[type[T]] == 0 := True; 
skew[Underscript[(T_)?skewQ, sym]] := True; 
skew[h_[T_]]/;h===d:=skewQ[T];
symm[Plus[T__]] := Head[T] === Plus && symmQ @@ T; 
symm[(a_)*(T_)] /; symm[T] := True; 
symm[SmallCircle[T__]] := symmQ[T]; 
symm[Underscript[(T_)?symmQ, {(\[Tau]_)?PermutationQ}]] /; Length[\[Tau]] == Last[type[T]] := True; 
symm[Underscript[(T_)?tensorQ, sym]] /; First[type[T]] == 0 := True; 
symm[Underscript[(T_)?symmQ, alt]] := True; 
type[Plus[T__]] /; Head[T] === Plus && typeQ @@ T := type[First[List @@ T]]; 
type[(a_)*(T_)] /; tensor[T] := type[T]; 
type[\[CircleTimes](T__)] /; tensorQ[T] := Plus @@ type /@ {T}; 
type[Wedge[T__]] /; skewQ[T] := Plus @@ type /@ {T}; 
type[SmallCircle[T__]] /; symmQ[T] := Plus @@ type /@ {T}; 
type[Overscript[(T_)?tensorQ, {(\[Tau]_)?PermutationQ}]] /; Length[\[Tau]] == First[type[T]] := type[T]; 
type[Underscript[(T_)?tensorQ, {(\[Tau]_)?PermutationQ}]] /; Length[\[Tau]] == Last[type[T]] := type[T]; 
type[Underoverscript[(T_)?tensorQ, {(\[Sigma]_)?PermutationQ}, {(\[Tau]_)?PermutationQ}]] /; 
    Length[\[Tau]] == First[type[T]] && Length[\[Sigma]] == Last[type[T]] := type[T]; 
type[Underscript[(T_)?tensorQ, alt]] := type[T]; 
type[Overscript[(T_)?tensorQ, alt]] := type[T]; 
type[Underscript[(T_)?tensorQ, sym]] := type[T]; 
type[Overscript[(T_)?tensorQ, sym]] := type[T]; 
type[Underoverscript[(T_)?tensorQ, j_Integer, i_Integer]] /; Inequality[0, Less, i, LessEqual, First[type[T]]] && 
     Inequality[0, Less, j, LessEqual, Last[type[T]]] := type[T] - {1, 1}; 
type[h_[T_]]/;h===d&&skewQ[T]:=type[T]+{0,1};
val[T_Symbol] /; inBasis[T] != curBas := Module[{inB, res}, inB = inBasis[T]; inBasis[T] = curBas; 
     res = changeVal[T, inB, curBas]; val[T] = res[[1]]; If[ !res[[2]], inBasis[T] = inB]; res[[1]]]; 
val[Plus[T__]] /; Head[T] === Plus && typeQ @@ T := Plus @@ val /@ List @@ T; 
val[(a_)*(T_)] /; tensor[T] := a*val[T]; 
val[\[CircleTimes](T__)] /; tensorQ[T] := Module[{rk, pTotal, typeL, pqL, comp}, 
    typeL = type /@ {T}; pqL = Transpose[Accumulate /@ Transpose[typeL]]; pTotal = First[Last[pqL]]; 
     rk = Plus @@ Flatten[typeL]; comp[ind__] := MapThread[Underoverscript[#1, {ind}[[pTotal + Last[#2] + Range[Last[#3]]]], 
         {ind}[[First[#2] + Range[First[#3]]]]] & , {{T}, Join[{{0, 0}}, Most[pqL]], typeL}]; 
     Array[Times @@ comp[##1] & , ConstantArray[nn[basis[curBas]], rk]]]; 
val[Wedge[T__]] /; skewQ[T] := Module[{n, q, prod}, n = nn[basis[curBas]]; q = Last[type[Wedge[T]]]; 
     prod = Wedge @@ toBasisSkew /@ {T}; If[prod === 0, ConstantArray[0, ConstantArray[n, q]], toListSkew[prod]]]; 
val[SmallCircle[T__]] /; symmQ[T] := Module[{n, q, prod}, n = nn[basis[curBas]]; q = Last[type[SmallCircle[T]]]; 
     prod = SmallCircle @@ toBasisSymm /@ {T}; If[prod === 0, ConstantArray[0, ConstantArray[n, q]], toListSymm[prod]]]; 
val[Overscript[(T_)?tensorQ, {(\[Tau]_)?PermutationQ}]] /; Length[\[Tau]] == First[type[T]] := 
   Module[{jL, iL, p, q}, {p, q} = type[T]; Array[(jL = {##1}[[Range[p + 1, p + q]]]; iL = Permute[{##1}[[Range[p]]], \[Tau]]; 
        Underoverscript[T, jL, iL]) & , ConstantArray[nn[basis[curBas]], p + q]]]; 
val[Underscript[(T_)?tensorQ, {(\[Tau]_)?PermutationQ}]] /; Length[\[Tau]] == Last[type[T]] := 
   Module[{jL, iL, p, q}, {p, q} = type[T]; Array[(jL = Permute[{##1}[[Range[p + 1, p + q]]], \[Tau]]; iL = {##1}[[Range[p]]]; 
        Underoverscript[T, jL, iL]) & , ConstantArray[nn[basis[curBas]], p + q]]]; 
val[Underoverscript[(T_)?tensorQ, {(\[Sigma]_)?PermutationQ}, {(\[Tau]_)?PermutationQ}]] /; 
    Length[\[Tau]] == First[type[T]] && Length[\[Sigma]] == Last[type[T]] := 
   Module[{jL, iL, p, q}, {p, q} = type[T]; Array[(jL = Permute[{##1}[[Range[p + 1, p + q]]], \[Sigma]]; 
        iL = Permute[{##1}[[Range[p]]], \[Tau]]; Underoverscript[T, jL, iL]) & , ConstantArray[nn[basis[curBas]], p + q]]]; 
val[Underscript[(T_)?tensorQ, alt]] := Module[{perm, q = Last[type[T]], res = val[T], i}, 
    perm = Permutations[q]; For[i = 2, i <= q!, i++, res = res + Signature[perm[[i]]]*val[Underscript[T, {perm[[i]]}]]]; 
     res/q!]; 
val[Overscript[(T_)?tensorQ, alt]] := Module[{perm, p = First[type[T]], res = val[T], i}, 
    perm = Permutations[p]; For[i = 2, i <= p!, i++, res = res + Signature[perm[[i]]]*val[Overscript[T, {perm[[i]]}]]]; res/p!]; 
val[Underscript[(T_)?tensorQ, sym]] := Module[{perm, q = Last[type[T]], res = val[T], i}, 
    perm = Permutations[q]; For[i = 2, i <= q!, i++, res = res + val[Underscript[T, {perm[[i]]}]]]; res/q!]; 
val[Overscript[(T_)?tensorQ, sym]] := Module[{perm, p = First[type[T]], res = val[T], i}, 
    perm = Permutations[p]; For[i = 2, i <= p!, i++, res = res + val[Overscript[T, {perm[[i]]}]]]; res/p!]; 
val[Underoverscript[(T_)?tensorQ, j_Integer, i_Integer]] /; Inequality[0, Less, i, LessEqual, First[type[T]]] && 
     Inequality[0, Less, j, LessEqual, Last[type[T]]] := Module[{p, q, iL, jL, \[Alpha]}, 
    p = First[type[T]] - 1; q = Last[type[T]] - 1; Array[(jL = Insert[{##1}[[Range[p + 1, p + q]]], \[Alpha], j]; 
        iL = Insert[{##1}[[Range[p]]], \[Alpha], i]; Sum[Underoverscript[T, jL, iL], {\[Alpha], 1, nn[basis[curBas]]}]) & , 
      ConstantArray[nn[basis[curBas]], p + q]]]; 
val[h_[T_]]/;h===d&&skewQ[T]:=toListSkew[d[toBasisSkew[T]]];
tensorBas[Plus[T__]] /; Head[T] === Plus := MatchQ[And @@ tensorBas /@ List @@ T, True]; 
tensorBas[(a_)*(T_)] /; tensorBas[T] := True; 
tensorBas[\[CircleTimes](T__)] := tensorBasQ[T]; 
tensorBas[Wedge[T__]]:=skewBasQ[T];
tensorBasQ[T__] := MatchQ[And @@ tensorBas /@ {T}, True]; 
tensorBas[h_[T_]]/;h===d:=skewBasQ[T];
typeBas[Plus[T__]] /; Head[T] === Plus && (tensorBasQ[#1] || skewBasQ[#1] || symmBasQ[#1] & ) @@ T && typeBasQ @@ T := 
   First[typeBas /@ List @@ T]; 
skewBas[Plus[T__]] /; Head[T] === Plus := MatchQ[And @@ skewBas /@ List @@ T, True]; 
skewBas[(a_)*(T_)] /; skewBas[T] := True; 
skewBas[Wedge[T__]] := skewBasQ[T]; 
skewBas[h_[T_]]/;h===d:=skewBasQ[T];
skewBasQ[T__] := MatchQ[And @@ skewBas /@ {T}, True]; 
symmBas[Plus[T__]] /; Head[T] === Plus := MatchQ[And @@ symmBas /@ List @@ T, True]; 
symmBas[(a_)*(T_)] /; symmBas[T] := True; 
symmBas[SmallCircle[T__]] := symmBasQ[T]; 
symmBasQ[T__] := MatchQ[And @@ symmBas /@ {T}, True]; 
typeBas[(\[Lambda]_)*(T_)] /; tensorBas[T] || skewBas[T] || symmBas[T] := typeBas[T]; 
typeBas[\[CircleTimes](T__)] /; tensorBasQ[T] := Plus @@ typeBas /@ {T}; 
typeBas[Wedge[T__]] /; skewBasQ[T] := Plus @@ typeBas /@ {T}; 
typeBas[SmallCircle[T__]] /; symmBasQ[T] := Plus @@ typeBas /@ {T}; 
typeBasQ[T__] := SameQ @@ typeBas /@ {T}; 
typeBas[h_[T_]]/;h===d&&skewBasQ[T]:=typeBas[T]+{0,1};
SetAttributes[val, {Flat, OneIdentity}]; 
SetAttributes[tensorBas, {Flat, OneIdentity}]; 
SetAttributes[skewBas, {Flat, OneIdentity}]; 
SetAttributes[symmBas, {Flat, OneIdentity}]; 
SetAttributes[typeBas, {Flat, OneIdentity}]; 
SetAttributes[CircleTimes, {Flat, OneIdentity}]; 
SetAttributes[Wedge, {Flat, OneIdentity}]; 
SetAttributes[SmallCircle, {Flat, OneIdentity, Orderless}]; 
((T_)?tensorBasQ + (S_)?tensorBasQ) \[CircleTimes] (R_)?tensorBasQ := T \[CircleTimes] R + S \[CircleTimes] R; 
(R_)?tensorBasQ \[CircleTimes] ((T_)?tensorBasQ + (S_)?tensorBasQ) := R \[CircleTimes] T + R \[CircleTimes] S; 
(R_)?tensorBasQ \[CircleTimes] ((a_)*(S_)?tensorBasQ) := a*R \[CircleTimes] S; 
((a_)*(R_)?tensorBasQ) \[CircleTimes] (S_)?tensorBasQ := a*R \[CircleTimes] S; 
((T_)?skewBasQ + (S_)?skewBasQ) \[Wedge] (R_)?skewBasQ := T \[Wedge] R + S \[Wedge] R; 
(R_)?skewBasQ \[Wedge] ((T_)?skewBasQ + (S_)?skewBasQ) := R \[Wedge] T + R \[Wedge] S; 
(R_)?skewBasQ \[Wedge] ((a_)*(S_)?skewBasQ) := a*R \[Wedge] S; 
((a_)*(R_)?skewBasQ) \[Wedge] (S_)?skewBasQ := a*R \[Wedge] S; 
(R_)?skewBasQ \[Wedge] 0 := 0; 
0 \[Wedge] (R_)?skewBasQ := 0; 
basisQ[T__] := MatchQ[And @@ (MemberQ[basis[curBas], #1] & ) /@ {T}, True]; 
Wedge[(T__)?basisQ] /; Signature[{T}] != 1 := If[Signature[{T}] == 0, 0, -(Wedge[Sequence @@ Sort[{T}]])]; 
((T_)?symmBasQ + (S_)?symmBasQ) \[SmallCircle] (R_)?symmBasQ := T \[SmallCircle] R + S \[SmallCircle] R; 
((a_)*(R_)?symmBasQ) \[SmallCircle] (S_)?symmBasQ := a*R \[SmallCircle] S; 
d[(a_:1)*Wedge[(T__)?basisQ]] := D[a, {coor[curBas]}] . Take[basis[curBas], nn[basis[curBas]]] \[Wedge] T; 
d[(a_:1)*(T_)?basisQ] := D[a, {coor[curBas]}] . Take[basis[curBas], nn[basis[curBas]]] \[Wedge] T; 
d[(T_)?dFormBasQ + (R_)?dFormBasQ] := d[T] + d[R]; 
d[(a_)?NumberQ] := 0; 

tensorQ[T__] := MatchQ[And @@ tensor /@ {T}, True]; 
typeQ[T__] := SameQ @@ type /@ {T}; 
skewQ[T__] := MatchQ[And @@ skew /@ {T}, True]; 
symmQ[T__] := MatchQ[And @@ symm /@ {T}, True]; 
dFormQ[T_] := skewQ[T] && coor[curBas] != {}; 
dFormBasQ[T_] := skewBasQ[T] && coor[curBas] != {}; 
nn[basis_] := Length[basis]/2; 
numBas = 0; curBas = 0; graphBas = {}; 
Unprotect[Set]; 
(A_ = (B_)?tensorQ) := (tensor[A] = True; type[A] = type[B]; inBasis[A] = inBasis[B]; val[A] = val[B]; 
    If[skewQ[B], skew[A] = True]; If[symmQ[B], symm[A] = True]; If[crist[B]===True, crist[A] = True]); 
Protect[Set]; 
Unprotect[D]; 
D[x_, k_Integer] := D[x, coor[curBas][[k]]]; 
Protect[D]; 
initScan := (Scan[(tensorBas[basis[curBas][[#1]]] = True; tensorBas[basis[curBas][[nn[basis[curBas]] + #1]]] = True) & , 
     Range[nn[basis[curBas]]]]; Scan[(typeBas[basis[curBas][[#1]]] = {0, 1}; typeBas[basis[curBas][[nn[basis[curBas]] + #1]]] = 
        {1, 0}) & , Range[nn[basis[curBas]]]]; 
    Scan[(skewBas[basis[curBas][[#1]]] = True; symmBas[basis[curBas][[#1]]] = True) & , Range[nn[basis[curBas]]]]; ); 
makeBasis[e_Symbol, n_Integer, num_Integer:-1, mat_List:{}] := 
   Module[{nnum}, If[num == -1, nnum = curBas, nnum = num]; numBas++; curBas = numBas; 
     If[mat != {} && coor[nnum] == {}, matCC[{nnum, curBas}] = mat; matCC[{curBas, nnum}] = Inverse[mat]; 
       graphBas = Join[graphBas, {nnum -> curBas, curBas -> nnum}]]; 
     basis[curBas] = Join[Table[Overscript[e, i], {i, n}], Table[Underscript[e, i], {i, n}]]; coor[curBas] = {}; initScan]; 
JacobianMatrix[coorInit_List, funs_List] /; ArrayDepth[coorInit] == 1 && ArrayDepth[funs] == 1 := 
   Simplify[Transpose[(D[funs, #1] & ) /@ coorInit]]; 
makeBasisDif[x_Symbol, n_, num_Integer:-1, funs_List:{}, invfuns_List:{}] := 
   Module[{nnum}, If[num == -1, nnum = curBas, nnum = num]; numBas++; curBas = numBas; 
     coor[curBas] = Table[Overscript[x, i], {i, n}]; $Assumptions = $Assumptions && Element[coor[curBas], Reals]; 
     If[funs != {} && coor[nnum] != {}, funsCC[{nnum, curBas}] = funs; matCC[{nnum, curBas}] = 
        JacobianMatrix[coor[curBas], funs]; graphBas = Join[graphBas, {nnum -> curBas}]]; 
     If[invfuns != {} && coor[nnum] != {}, funsCC[{curBas, nnum}] = invfuns; matCC[{curBas, nnum}] = 
        JacobianMatrix[coor[nnum], invfuns]; graphBas = Join[graphBas, {curBas -> nnum}]]; 
     basis[curBas] = Join[Table[Overscript[Symbol[StringJoin["d", ToString[x]]], i], {i, n}], 
       Table[Underscript[Symbol[StringJoin["\[Delta]", ToString[x]]], i], {i, n}]]; initScan]; 
makeBasisDif[x_List, num_Integer:-1, funs_List:{}, invfuns_List:{}] /; ArrayDepth[x] == 1 && Length[x] > 0 := 
   Module[{nnum}, If[num == -1, nnum = curBas, nnum = num]; numBas++; curBas = numBas; coor[curBas] = x; 
     $Assumptions = $Assumptions && Element[x, Reals]; If[funs != {} && coor[nnum] != {}, 
      funsCC[{nnum, curBas}] = funs; matCC[{nnum, curBas}] = JacobianMatrix[coor[curBas], funs]; 
       graphBas = Join[graphBas, {nnum -> curBas}]]; If[invfuns != {} && coor[nnum] != {}, 
      funsCC[{curBas, nnum}] = invfuns; matCC[{curBas, nnum}] = JacobianMatrix[coor[nnum], invfuns]; 
       graphBas = Join[graphBas, {curBas -> nnum}]]; basis[curBas] = Join[(Symbol[StringJoin["d", ToString[#1]]] & ) /@ x, 
       (Subscript[\[Delta], #1] & ) /@ x]; initScan]; 
makeTensor[T_, p_Integer, q_Integer] := 
   (val[T] = Array[Underoverscript[ToString[T], StringJoin @@ ToString /@ {##1}[[Range[p + 1, p + q]]], 
        StringJoin @@ ToString /@ {##1}[[Range[p]]]] & , ConstantArray[nn[basis[curBas]], p + q]]; tensor[T] = True; 
    type[T] = {p, q}; inBasis[T] = curBas; If[TrueQ[symm[T]], symm[T] =. ]; If[TrueQ[skew[T]], skew[T] =. ]; 
    If[p == 0 && q <= 1, symm[T] = True; skew[T] = True]; ); 
makeSkew[T_, q_Integer] := 
   (val[T] = Array[If[Signature[{##1}[[Range[q]]]] == 0, 0, Signature[{##1}[[Range[q]]]]*Underscript[ToString[T], 
          StringJoin @@ ToString /@ Sort[{##1}[[Range[q]]]]]] & , ConstantArray[nn[basis[curBas]], q]]; tensor[T] = True; 
    skew[T] = True; If[q <= 1, symm[T] = True, If[TrueQ[symm[T]], symm[T] =. ]]; type[T] = {0, q}; inBasis[T] = curBas; ); 
makeSymm[T_, q_Integer] := (val[T] = Array[Underscript[ToString[T], StringJoin @@ ToString /@ Sort[{##1}[[Range[q]]]]] & , 
      ConstantArray[nn[basis[curBas]], q]]; tensor[T] = True; symm[T] = True; 
    If[q <= 1, skew[T] = True, If[TrueQ[skew[T]], skew[T] =. ]]; type[T] = {0, q}; inBasis[T] = curBas; ); 
SetAttributes[makeTensorTab, HoldFirst]; 
makeTensorTab[T_, tab_, p_Integer, q_Integer] /; (Length[Union[Dimensions[tab]]] == 1 && ArrayDepth[tab] == p + q && 
      First[Union[Dimensions[tab]]] == nn[basis[curBas]]) || (p == q == 0 &&  !Head[tab] === List) := 
   (ClearAll[T]; val[T] = tab; tensor[T] = True; type[T] = {p, q}; inBasis[T] = curBas; If[TrueQ[symm[T]], symm[T] =. ]; 
    If[TrueQ[skew[T]], skew[T] =. ]; If[p == 0 && q <= 1, symm[T] = True; skew[T] = True]; ); 
makeSkewTab[T_, tab_] /; Length[Union[Dimensions[tab]]] == 1 && First[Union[Dimensions[tab]]] == nn[basis[curBas]] := 
   Module[{q}, q = ArrayDepth[tab]; val[T] = Array[If[Signature[{##1}[[Range[q]]]] == 0, 0, Signature[{##1}[[Range[q]]]]*
          tab[[Sequence @@ Sort[{##1}[[Range[q]]]]]]] & , ConstantArray[nn[basis[curBas]], q]]; tensor[T] = True; 
     skew[T] = True; type[T] = {0, q}; If[q <= 1, symm[T] = True, If[TrueQ[symm[T]], symm[T] =. ]]; inBasis[T] = curBas; ]; 
makeSymmTab[T_, tab_] /; Length[Union[Dimensions[tab]]] == 1 && First[Union[Dimensions[tab]]] == nn[basis[curBas]] := 
   Module[{q}, q = ArrayDepth[tab]; val[T] = Array[tab[[Sequence @@ Sort[{##1}[[Range[q]]]]]] & , 
       ConstantArray[nn[basis[curBas]], q]]; tensor[T] = True; symm[T] = True; type[T] = {0, q}; 
     If[q <= 1, skew[T] = True, If[TrueQ[skew[T]], skew[T] =. ]]; inBasis[T] = curBas; ]; 
makeSymm[T_, q_Integer, 0] := (val[T] = Array[Overscript[ToString[T], StringJoin @@ ToString /@ Sort[{##1}[[Range[q]]]]] & , 
      ConstantArray[nn[basis[curBas]], q]]; tensor[T] = True; type[T] = {q, 0}; inBasis[T] = curBas; ); 
makeTensorField[T_, p_Integer, q_Integer] /; coor[curBas] != {} := 
   (val[T] = Array[Underoverscript[ToString[T], StringJoin @@ ToString /@ {##1}[[Range[p + 1, p + q]]], 
         StringJoin @@ ToString /@ {##1}[[Range[p]]]][Sequence @@ coor[curBas]] & , ConstantArray[nn[basis[curBas]], p + q]]; 
    tensor[T] = True; type[T] = {p, q}; inBasis[T] = curBas; If[TrueQ[symm[T]], symm[T] =. ]; If[TrueQ[skew[T]], skew[T] =. ]; 
    If[p == 0 && q <= 1, symm[T] = True; skew[T] = True]; );
 makeSkewField[T_, q_Integer] /; coor[curBas] != {} := 
   (val[T] = Array[If[Signature[{##1}[[Range[q]]]] == 0, 0, Signature[{##1}[[Range[q]]]]*
         Underscript[ToString[T], StringJoin @@ ToString /@ Sort[{##1}[[Range[q]]]]][Sequence @@ coor[curBas]]] & , 
      ConstantArray[nn[basis[curBas]], q]]; tensor[T] = True; skew[T] = True; 
    If[q <= 1, symm[T] = True, If[TrueQ[symm[T]], symm[T] =. ]]; type[T] = {0, q}; inBasis[T] = curBas; ); 
makeSymmField[T_, q_Integer] /; coor[curBas] != {} := 
   (val[T] = Array[Underscript[ToString[T], StringJoin @@ ToString /@ Sort[{##1}[[Range[q]]]]][Sequence @@ coor[curBas]] & , 
      ConstantArray[nn[basis[curBas]], q]]; tensor[T] = True; symm[T] = True; 
    If[q <= 1, skew[T] = True, If[TrueQ[skew[T]], skew[T] =. ]]; type[T] = {0, q}; inBasis[T] = curBas; ); 
makeSymmField[T_, q_Integer, 0] /; coor[curBas] != {} := 
   (val[T] = Array[Overscript[ToString[T], StringJoin @@ ToString /@ Sort[{##1}[[Range[q]]]]][Sequence @@ coor[curBas]] & , 
      ConstantArray[nn[basis[curBas]], q]]; tensor[T] = True; type[T] = {q, 0}; inBasis[T] = curBas; );
makeRiemann /; curBas > 0 := (Unprotect[g, ig]; makeSymm[g, 2]; makeSymm[ig, 2, 0]; Protect[g, ig]; 
    Print[
     "\:0421\:043e\:0437\:0434\:0430\:043d\:044b \:043c\:0435\:0442\:0440\:0438\:0447\:0435\:0441\:043a\:0438\:0435 \:0442\:0435\:043d\:0437\:043e\:0440\:044b g \:0442\:0438\:043f\:0430 (0,2) \:0438 ig \:0442\:0438\:043f\:0430 (2,0)"\
]); 
makeRiemannField/;curBas>0&&coor[curBas]!={}:=(Unprotect[g,ig];makeSymmField[g,2];makeSymmField[ig,2,0];Protect[g,ig];
	Print["\:0421\:043e\:0437\:0434\:0430\:043d\:044b \:043c\:0435\:0442\:0440\:0438\:0447\:0435\:0441\:043a\:0438\:0435 \:0442\:0435\:043d\:0437\:043e\:0440\:043d\:044b\:0435 \:043f\:043e\:043b\:044f g \:0442\:0438\:043f\:0430 (0,2) \:0438 ig \:0442\:0438\:043f\:0430 (2,0)"]);
makeRiemannTab[tab_List] /; curBas > 0 && Dimensions[tab] == {nn[basis[curBas]], nn[basis[curBas]]} := 
   (Unprotect[g, ig]; makeTensorTab[g, tab, 0, 2]; makeTensorTab[ig, Simplify[Inverse[tab]], 2, 0]; Protect[g, ig]; 
    Print[
     "\:0421\:043e\:0437\:0434\:0430\:043d \:043c\:0435\:0442\:0440\:0438\:0447\:0435\:0441\:043a\:0438\:0439 \:0442\:0435\:043d\:0437\:043e\:0440 g \:0442\:0438\:043f\:0430 (0,2) \:0438 \:043e\:0431\:0440\:0430\:0442\:043d\:044b\:0439 \:043a \:043d\:0435\:043c\:0443 \:0442\:0435\:043d\:0437\:043e\:0440 ig \:0442\:0438\:043f\:0430 (2,0)"\
]); 
makeCrRiemann /; tensor[g] := Module[{aL, bL, n = nn[basis[curBas]]}, Unprotect[\[CapitalGamma]]; inBasis[\[CapitalGamma]] = curBas; tensor[\[CapitalGamma]] = True; 
     type[\[CapitalGamma]] := {1, 2}; crist[\[CapitalGamma]] = True; RiemannQ[\[CapitalGamma]] = True; 
     val[\[CapitalGamma]] = Array[(aL = {##1}[[1]]; bL = {##1}[[{2, 3}]]; Sum[(1/2)*Overscript[ig, {aL, \[Alpha]}]*
           (D[Underscript[g, {bL[[1]], \[Alpha]}], bL[[2]]] + D[Underscript[g, {bL[[2]], \[Alpha]}], bL[[1]]] - 
            D[Underscript[g, bL], \[Alpha]]), {\[Alpha], 1, n}]) & , ConstantArray[n, 3]]; Protect[\[CapitalGamma]]; ]; 
makeCrAffine[] /; curBas > 0 := (Unprotect[\[CapitalGamma]]; makeTensor[\[CapitalGamma], 1, 2]; crist[\[CapitalGamma]] = True; RiemannQ[\[CapitalGamma]] = False; 
    Protect[\[CapitalGamma]]; ); 
makeCrAffineField[]/;curBas>0&&coor[curBas]!={}:=
(Unprotect[\[CapitalGamma]];makeTensorField[\[CapitalGamma],1,2];crist[\[CapitalGamma]]=True;RiemannQ[\[CapitalGamma]]=False;Protect[\[CapitalGamma]];);
makeCrAffineTab[tab_List] /; curBas > 0 && Dimensions[tab] === {nn[basis[curBas]], nn[basis[curBas]], nn[basis[curBas]]} := 
   (Unprotect[\[CapitalGamma]]; makeTensorTab[\[CapitalGamma], tab, 1, 2]; crist[\[CapitalGamma]] = True; RiemannQ[\[CapitalGamma]] = False; Protect[\[CapitalGamma]]; ); 
makeCrAffine[A_Symbol] /; curBas > 0 := (makeTensor[A, 1, 2]; crist[A] = True; RiemannQ[A] = False; ); 
makeCrAffineField[A_Symbol]/;curBas>0&&coor[curBas]!={}:=
	(makeTensorField[A,1,2];crist[A]=True;RiemannQ[A]=False;);
makeCrAffineTab[tab_List, A_Symbol] /; curBas > 0 && Dimensions[tab] === {nn[basis[curBas]], nn[basis[curBas]], 
       nn[basis[curBas]]} := (makeTensorTab[A, tab, 1, 2]; crist[A] = True; RiemannQ[A] = False; ); 
intListRange[x_] := And @@ (MemberQ[Range[nn[basis[curBas]]], #1] & ) /@ x; 
intList[x_, len_] := Length[x] == len && intListRange[x]; 
Underoverscript[(T_)?tensorQ, j_List, i_List] /; intList[i, First[type[T]]] && intList[j, Last[type[T]]] := 
   val[T][[Sequence @@ Join[i, j]]]; 
Overscript[(T_)?tensorQ, i_List] /; intList[i, First[type[T]]] && Last[type[T]] == 0 := val[T][[Sequence @@ i]]; 
Underscript[(T_)?tensorQ, j_List] /; First[type[T]] == 0 && intList[j, Last[type[T]]] := val[T][[Sequence @@ j]]; 
Underoverscript[\:0415E, i_List, j_List] := Module[{len}, len = Length[Join[j, i]]; Which[len == 0, 1, len == 1, 
      First[Join[(basis[curBas][[#1]] & ) /@ j, (basis[curBas][[nn[basis[curBas]] + #1]] & ) /@ i]], len > 1, 
      CircleTimes @@ Join[(basis[curBas][[#1]] & ) /@ j, (basis[curBas][[nn[basis[curBas]] + #1]] & ) /@ i]]]; 
Underoverscript[EE, p_Integer, q_Integer] /; q >= 0 && p >= 0 := 
   Array[Underoverscript[\:0415E, {##1}[[Range[p]]], {##1}[[Range[p + 1, p + q]]]] & , ConstantArray[nn[basis[curBas]], p + q]]; 
Overscript[DE, j_List] := Module[{len, jL}, len = Length[j]; Which[len == 0, 1, len == 1, First[(basis[curBas][[#1]] & ) /@ j], 
      len > 1, jL = Sort[j]; Signature[j]*Wedge @@ (basis[curBas][[#1]] & ) /@ jL]]; 
Overscript[SE, j_List] := Module[{len, jL}, len = Length[j]; Which[len == 0, 1, len == 1, First[(basis[curBas][[#1]] & ) /@ j], 
      len > 1, jL = Sort[j]; SmallCircle @@ (basis[curBas][[#1]] & ) /@ jL]]; 
Overscript[DE, q_Integer] /; q >= 0 := Array[Overscript[DE, {##1}[[Range[q]]]] & , ConstantArray[nn[basis[curBas]], q]]; 
Overscript[SE, q_Integer] /; q >= 0 := Array[Overscript[SE, {##1}[[Range[q]]]] & , ConstantArray[nn[basis[curBas]], q]]; 
toBasis[T_] /; tensor[T] := Flatten[val[T]] . Flatten[Underoverscript[EE, First[type[T]], Last[type[T]]]]; 
toList[T_] /; tensorBas[T] := (Coefficient[T, #1] & ) /@ Underoverscript[EE, First[typeBas[T]], Last[typeBas[T]]]; 
toBasisSkew[T_] /; skewQ[T] := Module[{n, q, ind}, n = nn[basis[curBas]]; q = Last[type[T]]; ind = Subsets[Range[n], {q}]; 
     Plus @@ (Underscript[T, #1]*Overscript[DE, #1] & ) /@ ind]; 
toListSkew[T_] /; skewBas[T] := Module[{n, q, jL}, n = nn[basis[curBas]]; q = Last[typeBas[T]]; 
     Array[(jL = Sort[{##1}[[Range[q]]]]; If[Signature[{##1}[[Range[q]]]] == 0, 0, Signature[{##1}[[Range[q]]]]*
          Coefficient[T, Overscript[DE, jL]]]) & , ConstantArray[n, q]]]; 
toListSkew[0]=0;
toBasisSymm[T_] /; symmQ[T] := Flatten[val[T]] . Flatten[Overscript[SE, Last[type[T]]]]; 
toListSymm[T_] /; symmBas[T] := Module[{n, q, jL}, n = nn[basis[curBas]]; q = Last[typeBas[T]]; 
     Array[(jL = {##1}[[Range[q]]]; (Times @@ (#1[[2]]! & ) /@ Tally[jL]/q!)*Coefficient[T, Overscript[SE, jL]]) & , 
      ConstantArray[n, q]]]; 
apply[T_, v___] /; tensor[T] && Plus @@ type[T] == Length[{v}] := 
   Module[{ls}, ls = {v}; ls = (If[tensor[#1] && MemberQ[{{1, 0}, {0, 1}}, type[#1]], val[#1], 
         If[Length[#1] == nn[basis[curBas]] && ArrayDepth[#1] == 1, #1, 
          Print[
            "\:041d\:0435\:0441\:043e\:043e\:0442\:0432\:0435\:0442\:0441\:0442\:0432\:0438\:0435 \:0442\:0435\:043d\:0437\:043e\:0440\:0430 \:0438 \:0435\:0433\:043e \:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442\:043e\:0432"]; 
           Abort[]]] & ) /@ ls; Flatten[val[T]] . Flatten[Outer[Times, Sequence @@ Take[ls, First[type[T]]], 
        Sequence @@ Take[ls, -Last[type[T]]]]]]; 
makeTrans[i_Integer, j_Integer, mat_:{}] /; i != j := Module[{p, res = True}, 
    If[coor[i] != {} || coor[j] != {}, 
      Print[
        "\:041e\:0448\:0438\:0431\:043a\:0430: \:043f\:043e\:043f\:044b\:0442\:043a\:0430 \:043f\:0435\:0440\:0435\:0445\:043e\:0434\:0430 \:043c\:0435\:0436\:0434\:0443 \:0430\:043b\:0433\:0435\:0431\:0440\:0430\:0438\:0447\:0435\:0441\:043a\:0438\:043c \:0442\:0435\:043d\:0437\:043e\:0440\:043e\:043c \:0438 \:0433\:0435\:043e\:043c\:0435\:0442\:0440\:0438\:0447\:0435\:0441\:043a\:0438\:043c!"\
]; res = False, If[mat == {}, p = GraphPath[graphBas, i, j]; If[Length[p] > 2, graphBas = Join[graphBas, {i -> j, j -> i}]; 
          matCC[{i, j}] = Dot @@ matCC /@ Reverse[Partition[p, 2, 1]]; matCC[{j, i}] = Inverse[matCC[{i, j}]], 
         Print[
           "\:0412\:044b\:043f\:043e\:043b\:043d\:0438\:0442\:0435 \:043a\:043e\:043c\:0430\:043d\:0434\:0443 makeTrans, \:0443\:043a\:0430\:0437\:0430\:0432 \:0442\:0440\:0435\:0442\:0438\:0439 \:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442 \[Dash] \:043c\:0430\:0442\:0440\:0438\:0446\:0443 \:043f\:0435\:0440\:0435\:0445\:043e\:0434\:0430!"\
]; res = False], matCC[{i, j}] = mat; matCC[{j, i}] = Inverse[matCC[{i, j}]]; graphBas = Join[graphBas, {i -> j, j -> i}]]]; 
     graphBas = Union[graphBas]; res]; 
makeTransDif[i_Integer, j_Integer, funs_:{}] /; i != j := Module[{p, res = True, kk}, 
    If[coor[i] == {} || coor[j] == {}, 
      Print[
        "\:041e\:0448\:0438\:0431\:043a\:0430: \:043f\:043e\:043f\:044b\:0442\:043a\:0430 \:043f\:0435\:0440\:0435\:0445\:043e\:0434\:0430 \:043c\:0435\:0436\:0434\:0443 \:0430\:043b\:0433\:0435\:0431\:0440\:0430\:0438\:0447\:0435\:0441\:043a\:0438\:043c \:0442\:0435\:043d\:0437\:043e\:0440\:043e\:043c \:0438 \:0433\:0435\:043e\:043c\:0435\:0442\:0440\:0438\:0447\:0435\:0441\:043a\:0438\:043c!"\
]; res = False, If[funs == {}, p = GraphPath[graphBas, i, j]; If[Length[p] > 2, For[kk = 3, kk <= Length[p], kk++, 
          funsCC[{i, p[[kk]]}] = Simplify[funsCC[{i, p[[kk - 1]]}] /. MapThread[#1 -> #2 & , {coor[p[[kk - 1]]], 
                funsCC[{p[[kk - 1]], p[[kk]]}]}]]; matCC[{i, p[[kk]]}] = JacobianMatrix[coor[p[[kk]]], funsCC[{i, p[[kk]]}]]; 
           graphBas = Join[graphBas, {i -> p[[kk]]}]; ], 
         Print["\:0412\:044b\:043f\:043e\:043b\:043d\:0438\:0442\:0435 \:043a\:043e\:043c\:0430\:043d\:0434\:0443 makeTrans, \:0443\:043a\:0430\:0437\:0430\:0432 \:0442\:0440\:0435\:0442\:0438\:0439 \:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442 \[Dash] \:043c\:0430\:0442\:0440\:0438\:0446\:0443 \
\:043f\:0435\:0440\:0435\:0445\:043e\:0434\:0430!"]; res = False], matCC[{i, j}] = JacobianMatrix[coor[j], funs]; funsCC[{i, j}] = funs; 
        graphBas = Join[graphBas, {i -> j}]]]; graphBas = Union[graphBas]; res]; 
coorChange[T_, m_, im_] := Module[{iL, jL, n = nn[basis[curBas]], p = First[type[T]], q = Last[type[T]], aL, bL, k}, 
    iL = Table[Symbol[StringJoin["i", ToString[kk]]], {kk, p}]; jL = Table[Symbol[StringJoin["j", ToString[kk]]], {kk, q}]; 
     Array[(aL = {##1}[[Range[p]]]; bL = {##1}[[Range[p + 1, p + q]]]; 
        Sum[Underoverscript[T, jL, iL]*Sequence @@ Table[m[[jL[[kk]],bL[[kk]]]], {kk, q}]*
          Sequence @@ Table[im[[aL[[kk]],iL[[kk]]]], {kk, p}], Evaluate[Sequence @@ ({#1, n} & ) /@ Join[iL, jL]]]) & , 
      ConstantArray[nn[basis[curBas]], p + q]]]; 
coorChange[T_, m_, im_, eC_] /; crist[T]===True := Module[{iL, jL, n = nn[basis[curBas]], p = First[type[T]], q = Last[type[T]], aL, 
     bL, k}, iL = Table[Symbol[StringJoin["i", ToString[k]]], {k, p}]; jL = Table[Symbol[StringJoin["j", ToString[k]]], {k, q}]; 
     eC + Array[(aL = {##1}[[Range[p]]]; bL = {##1}[[Range[p + 1, p + q]]]; 
         Sum[Underoverscript[T, jL, iL]*Sequence @@ Table[m[[jL[[k]],bL[[k]]]], {k, q}]*
           Sequence @@ Table[im[[aL[[k]],iL[[k]]]], {k, p}], Evaluate[Sequence @@ ({#1, n} & ) /@ Join[iL, jL]]]) & , 
       ConstantArray[nn[basis[curBas]], p + q]]]; 
changeVal[T_, i_, j_] /; i != j := Module[{p, q, m, im, coorQ, res, test = True, aL, bL, n, oldCurBas = curBas, resE}, 
    n = nn[basis[i]]; {p, q} = type[T]; If[Head[matCC[{i, j}]] === List, m = matCC[{i, j}], 
      If[coor[i] == {} && coor[j] == {}, If[test = makeTrans[i, j], m = matCC[{i, j}]], If[test = makeTransDif[i, j], 
        m = matCC[{i, j}]]]]; If[test, If[Head[matCC[{j, i}]] === List, im = matCC[{j, i}], im = Inverse[m]]; 
       coorQ = Inequality[Length[coor[i]], Equal, Length[coor[j]], Greater, 0]; 
       res = If[crist[T]===True, If[ !Head[eC[{i, j}]] === List, curBas = j; eC[{i, j}] = Array[(aL = {##1}[[1]]; bL = {##1}[[{2, 3}]]; 
                Sum[D[m[[\[Alpha],bL[[1]]]], bL[[2]]]*im[[aL,\[Alpha]]], {\[Alpha], 1, n}]) & , ConstantArray[n, 3]]; curBas = i; 
            eC[{j, i}] = Array[(aL = {##1}[[1]]; bL = {##1}[[{2, 3}]]; Sum[D[im[[\[Alpha],bL[[1]]]], bL[[2]]]*m[[aL,\[Alpha]]], 
                 {\[Alpha], 1, n}]) & , ConstantArray[n, 3]]; curBas = oldCurBas; ]; coorChange[T, m, im, eC[{i, j}]], 
         coorChange[T, m, im]]; {Simplify[If[coorQ, res /. MapThread[#1 -> #2 & , {coor[i], funsCC[{i, j}]}], res]], True}, 
      {val[T], False}]]; 
changeBas[i_Integer, j_Integer] /; 1 <= i <= numBas && 1 <= j <= numBas && i != j := 
   Module[{}, If[ !Head[matCC[{i, j}]] === List, If[coor[i] == {} && coor[j] == {}, If[makeTrans[i, j], curBas = j], 
       If[makeTransDif[i, j], curBas = j]]]; If[Head[matCC[{i, j}]] === List, curBas = j]; ]; 
addAssumptions[ass__] := Module[{assump}, assump = $Assumptions && ass; 
     $Assumptions = If[Head[assump] === And, And @@ Union[List @@ assump], assump]]; 
clearAssumptions[ass__] := Module[{assump}, assump = Complement[List @@ $Assumptions, {ass}]; 
     $Assumptions = If[assump === {}, True, And @@ assump]]; 
allDefRules = {tensor, skew, symm, type, val, tensorBas, typeBas, skewBas, symmBas, crist}; 
allRules = (DownValues[#1] & ) /@ allDefRules; 
Protect[allRules, allDefRules]; 
resetTensors := (Clear[matCC, funsCC, eC, basis, coor, inBasis]; $Assumptions = True; numBas = 0; curBas = 0; graphBas = {}; 
    Scan[(DownValues[Evaluate[allDefRules[[#1]]]] = allRules[[#1]])&,Range[Length[allDefRules]]]; 
    Print[
     "\:041f\:0430\:043a\:0435\:0442 Tensors \:043f\:0435\:0440\:0435\:0437\:0430\:043f\:0443\:0449\:0435\:043d. \:0420\:0435\:0437\:0443\:043b\:044c\:0442\:0430\:0442\:044b \:0432\:044b\:0447\:0438\:0441\:043b\:0435\:043d\:0438\:0439 \:0430\:043d\:043d\:0443\:043b\:0438\:0440\:043e\:0432\:0430\:043d\:044b."\
]); 
EndPackage[]; 
