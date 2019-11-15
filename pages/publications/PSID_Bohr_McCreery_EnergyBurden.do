** Stata code for “Do Energy Burdens Contribute to Economic Poverty in the United States?  A Panel Analysis”, Jeremiah Bohr and Anna C. McCreery
version 14.2
clear all


cd "E:\PSID\Energy Burden-Social Forces"
use "1999-2017 PSID_raw.dta", clear


** Panel Identifier

egen IDpanel = group (ER30001 ER30002)


** 1999

gen year1999 = ER13008

gen sf_detached1999 = ER13022
recode sf_detached1999 (8/9=.) (2/7=0)
gen sf_attached1999 = ER13022
recode sf_attached1999 (8/9=.) (1=0) (2=1) (6=1) (3/4=0) (7=0)
gen multifamily1999 = ER13022
recode multifamily1999 (8/9=.) (1/2=0) (3=1) (4/7=0)
gen otherdu1999 = ER13022
recode otherdu1999 (8/9=.) (1/3=0) (4=1) (6=0) (7=1)

gen fu1999 = ER13009

gen ageHH1999 = ER13010
recode ageHH1999 (999 = .)

gen seniorHH1999 = ageHH1999
recode seniorHH1999 (min/64 = 0) (65/max = 1)

gen youngHH1999 = ageHH1999
recode youngHH1999 (30/max = 0) (min/29 = 1)

gen femHH1999 = ER13011
recode femHH1999 (1 = 0) (2 = 1)

gen own1999 = ER13040
recode own1999 (5/8 = 0)

gen priv_insurance1999 = ER33518
recode priv_insurance1999 (1/2 = 1) (3/97 = 0) (98/99 = .)

gen other_insurance1999 = ER33518
recode other_insurance1999 (1/5 = 0) (6/97 = 1) (98/99 = .)

gen medicaid1999 = ER33518
recode medicaid1999 (min/4 = 0) (5 = 1) (6/97 = 0) (98/99 = .)

gen medicare1999 = ER33518
recode medicare1999 (1/2 = 0) (3/4 = 1) (5/97 = 0) (98/99 = .)

gen health1999 = ER15447
recode health1999 (0 = .) (1/3 = 0) (4/5 = 1) (8/9=.)

gen college1999 = ER15952
recode college1999 (5 = 0) (9 = .)

gen married1999 = ER16423
recode married1999 (2/5 = 0) (9 = .)

gen widow1999 = ER16423
recode widow1999 (1/2 = 0) (3 = 1) (4/5 = 0) (9 = .)

gen div1999 = ER16423
recode div1999 (1/3 = 0) (4 = 1) (5 = 0) (9 = .)

gen separ1999 = ER16423
recode separ1999 (1/4 = 0) (5 = 1) (9 = .)

gen povthresh1999 = ER16427

gen fincome1999 = ER16462

gen Below100pov1999 = fincome1999 <= povthresh1999
gen Below150pov1999 = fincome1999 <= (povthresh1999 * 1.5)
gen Below200pov1999 = fincome1999 <= (povthresh1999 * 2)

gen rentheat1999 = ER13068
recode rentheat1999 (5/max = 0)

gen elect1999 = ER13086
recode elect1999 (0 = .) (9998/9999 = .)

gen heat1999 = ER13088
recode heat1999 (0 = .) (9998/9999 = .)

gen engybudg1999 = (elect1999 + heat1999) * 12   

gen engy06budg1999 = engybudg1999 / fincome1999
recode engy06budg1999 (.06/max = 1) (min/.0599 = 0) 
replace engy06budg1999 = . if rentheat1999==1

gen engy10budg1999 = engybudg1999 / fincome1999
recode engy10budg1999 (.1/max = 1) (min/.09999 = 0)
replace engy10budg1999 = . if rentheat1999==1

gen rentsub1999 = ER13070
recode rentsub1999 (5/max = 0)

gen heatsub1999 = ER13039
recode heatsub1999 (9998/9999 = .)

gen state1999 = ER13005
recode state1999 (99 = .) (0 = .)

gen interviewday1999 = ER13007 
gen interviewmonth1999 = ER13006

** 2001

gen year2001 = ER17011

gen sf_detached2001 = ER17025
recode sf_detached2001 (8/9=.) (2/7=0)
gen sf_attached2001 = ER17025
recode sf_attached2001 (8/9=.) (1=0) (2=1) (6=1) (3/4=0) (7=0)
gen multifamily2001 = ER17025
recode multifamily2001 (8/9=.) (1/2=0) (3=1) (4/7=0)
gen otherdu2001 = ER17025
recode otherdu2001 (8/9=.) (1/3=0) (4=1) (6=0) (7=1)

gen fu2001 = ER17012
gen new_fu2001 = fu2001 - fu1999
recode new_fu2001 (min / 0 = 0) (1 / max = 1) 

gen ageHH2001 = ER17013
recode ageHH2001 (999 = .)

gen seniorHH2001 = ageHH2001
recode seniorHH2001 (min/64 = 0) (65/max = 1)

gen youngHH2001 = ageHH2001
recode youngHH2001 (30/max = 0) (min/29 = 1)

gen femHH2001 = ER17014
recode femHH2001 (1 = 0) (2 = 1)

gen own2001 = ER17043
recode own2001 (5/8 = 0)

gen priv_insurance2001 = ER33618
recode priv_insurance2001 (1/2 = 1) (3/97 = 0) (98/99 = .)

gen other_insurance2001 = ER33618
recode other_insurance2001 (1/5 = 0) (6/97 = 1) (98/99 = .)

gen medicaid2001 = ER33618
recode medicaid2001 (min/4 = 0) (5 = 1) (6/97 = 0) (98/99 = .)

gen medicare2001 = ER33618
recode medicare2001 (1/2 = 0) (3/4 = 1) (5/97 = 0) (98/99 = .)

gen health2001 = ER19612
recode health2001 (0 = .) (1/3 = 0) (4/5 = 1) (8/9=.)

gen college2001 = ER20013
recode college2001 (5 = 0) (9 = .)

gen married2001 = ER20369
recode married2001 (2/5 = 0) (9 = .)

gen widow2001 = ER20369
recode widow2001 (1/2 = 0) (3 = 1) (4/5 = 0) (9 = .)

gen div2001 = ER20369
recode div2001 (1/3 = 0) (4 = 1) (5 = 0) (9 = .)

gen separ2001 = ER20369
recode separ2001 (1/4 = 0) (5 = 1) (9 = .)

gen povthresh2001 = ER20373

gen fincome2001 = ER20456

gen fincloss2001 = fincome2001 / fincome1999
recode fincloss2001 (min / 0.9 = 1) (0.90001 / max = 0)

gen Below100pov2001 = fincome2001 <= povthresh2001
gen Below150pov2001 = fincome2001 <= (povthresh2001 * 1.5)
gen Below200pov2001 = fincome2001 <= (povthresh2001 * 2)

gen rentheat2001 = ER17078
recode rentheat2001 (5/max = 0)

gen elect2001 = ER17097
recode elect2001 (0 = .) (9998/9999 = .)

gen heat2001 = ER17099
recode heat2001 (0 = .) (9998/9999 = .)

gen engybudg2001 = (elect2001 + heat2001) * 12   

gen engy06budg2001 = engybudg2001 / fincome2001
recode engy06budg2001 (.06/max = 1) (min/.0599 = 0) 
replace engy06budg2001 = . if rentheat2001==1

gen engy10budg2001 = engybudg2001 / fincome2001
recode engy10budg2001 (.1/max = 1) (min/.09999 = 0)
replace engy10budg2001 = . if rentheat2001==1

gen rentsub2001 = ER17080
recode rentsub2001 (5/max = 0)

gen heatsub2001 = ER17042
recode heatsub2001 (9998/9999 = .)

gen state2001 = ER17005
recode state2001 (99 = .) (0 = .)

gen interviewday2001 = ER17010 
gen interviewmonth2001 = ER17009



** 2003

gen year2003 = ER21014

gen sf_detached2003 = ER21024
recode sf_detached2003 (8/9=.) (2/7=0)
gen sf_attached2003 = ER21024
recode sf_attached2003 (8/9=.) (1=0) (2=1) (6=1) (3/4=0) (7=0)
gen multifamily2003 = ER21024
recode multifamily2003 (8/9=.) (1/2=0) (3=1) (4/7=0)
gen otherdu2003 = ER21024
recode otherdu2003 (8/9=.) (1/3=0) (4=1) (6=0) (7=1)

gen fu2003 = ER21016
gen new_fu2003 = fu2003 - fu2001
recode new_fu2003 (min / 0 = 0) (1 / max = 1) 

gen ageHH2003 = ER21017
recode ageHH2003 (999 = .)

gen seniorHH2003 = ageHH2003
recode seniorHH2003 (min/64 = 0) (65/max = 1)

gen youngHH2003 = ageHH2003
recode youngHH2003 (30/max = 0) (min/29 = 1)

gen femHH2003 = ER21018
recode femHH2003 (1 = 0) (2 = 1)

gen own2003 = ER21042
recode own2003 (5/8 = 0)

gen priv_insurance2003 = ER33718
recode priv_insurance2003 (1/2 = 1) (3/97 = 0) (98/99 = .)

gen other_insurance2003 = ER33718
recode other_insurance2003 (1/5 = 0) (6/97 = 1) (98/99 = .)

gen medicaid2003 = ER33718
recode medicaid2003 (min/4 = 0) (5 = 1) (6/97 = 0) (98/99 = .)

gen medicare2003 = ER33718
recode medicare2003 (1/2 = 0) (3/4 = 1) (5/97 = 0) (98/99 = .)

gen health2003 = ER23009
recode health2003 (0 = .) (1/3 = 0) (4/5 = 1) (8/9=.)

gen college2003 = ER23450
recode college2003 (5 = 0) (9 = .)

gen married2003 = ER24150
recode married2003 (2/5 = 0) (9 = .)

gen widow2003 = ER24150
recode widow2003 (1/2 = 0) (3 = 1) (4/5 = 0) (9 = .)

gen div2003 = ER24150
recode div2003 (1/3 = 0) (4 = 1) (5 = 0) (9 = .)

gen separ2003 = ER24150
recode separ2003 (1/4 = 0) (5 = 1) (9 = .)

gen povthresh2003 = ER24140

gen fincome2003 = ER24099

gen fincloss2003 = fincome2003 / fincome2001
recode fincloss2003 (min / 0.9 = 1) (0.90001 / max = 0)

gen Below100pov2003 = fincome2003 <= povthresh2003
gen Below150pov2003 = fincome2003 <= (povthresh2003 * 1.5)
gen Below200pov2003 = fincome2003 <= (povthresh2003 * 2)

gen rentheat2003 = ER21076
recode rentheat2003 (5/max = 0)

gen elect2003 = ER21086
recode elect2003 (0 = .) (9998/9999 = .)

gen heat2003 = ER21088
recode heat2003 (0 = .) (9998/9999 = .)

gen engybudg2003 = (elect2003 + heat2003) * 12   

gen engy06budg2003 = engybudg2003 / fincome2003
recode engy06budg2003 (.06/max = 1) (min/.0599 = 0) 
replace engy06budg2003 = . if rentheat2003==1

gen engy10budg2003 = engybudg2003 / fincome2003
recode engy10budg2003 (.1/max = 1) (min/.09999 = 0)
replace engy10budg2003 = . if rentheat2003==1

gen rentsub2003 = ER21078
recode rentsub2003 (5/max = 0)

gen heatsub2003 = ER21041
recode heatsub2003 (9998/9999 = .)

gen state2003 = ER21004
recode state2003 (99 = .) (0 = .)

gen interviewday2003 = ER21013 
gen interviewmonth2003 = ER21012



** 2005

gen year2005 = ER25014

gen sf_detached2005 = ER25024
recode sf_detached2005 (8/9=.) (2/7=0)
gen sf_attached2005 = ER25024
recode sf_attached2005 (8/9=.) (1=0) (2=1) (6=1) (3/4=0) (7=0)
gen multifamily2005 = ER25024
recode multifamily2005 (8/9=.) (1/2=0) (3=1) (4/7=0)
gen otherdu2005 = ER25024
recode otherdu2005 (8/9=.) (1/3=0) (4=1) (6=0) (7=1)

gen fu2005 = ER25016
gen new_fu2005 = fu2005 - fu2003
recode new_fu2005 (min / 0 = 0) (1 / max = 1) 

gen ageHH2005 = ER25017
recode ageHH2005 (999 = .)

gen seniorHH2005 = ageHH2005
recode seniorHH2005 (min/64 = 0) (65/max = 1)

gen youngHH2005 = ageHH2005
recode youngHH2005 (30/max = 0) (min/29 = 1)

gen femHH2005 = ER25018
recode femHH2005 (1 = 0) (2 = 1)

gen own2005 = ER25028
recode own2005 (5/8 = 0)

gen priv_insurance2005 = ER33819
recode priv_insurance2005 (1/2 = 1) (3/97 = 0) (98/99 = .)

gen other_insurance2005 = ER33819
recode other_insurance2005 (1/5 = 0) (6/97 = 1) (98/99 = .)

gen medicaid2005 = ER33819
recode medicaid2005 (min/4 = 0) (5 = 1) (6/97 = 0) (98/99 = .)

gen medicare2005 = ER33819
recode medicare2005 (1/2 = 0) (3/4 = 1) (5/97 = 0) (98/99 = .)

gen health2005 = ER26990
recode health2005 (0 = .) (1/3 = 0) (4/5 = 1) (8/9=.)

gen college2005 = ER27417
recode college2005 (5 = 0) (9 = .)

gen married2005 = ER28049
recode married2005 (2/5 = 0) (9 = .)

gen widow2005 = ER28049
recode widow2005 (1/2 = 0) (3 = 1) (4/5 = 0) (9 = .)

gen div2005 = ER28049
recode div2005 (1/3 = 0) (4 = 1) (5 = 0) (9 = .)

gen separ2005 = ER28049
recode separ2005 (1/4 = 0) (5 = 1) (9 = .)

gen povthresh2005 = ER28039

gen fincome2005 = ER28037

gen fincloss2005 = fincome2005 / fincome2003
recode fincloss2005 (min / 0.9 = 1) (0.90001 / max = 0)

gen Below100pov2005 = fincome2005 <= povthresh2005
gen Below150pov2005 = fincome2005 <= (povthresh2005 * 1.5)
gen Below200pov2005 = fincome2005 <= (povthresh2005 * 2)

gen rentheat2005 = ER25067
recode rentheat2005 (5/max = 0)

gen elect2005 = ER25082
recode elect2005 (0 = .) (9998/9999 = .)

gen heat2005 = ER25080
recode heat2005 (0 = .) (9998/9999 = .)

gen engybudg2005 = (elect2005 + heat2005) * 12   

gen engy06budg2005 = engybudg2005 / fincome2005
recode engy06budg2005 (.06/max = 1) (min/.0599 = 0) 
replace engy06budg2005 = . if rentheat2005==1

gen engy10budg2005 = engybudg2005 / fincome2005
recode engy10budg2005 (.1/max = 1) (min/.09999 = 0)
replace engy10budg2005 = . if rentheat2005==1

gen rentsub2005 = ER25069
recode rentsub2005 (5/max = 0)

gen heatsub2005 = ER25093
recode heatsub2005 (9998/9999 = .)

gen state2005 = ER25004
recode state2005 (99 = .) (0 = .)

gen interviewday2005 = ER25013 
gen interviewmonth2005 = ER25012



** 2007

gen year2007 = ER36014

gen sf_detached2007 = ER36024
recode sf_detached2007 (8/9=.) (2/7=0)
gen sf_attached2007 = ER36024
recode sf_attached2007 (8/9=.) (1=0) (2=1) (6=1) (3/4=0) (7=0)
gen multifamily2007 = ER36024
recode multifamily2007 (8/9=.) (1/2=0) (3=1) (4/7=0)
gen otherdu2007 = ER36024
recode otherdu2007 (8/9=.) (1/3=0) (4=1) (6=0) (7=1)

gen fu2007 = ER36016
gen new_fu2007 = fu2007 - fu2005
recode new_fu2007 (min / 0 = 0) (1 / max = 1) 

gen ageHH2007 = ER36017
recode ageHH2007 (999 = .)

gen seniorHH2007 = ageHH2007
recode seniorHH2007 (min/64 = 0) (65/max = 1)

gen youngHH2007 = ageHH2007
recode youngHH2007 (30/max = 0) (min/29 = 1)

gen femHH2007 = ER36018
recode femHH2007 (1 = 0) (2 = 1)

gen own2007 = ER36028
recode own2007 (5/8 = 0)

gen priv_insurance2007 = ER33919
recode priv_insurance2007 (1/2 = 1) (3/97 = 0) (98/99 = .)

gen other_insurance2007 = ER33919
recode other_insurance2007 (1/5 = 0) (6/97 = 1) (98/99 = .)

gen medicaid2007 = ER33919
recode medicaid2007 (min/4 = 0) (5 = 1) (6/97 = 0) (98/99 = .)

gen medicare2007 = ER33919
recode medicare2007 (1/2 = 0) (3/4 = 1) (5/97 = 0) (98/99 = .)

gen health2007 = ER38202
recode health2007 (0 = .) (1/3 = 0) (4/5 = 1) (8/9=.)

gen college2007 = ER40589
recode college2007 (5 = 0) (9 = .)

gen married2007 = ER41039
recode married2007 (2/5 = 0) (9 = .)

gen widow2007 = ER41039
recode widow2007 (1/2 = 0) (3 = 1) (4/5 = 0) (9 = .)

gen div2007 = ER41039
recode div2007 (1/3 = 0) (4 = 1) (5 = 0) (9 = .)

gen separ2007 = ER41039
recode separ2007 (1/4 = 0) (5 = 1) (9 = .)

gen povthresh2007 = ER41029

gen fincome2007 = ER41027

gen fincloss2007 = fincome2007 / fincome2005
recode fincloss2007 (min / 0.9 = 1) (0.90001 / max = 0)

gen Below100pov2007 = fincome2007 <= povthresh2007
gen Below150pov2007 = fincome2007 <= (povthresh2007 * 1.5)
gen Below200pov2007 = fincome2007 <= (povthresh2007 * 2)

gen rentheat2007 = ER36069
recode rentheat2007 (5/max = 0)

gen elect2007 = ER36085
recode elect2007 (0 = .) (9998/9999 = .)

gen heat2007 = ER36083
recode heat2007 (0 = .) (9998/9999 = .)

gen engybudg2007 = (elect2007 + heat2007) * 12   

gen engy06budg2007 = engybudg2007 / fincome2007
recode engy06budg2007 (.06/max = 1) (min/.0599 = 0) 
replace engy06budg2007 = . if rentheat2007==1

gen engy10budg2007 = engybudg2007 / fincome2007
recode engy10budg2007 (.1/max = 1) (min/.09999 = 0)
replace engy10budg2007 = . if rentheat2007==1

gen rentsub2007 = ER36071
recode rentsub2007 (5/max = 0)

gen heatsub2007 = ER36098
recode heatsub2007 (9998/9999 = .)

gen state2007 = ER36004
recode state2007 (99 = .) (0 = .)

gen interviewday2007 = ER36013 
gen interviewmonth2007 = ER36012



** 2009

gen year2009 = ER42014

gen sf_detached2009 = ER42025
recode sf_detached2009 (8/9=.) (2/7=0)
gen sf_attached2009 = ER42025
recode sf_attached2009 (8/9=.) (1=0) (2=1) (6=1) (3/4=0) (7=0)
gen multifamily2009 = ER42025
recode multifamily2009 (8/9=.) (1/2=0) (3=1) (4/7=0)
gen otherdu2009 = ER42025
recode otherdu2009 (8/9=.) (1/3=0) (4=1) (6=0) (7=1)

gen fu2009 = ER42016
gen new_fu2009 = fu2009 - fu2007
recode new_fu2009 (min / 0 = 0) (1 / max = 1) 

gen ageHH2009 = ER42017
recode ageHH2009 (999 = .)

gen seniorHH2009 = ageHH2009
recode seniorHH2009 (min/64 = 0) (65/max = 1)

gen youngHH2009 = ageHH2009
recode youngHH2009 (30/max = 0) (min/29 = 1)

gen femHH2009 = ER42018
recode femHH2009 (1 = 0) (2 = 1)

gen own2009 = ER42029
recode own2009 (5/8 = 0)

gen priv_insurance2009 = ER34022
recode priv_insurance2009 (1/2 = 1) (3/97 = 0) (98/99 = .)

gen other_insurance2009 = ER34022
recode other_insurance2009 (1/5 = 0) (6/97 = 1) (98/99 = .)

gen medicaid2009 = ER34022
recode medicaid2009 (min/4 = 0) (5 = 1) (6/97 = 0) (98/99 = .)

gen medicare2009 = ER34022
recode medicare2009 (1/2 = 0) (3/4 = 1) (5/97 = 0) (98/99 = .)

gen health2009 = ER44175
recode health2009 (0 = .) (1/3 = 0) (4/5 = 1) (8/9=.)

gen college2009 = ER46567
recode college2009 (5 = 0) (9 = .)

gen married2009 = ER46983
recode married2009 (2/5 = 0) (9 = .)

gen widow2009 = ER46983
recode widow2009 (1/2 = 0) (3 = 1) (4/5 = 0) (9 = .)

gen div2009 = ER46983
recode div2009 (1/3 = 0) (4 = 1) (5 = 0) (9 = .)

gen separ2009 = ER46983
recode separ2009 (1/4 = 0) (5 = 1) (9 = .)

gen povthresh2009 = ER46972

gen fincome2009 = ER46935

gen fincloss2009 = fincome2009 / fincome2007
recode fincloss2009 (min / 0.9 = 1) (0.90001 / max = 0)

gen Below100pov2009 = fincome2009 <= povthresh2009
gen Below150pov2009 = fincome2009 <= (povthresh2009 * 1.5)
gen Below200pov2009 = fincome2009 <= (povthresh2009 * 2)

gen rentheat2009 = ER42084
recode rentheat2009 (5/max = 0)

gen elect2009 = ER42114
recode elect2009 (0 = .) (9998/9999 = .)

gen heat2009 = ER42112
recode heat2009 (0 = .) (9998/9999 = .)

gen engybudg2009 = (elect2009 + heat2009) * 12   

gen engy06budg2009 = engybudg2009 / fincome2009
recode engy06budg2009 (.06/max = 1) (min/.0599 = 0) 
replace engy06budg2009 = . if rentheat2009==1

gen engy10budg2009 = engybudg2009 / fincome2009
recode engy10budg2009 (.1/max = 1) (min/.09999 = 0)
replace engy10budg2009 = . if rentheat2009==1

gen rentsub2009 = ER42086
recode rentsub2009 (5/max = 0)

gen heatsub2009 = ER42127
recode heatsub2009 (9998/9999 = .)

gen state2009 = ER42004
recode state2009 (99 = .) (0 = .)

gen interviewday2009 = ER42013 
gen interviewmonth2009 = ER42012



** 2011

gen year2011 = ER47314

gen sf_detached2011 = ER47325
recode sf_detached2011 (8/9=.) (2/7=0)
gen sf_attached2011 = ER47325
recode sf_attached2011 (8/9=.) (1=0) (2=1) (6=1) (3/4=0) (7=0)
gen multifamily2011 = ER47325
recode multifamily2011 (8/9=.) (1/2=0) (3=1) (4/7=0)
gen otherdu2011 = ER47325
recode otherdu2011 (8/9=.) (1/3=0) (4=1) (6=0) (7=1)

gen fu2011 = ER47316
gen new_fu2011 = fu2011 - fu2009
recode new_fu2011 (min / 0 = 0) (1 / max = 1) 

gen ageHH2011 = ER47317
recode ageHH2011 (999 = .)

gen seniorHH2011 = ageHH2011
recode seniorHH2011 (min/64 = 0) (65/max = 1)

gen youngHH2011 = ageHH2011
recode youngHH2011 (30/max = 0) (min/29 = 1)

gen femHH2011 = ER47318
recode femHH2011 (1 = 0) (2 = 1)

gen own2011 = ER47329
recode own2011 (5/8 = 0)

gen priv_insurance2011 = ER34121
recode priv_insurance2011 (1/2 = 1) (3/97 = 0) (98/99 = .)

gen other_insurance2011 = ER34121
recode other_insurance2011 (1/5 = 0) (6/97 = 1) (98/99 = .)

gen medicaid2011 = ER34121
recode medicaid2011 (min/4 = 0) (5 = 1) (6/97 = 0) (98/99 = .)

gen medicare2011 = ER34121
recode medicare2011 (1/2 = 0) (3/4 = 1) (5/97 = 0) (98/99 = .)

gen health2011 = ER49494
recode health2011 (0 = .) (1/3 = 0) (4/5 = 1) (8/9=.)

gen college2011 = ER51928
recode college2011 (5 = 0) (9 = .)

gen married2011 = ER52407
recode married2011 (2/5 = 0) (9 = .)

gen widow2011 = ER52407
recode widow2011 (1/2 = 0) (3 = 1) (4/5 = 0) (9 = .)

gen div2011 = ER52407
recode div2011 (1/3 = 0) (4 = 1) (5 = 0) (9 = .)

gen separ2011 = ER52407
recode separ2011 (1/4 = 0) (5 = 1) (9 = .)

gen povthresh2011 = ER52396

gen fincome2011 = ER52343

gen fincloss2011 = fincome2011 / fincome2009
recode fincloss2011 (min / 0.9 = 1) (0.90001 / max = 0)

gen Below100pov2011 = fincome2011 <= povthresh2011
gen Below150pov2011 = fincome2011 <= (povthresh2011 * 1.5)
gen Below200pov2011 = fincome2011 <= (povthresh2011 * 2)

gen rentheat2011 = ER47392
recode rentheat2011 (5/max = 0)

gen elect2011 = ER47417
recode elect2011 (0 = .) (9998/9999 = .)

gen heat2011 = ER47415
recode heat2011 (0 = .) (9998/9999 = .)

gen engybudg2011 = (elect2011 + heat2011) * 12   

gen engy06budg2011 = engybudg2011 / fincome2011
recode engy06budg2011 (.06/max = 1) (min/.0599 = 0) 
replace engy06budg2011 = . if rentheat2011==1

gen engy10budg2011 = engybudg2011 / fincome2011
recode engy10budg2011 (.1/max = 1) (min/.09999 = 0)
replace engy10budg2011 = . if rentheat2011==1

gen rentsub2011 = ER47394
recode rentsub2011 (5/max = 0)

gen heatsub2011 = ER47433
recode heatsub2011 (9998/9999 = .)

gen state2011 = ER47304
recode state2011 (99 = .) (0 = .)

gen interviewday2011 = ER47313 
gen interviewmonth2011 = ER47312



** 2013

gen year2013 = ER53014

gen sf_detached2013 = ER53025
recode sf_detached2013 (8/9=.) (2/7=0)
gen sf_attached2013 = ER53025
recode sf_attached2013 (8/9=.) (1=0) (2=1) (6=1) (3/4=0) (7=0)
gen multifamily2013 = ER53025
recode multifamily2013 (8/9=.) (1/2=0) (3=1) (4/7=0)
gen otherdu2013 = ER53025
recode otherdu2013 (8/9=.) (1/3=0) (4=1) (6=0) (7=1)

gen fu2013 = ER53016
gen new_fu2013 = fu2013 - fu2011
recode new_fu2013 (min / 0 = 0) (1 / max = 1) 

gen ageHH2013 = ER53017
recode ageHH2013 (999 = .)

gen seniorHH2013 = ageHH2013
recode seniorHH2013 (min/64 = 0) (65/max = 1)

gen youngHH2013 = ageHH2013
recode youngHH2013 (30/max = 0) (min/29 = 1)

gen femHH2013 = ER53018
recode femHH2013 (1 = 0) (2 = 1)

gen own2013 = ER53029
recode own2013 (5/8 = 0)

gen priv_insurance2013 = ER34236
recode priv_insurance2013 (1/2 = 1) (3/97 = 0) (98/99 = .)

gen other_insurance2013 = ER34236
recode other_insurance2013 (1/5 = 0) (6/97 = 1) (98/99 = .)

gen medicaid2013 = ER34236
recode medicaid2013 (min/4 = 0) (5 = 1) (6/97 = 0) (98/99 = .)

gen medicare2013 = ER34236
recode medicare2013 (1/2 = 0) (3/4 = 1) (5/97 = 0) (98/99 = .)

gen health2013 = ER55244
recode health2013 (0 = .) (1/3 = 0) (4/5 = 1) (8/9=.)

gen college2013 = ER57684
recode college2013 (5 = 0) (9 = .)

gen married2013 = ER58225
recode married2013 (2/5 = 0) (9 = .)

gen widow2013 = ER58225
recode widow2013 (1/2 = 0) (3 = 1) (4/5 = 0) (9 = .)

gen div2013 = ER58225
recode div2013 (1/3 = 0) (4 = 1) (5 = 0) (9 = .)

gen separ2013 = ER58225
recode separ2013 (1/4 = 0) (5 = 1) (9 = .)

gen povthresh2013 = ER58213

gen fincome2013 = ER58152

gen fincloss2013 = fincome2013 / fincome2011
recode fincloss2013 (min / 0.9 = 1) (0.90001 / max = 0)

gen Below100pov2013 = fincome2013 <= povthresh2013
gen Below150pov2013 = fincome2013 <= (povthresh2013 * 1.5)
gen Below200pov2013 = fincome2013 <= (povthresh2013 * 2)

gen rentheat2013 = ER53092
recode rentheat2013 (5/max = 0)

gen elect2013 = ER53117
recode elect2013 (0 = .) (9998/9999 = .)

gen heat2013 = ER53115
recode heat2013 (0 = .) (9998/9999 = .)

gen engybudg2013 = (elect2013 + heat2013) * 12   

gen engy06budg2013 = engybudg2013 / fincome2013
recode engy06budg2013 (.06/max = 1) (min/.0599 = 0) 
replace engy06budg2013 = . if rentheat2013==1

gen engy10budg2013 = engybudg2013 / fincome2013
recode engy10budg2013 (.1/max = 1) (min/.09999 = 0)
replace engy10budg2013 = . if rentheat2013==1

gen rentsub2013 = ER53094
recode rentsub2013 (5/max = 0)

gen heatsub2013 = ER53133
recode heatsub2013 (9998/9999 = .)

gen state2013 = ER53004
recode state2013 (99 = .) (0 = .)

gen interviewday2013 = ER53013 
gen interviewmonth2013 = ER53012



** 2015

gen year2015 = ER60014

gen sf_detached2015 = ER60026
recode sf_detached2015 (8/9=.) (2/7=0)
gen sf_attached2015 = ER60026
recode sf_attached2015 (8/9=.) (1=0) (2=1) (6=1) (3/4=0) (7=0)
gen multifamily2015 = ER60026
recode multifamily2015 (8/9=.) (1/2=0) (3=1) (4/7=0)
gen otherdu2015 = ER60026
recode otherdu2015 (8/9=.) (1/3=0) (4=1) (6=0) (7=1)

gen fu2015 = ER60016
gen new_fu2015 = fu2015 - fu2013
recode new_fu2015 (min / 0 = 0) (1 / max = 1) 

gen ageHH2015 = ER60017
recode ageHH2015 (999 = .)

gen seniorHH2015 = ageHH2015
recode seniorHH2015 (min/64 = 0) (65/max = 1)

gen youngHH2015 = ageHH2015
recode youngHH2015 (30/max = 0) (min/29 = 1)

gen femHH2015 = ER60018
recode femHH2015 (1 = 0) (2 = 1)

gen own2015 = ER60030
recode own2015 (5/8 = 0)

gen priv_insurance2015 = ER34386
recode priv_insurance2015 (1/2 = 1) (3/97 = 0) (98/99 = .)

gen other_insurance2015 = ER34386
recode other_insurance2015 (1/5 = 0) (6/97 = 1) (98/99 = .)

gen medicaid2015 = ER34386
recode medicaid2015 (min/4 = 0) (5 = 1) (6/97 = 0) (98/99 = .)

gen medicare2015 = ER34386
recode medicare2015 (1/2 = 0) (3/4 = 1) (5/97 = 0) (98/99 = .)

gen health2015 = ER62366
recode health2015 (0 = .) (1/3 = 0) (4/5 = 1) (8/9=.)

gen college2015 = ER64836
recode college2015 (5 = 0) (9 = .)

gen married2015 = ER65461
recode married2015 (2/5 = 0) (9 = .)

gen widow2015 = ER65461
recode widow2015 (1/2 = 0) (3 = 1) (4/5 = 0) (9 = .)

gen div2015 = ER65461
recode div2015 (1/3 = 0) (4 = 1) (5 = 0) (9 = .)

gen separ2015 = ER65461
recode separ2015 (1/4 = 0) (5 = 1) (9 = .)

gen povthresh2015 = ER65449

gen fincome2015 = ER65349

gen fincloss2015 = fincome2015 / fincome2013
recode fincloss2015 (min / 0.9 = 1) (0.90001 / max = 0)

gen Below100pov2015 = fincome2015 <= povthresh2015
gen Below150pov2015 = fincome2015 <= (povthresh2015 * 1.5)
gen Below200pov2015 = fincome2015 <= (povthresh2015 * 2)

gen rentheat2015 = ER60093
recode rentheat2015 (5/max = 0)

gen elect2015 = ER60112
recode elect2015 (0 = .) (9998/9999 = .)

gen heat2015 = ER60110
recode heat2015 (0 = .) (9998/9999 = .)

gen engybudg2015 = (elect2015 + heat2015) * 12   

gen engy06budg2015 = engybudg2015 / fincome2015
recode engy06budg2015 (.06/max = 1) (min/.0599 = 0) 
replace engy06budg2015 = . if rentheat2015==1

gen engy10budg2015 = engybudg2015 / fincome2015
recode engy10budg2015 (.1/max = 1) (min/.09999 = 0)
replace engy10budg2015 = . if rentheat2015==1

gen rentsub2015 = ER60095
recode rentsub2015 (5/max = 0)

gen heatsub2015 = ER60128
recode heatsub2015 (9998/9999 = .)

gen state2015 = ER60004
recode state2015 (99 = .) (0 = .)

gen interviewday2015 = ER60013 
gen interviewmonth2015 = ER60012



** 2017

gen year2017 = ER66014

gen sf_detached2017 = ER66026
recode sf_detached2017 (8/9=.) (2/7=0)
gen sf_attached2017 = ER66026
recode sf_attached2017 (8/9=.) (1=0) (2=1) (6=1) (3/4=0) (7=0)
gen multifamily2017 = ER66026
recode multifamily2017 (8/9=.) (1/2=0) (3=1) (4/7=0)
gen otherdu2017 = ER66026
recode otherdu2017 (8/9=.) (1/3=0) (4=1) (6=0) (7=1)

gen fu2017 = ER66016
gen new_fu2017 = fu2017 - fu2015
recode new_fu2017 (min / 0 = 0) (1 / max = 1) 

gen ageHH2017 = ER66017
recode ageHH2017 (999 = .)

gen seniorHH2017 = ageHH2017
recode seniorHH2017 (min/64 = 0) (65/max = 1)

gen youngHH2017 = ageHH2017
recode youngHH2017 (30/max = 0) (min/29 = 1)

gen femHH2017 = ER66018
recode femHH2017 (1 = 0) (2 = 1)

gen own2017 = ER66030
recode own2017 (5/8 = 0)

gen priv_insurance2017 = ER34595
recode priv_insurance2017 (1/2 = 1) (3/97 = 0) (98/99 = .)

gen other_insurance2017 = ER34595
recode other_insurance2017 (1/5 = 0) (6/97 = 1) (98/99 = .)

gen medicaid2017 = ER34595
recode medicaid2017 (min/4 = 0) (5 = 1) (6/97 = 0) (98/99 = .)

gen medicare2017 = ER34595
recode medicare2017 (1/2 = 0) (3/4 = 1) (5/97 = 0) (98/99 = .)

gen health2017 = ER68420
recode health2017 (0 = .) (1/3 = 0) (4/5 = 1) (8/9=.)

gen college2017 = ER70908
recode college2017 (5 = 0) (9 = .)

gen married2017 = ER71540
recode married2017 (2/5 = 0) (9 = .)

gen widow2017 = ER71540
recode widow2017 (1/2 = 0) (3 = 1) (4/5 = 0) (9 = .)

gen div2017 = ER71540
recode div2017 (1/3 = 0) (4 = 1) (5 = 0) (9 = .)

gen separ2017 = ER71540
recode separ2017 (1/4 = 0) (5 = 1) (9 = .)

gen povthresh2017 = ER71528

gen fincome2017 = ER71426

gen fincloss2017 = fincome2017 / fincome2015
recode fincloss2017 (min / 0.9 = 1) (0.90001 / max = 0)

gen Below100pov2017 = fincome2017 <= povthresh2017
gen Below150pov2017 = fincome2017 <= (povthresh2017 * 1.5)
gen Below200pov2017 = fincome2017 <= (povthresh2017 * 2)

gen rentheat2017 = ER66095
recode rentheat2017 (5/max = 0)

gen elect2017 = ER66113
recode elect2017 (0 = .) (9998/9999 = .)

gen heat2017 = ER66111
recode heat2017 (0 = .) (9998/9999 = .)

gen engybudg2017 = (elect2017 + heat2017) * 12   

gen engy06budg2017 = engybudg2017 / fincome2017
recode engy06budg2017 (.06/max = 1) (min/.0599 = 0) 
replace engy06budg2017 = . if rentheat2017==1

gen engy10budg2017 = engybudg2017 / fincome2017
recode engy10budg2017 (.1/max = 1) (min/.09999 = 0)
replace engy10budg2017 = . if rentheat2017==1

gen rentsub2017 = ER66097
recode rentsub2017 (5/max = 0)

gen heatsub2017 = ER66129
recode heatsub2017 (9998/9999 = .)

gen state2017 = ER66004
recode state2017 (99 = .) (0 = .)

gen interviewday2017 = ER66013 
gen interviewmonth2017 = ER66012




*****************************************************************************************
*****************************************************************************************

** RESHAPE TO LONG FORMAT

reshape long fu new_fu ageHH seniorHH youngHH femHH own priv_insurance other_insurance medicaid medicare health college married widow div separ povthresh fincome fincloss Below100pov Below150pov Below200pov rentheat elect heat engybudg engy06budg engy10budg sf_detached sf_attached multifamily otherdu state rentsub heatsub interviewday interviewmonth, i(ER30001 ER30002) j(year)

xtset IDpanel year



*****************************************************************************************
** MODELS IN TABLES 2 AND 3
*****************************************************************************************

** MODEL 1

clogit Below100pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==1, group(IDpanel) vce(robust)

esttab, cell("b(fmt(3)) _star se")

clogit Below100pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==1, group(IDpanel) vce(robust) or

corr Below100pov L2.engy10budg fincloss health priv_insurance other_insurance medicaid medicare new_fu married div separ widow own femHH youngHH seniorHH college year if L2.Below100pov==1 & e(sample)==1, means


** MODEL 2

clogit Below150pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==1, group(IDpanel) vce(robust)

esttab, cell("b(fmt(3)) _star se")

clogit Below150pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==1, group(IDpanel) vce(robust) or

corr Below150pov L2.engy10budg fincloss health priv_insurance other_insurance medicaid medicare new_fu married div separ widow own femHH youngHH seniorHH college year if L2.Below150pov==1 & e(sample)==1, means


** MODEL 3

clogit Below200pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==1, group(IDpanel) vce(robust)

esttab, cell("b(fmt(3)) _star se")

clogit Below200pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==1, group(IDpanel) vce(robust) or

corr Below200pov L2.engy10budg fincloss health priv_insurance other_insurance medicaid medicare new_fu married div separ widow own femHH youngHH seniorHH college year if L2.Below200pov==1 & e(sample)==1, means


** MODEL 4

clogit Below100pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==0, group(IDpanel) vce(robust)

esttab, cell("b(fmt(3)) _star se")

clogit Below100pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==0, group(IDpanel) vce(robust) or

corr Below100pov L2.engy10budg fincloss health priv_insurance other_insurance medicaid medicare new_fu married div separ widow own femHH youngHH seniorHH college year if L2.Below200pov==0 & e(sample)==1, means


** MODEL 5

clogit Below150pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==0, group(IDpanel) vce(robust)

esttab, cell("b(fmt(3)) _star se")

clogit Below150pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==0, group(IDpanel) vce(robust) or

corr Below150pov L2.engy10budg fincloss health priv_insurance other_insurance medicaid medicare new_fu married div separ widow own femHH youngHH seniorHH college year if L2.Below150pov==0 & e(sample)==1, means


** MODEL 6

clogit Below200pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==0, group(IDpanel) vce(robust)

esttab, cell("b(fmt(3)) _star se")

clogit Below200pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==0, group(IDpanel) vce(robust) or

corr Below200pov L2.engy10budg fincloss health priv_insurance other_insurance medicaid medicare new_fu married div separ widow own femHH youngHH seniorHH college year if L2.Below200pov==0 & e(sample)==1, means


*****************************************************************************************
** SENSITIVITY CHECKS
*****************************************************************************************

** PREDICTING CONTINUOUS MEASURE OF ENERGY BURDEN
gen engybudg_cont = engybudg / fincome
**Model 1
clogit Below100pov L2.engybudg_cont fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==1, group(IDpanel) vce(robust)
**Model 2
clogit Below150pov L2.engybudg_cont fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==1, group(IDpanel) vce(robust)
**Model 3
clogit Below200pov L2.engybudg_cont fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==1, group(IDpanel) vce(robust)
**Model 4
clogit Below100pov L2.engybudg_cont fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==0, group(IDpanel) vce(robust)
**Model 5
clogit Below150pov L2.engybudg_cont fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==0, group(IDpanel) vce(robust)
**Model 6
clogit Below200pov L2.engybudg_cont fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==0, group(IDpanel) vce(robust)


** PREDICTING 6% ENERGY BURDEN
**Model 1
clogit Below100pov L2.engy06budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==1, group(IDpanel) vce(robust)
**Model 2
clogit Below150pov L2.engy06budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==1, group(IDpanel) vce(robust)
**Model 3
clogit Below200pov L2.engy06budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==1, group(IDpanel) vce(robust)
**Model 4
clogit Below100pov L2.engy06budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==0, group(IDpanel) vce(robust)
**Model 5
clogit Below150pov L2.engy06budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==0, group(IDpanel) vce(robust)
**Model 6
clogit Below200pov L2.engy06budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==0, group(IDpanel) vce(robust)


** INCLUSION OF STATE CONTROLS
**Model 1: limited to 50 iterations.  Initial tests of the model did not achieve convergence in over 300 iterations.
clogit Below100pov i.state L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==1, group(IDpanel) vce(robust) iterate(50)
**Model 2
clogit Below150pov i.state L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==1, group(IDpanel) vce(robust)
**Model 3
clogit Below200pov i.state L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==1, group(IDpanel) vce(robust)
**Model 4
clogit Below100pov i.state L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==0, group(IDpanel) vce(robust)
**Model 5
clogit Below150pov i.state L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==0, group(IDpanel) vce(robust)
**Model 6
clogit Below200pov i.state L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==0, group(IDpanel) vce(robust)
**Model 1, excluding Alaska and Hawaii: limited to 50 iterations.  Initial tests of the model did not achieve convergence in over 300 iterations.
clogit Below100pov i.state L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==1 & state!=2 & state!=15, group(IDpanel) vce(robust) iterate(50)
**Model 2, excluding Alaska and Hawaii
clogit Below150pov i.state L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==1 & state!=2 & state!=15, group(IDpanel) vce(robust)
**Model 3, excluding Alaska and Hawaii
clogit Below200pov i.state L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==1 & state!=2 & state!=15, group(IDpanel) vce(robust)
**Model 4, excluding Alaska and Hawaii
clogit Below100pov i.state L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==0 & state!=2 & state!=15, group(IDpanel) vce(robust)
**Model 5, excluding Alaska and Hawaii
clogit Below150pov i.state L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==0 & state!=2 & state!=15, group(IDpanel) vce(robust)
**Model 6, excluding Alaska and Hawaii
clogit Below200pov i.state L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==0 & state!=2 & state!=15, group(IDpanel) vce(robust)


** CONTROL FOR HOUSING TYPE
**Model 1, both concurrent and lagged housing type
clogit Below100pov L2.engy10budg sf_attached l2.sf_attached multifamily l2.multifamily otherdu l2.otherdu fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==1, group(IDpanel) vce(robust)
**Model 2, both concurrent and lagged housing type
clogit Below150pov L2.engy10budg sf_attached l2.sf_attached multifamily l2.multifamily otherdu l2.otherdu fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==1, group(IDpanel) vce(robust)
**Model 3, both concurrent and lagged housing type
clogit Below200pov L2.engy10budg sf_attached l2.sf_attached multifamily l2.multifamily otherdu l2.otherdu fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==1, group(IDpanel) vce(robust)
**Model 4, both concurrent and lagged housing type
clogit Below100pov L2.engy10budg sf_attached l2.sf_attached multifamily l2.multifamily otherdu l2.otherdu fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==0, group(IDpanel) vce(robust)
**Model 5, both concurrent and lagged housing type
clogit Below150pov L2.engy10budg sf_attached l2.sf_attached multifamily l2.multifamily otherdu l2.otherdu fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==0, group(IDpanel) vce(robust)
**Model 6, both concurrent and lagged housing type
clogit Below200pov L2.engy10budg sf_attached l2.sf_attached multifamily l2.multifamily otherdu l2.otherdu fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==0, group(IDpanel) vce(robust)
**Model 1, just lagged housing type
clogit Below100pov L2.engy10budg l2.sf_attached l2.multifamily l2.otherdu fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==1, group(IDpanel) vce(robust)
**Model 2, just lagged housing type
clogit Below150pov L2.engy10budg l2.sf_attached l2.multifamily l2.otherdu fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==1, group(IDpanel) vce(robust)
**Model 3, just lagged housing type
clogit Below200pov L2.engy10budg l2.sf_attached l2.multifamily l2.otherdu fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==1, group(IDpanel) vce(robust)
**Model 4, just lagged housing type
clogit Below100pov L2.engy10budg l2.sf_attached l2.multifamily l2.otherdu fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==0, group(IDpanel) vce(robust)
**Model 5, just lagged housing type
clogit Below150pov L2.engy10budg l2.sf_attached l2.multifamily l2.otherdu fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==0, group(IDpanel) vce(robust)
**Model 6, just lagged housing type
clogit Below200pov L2.engy10budg l2.sf_attached l2.multifamily l2.otherdu fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==0, group(IDpanel) vce(robust)


** CONTROL FOR RENTAL/HOUSING COST SUBSIDIES
**Model 1
clogit Below100pov rentsub L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==1, group(IDpanel) vce(robust)
**Model 2
clogit Below150pov rentsub L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==1, group(IDpanel) vce(robust)
**Model 3
clogit Below200pov rentsub L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==1, group(IDpanel) vce(robust)
**Model 4
clogit Below100pov rentsub L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==0, group(IDpanel) vce(robust)
**Model 5
clogit Below150pov rentsub L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==0, group(IDpanel) vce(robust)
**Model 6
clogit Below200pov rentsub L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==0, group(IDpanel) vce(robust)


** CONTROL FOR HEATING SUBSIDIIES
**Model 1
clogit Below100pov heatsub L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==1, group(IDpanel) vce(robust)
**Model 2
clogit Below150pov heatsub L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==1, group(IDpanel) vce(robust)
**Model 3
clogit Below200pov heatsub L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==1, group(IDpanel) vce(robust)
**Model 4
clogit Below100pov heatsub L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==0, group(IDpanel) vce(robust)
**Model 5
clogit Below150pov heatsub L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==0, group(IDpanel) vce(robust)
**Model 6
clogit Below200pov heatsub L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==0, group(IDpanel) vce(robust)


** SUBSET MODEL: PREDICTING 100% POV IF FAMILY INCOME<200% POV
**Model 1
clogit Below100pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==1 & Below200pov==1, group(IDpanel) vce(robust)
**Model 4
clogit Below100pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==0 & Below200pov==1, group(IDpanel) vce(robust)


** RESTRICTING TO 1999-2009, BEFORE HEATING QUESTION CHANGED FROM "GAS OR OTHER TYPES OF HEATING FUEL" TO "GAS OR OTHER TYPES OF FUEL"
**Model 1
clogit Below100pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==1 & year<=2009, group(IDpanel) vce(robust)
**Model 2
clogit Below150pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==1 & year<=2009, group(IDpanel) vce(robust)
**Model 3
clogit Below200pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==1 & year<=2009, group(IDpanel) vce(robust)
**Model 4
clogit Below100pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==0 & year<=2009, group(IDpanel) vce(robust)
**Model 5
clogit Below150pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==0 & year<=2009, group(IDpanel) vce(robust)
**Model 6
clogit Below200pov L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==0 & year<=2009, group(IDpanel) vce(robust)


** CONTROL FOR SEASON OF INTERVIEW
gen season = interviewmonth
recode season (12=1) (1/2=1) (3/5=2) (6/8=3) (9/11=4)
**Model 1
clogit Below100pov i.season L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==1, group(IDpanel) vce(robust)
**Model 2
clogit Below150pov i.season L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==1, group(IDpanel) vce(robust)
**Model 3
clogit Below200pov i.season L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==1, group(IDpanel) vce(robust)
**Model 4
clogit Below100pov i.season L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below100pov==0, group(IDpanel) vce(robust)
**Model 5
clogit Below150pov i.season L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below150pov==0, group(IDpanel) vce(robust)
**Model 6
clogit Below200pov i.season L2.engy10budg fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year if L2.Below200pov==0, group(IDpanel) vce(robust)



*****************************************************************************************
*****************************************************************************************

** BINOMIAL LOGISTIC REGRESSIONS
logit engy10budg Below100pov
logit engy10budg Below150pov
logit engy10budg Below200pov
logit Below100pov engy10budg
logit Below150pov engy10budg
logit Below200pov engy10budg
**Limited to 50 iterations because the model doesn't converge
logit engy10budg fincome, iterate(50)   


** REVERSE RELATIONSHIP
clogit engy10budg L2.Below100pov fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year, group(IDpanel) vce(robust)
clogit engy10budg L2.Below150pov fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year, group(IDpanel) vce(robust)
clogit engy10budg L2.Below200pov fincloss L2.health health L2.priv_insurance priv_insurance L2.other_insurance other_insurance L2.medicaid medicaid L2.medicare medicare new_fu married div separ widow L2.own own femHH youngHH seniorHH college i.year, group(IDpanel) vce(robust)

** RELATIONSHIP BETWEEN SEASON OF INTERVIEW AND ENERGY COST SURVEY RESPONSES
sum heat if season==2
sum heat if season==3
anova heat season
anova elect season
anova engybudg season

*****************************************************************************************
*****************************************************************************************

** ADD VARIABLE LABELS
label variable engybudg "Total annual energy costs"
label variable engy06budg "Dummy=1 if energy costs>6% of income"
label variable engy10budg "Dummy=1 if energy costs>10% of income"
label variable rentheat "Whether heat is included in rent"
label variable elect "Monthly electricity expenses"
label variable heat "Monthly gas or heating fuel expenses"
label variable povthresh "PSID poverty threshold"
label variable fincome "Family income"
label variable fincloss "Family income loss of 10% since previous survey wave"
label variable health "Dummy=1 for Fair or Poor health"
label variable priv_insurance "Has private insurance"
label variable medicaid "Has Medicaid insurance"
label variable medicare "Has Medicare or MediGap insurance"
label variable other_insurance "Has other insurance (e.g. veterans)"
label variable fu "# of people in family unit"
label variable new_fu "New family member since previous survey wave"
label variable married "Married"
label variable div "Divorced"
label variable separ "Separated"
label variable widow "Widowed"
label variable own "Owns their home"
label variable ageHH "Age of head of household"
label variable femHH "Female head of household"
label variable youngHH "Young head of household (under 30)"
label variable seniorHH "Senior head of household (65 or older)"
label variable college "College graduate"
label variable Below100pov "Family income below 100% of PSID poverty threshold"
label variable Below150pov "Family income below 150% of PSID poverty threshold"
label variable Below200pov "Family income below 200% of PSID poverty threshold"
label variable sf_detached "Single-family detached home"
label variable sf_attached "Single-family attached home (2-unit, duplex, or rowhouse)"
label variable multifamily "Apartment or housing project home" 
label variable otherdu "Mobile home or other dwelling unit"
label variable rentsub "Rental subsidy"
label variable state "State FIPS code"
label variable season "Season of interview (Dec-Feb=winter=1)"

compress 
save "1999-2017 PSID_SF_long_cleaned up.dta", replace
