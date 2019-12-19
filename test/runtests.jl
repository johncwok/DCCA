using DCCA
using Test

#data used in Paulo Ferreira's paper "DCCA and DMCA correlations of cryptocurrency markets".
btc = Float64.([685060,661330,690350,712850,708080,725520,720800,720800,723570,735580,752440,751090,753080,739920,720440,729180,729820,739640,754660,774270,742670,751060,716280,711560,692470,732410,727250,762790,809930,814570,820840,850980,849730,847630,866120,878310,881260,873690,903680,880450,877820,922350,933890,931080,939640,919830,930060,923010,915260,915790,941130,920720,952960,923060,865830,742270,747700,803140,820820,822340,795730,794850,807330,800040,816720,835330,828150,830440,826780,856230,856670,818290,819860,788190,812730,814810,822690,836410,830270,828430,804910,820850,818490,806380,843240,851390,970220,1003160,999300,1017270,1025050,1016470,1019570,1025550,1031150,1033730,1034210,1041510,1016250,1010540,1030900,1040280,1046110,1030930,1056690,1056820,1061230,1034880,972930,959440,958540,949100,972940,1018480,1037180,1013630,1013100,1038870,1010500,1014150,1075260,1091070,1031270,1021810,1033560,1030340,1004940,1089290,1139420,1151720,1131450,1208980,1219160,1201390,1148090,1181680,1093460,1081570,1052010,1038000,1008200,958070,958090,972780,949210,983100,994530,980430,988870,1041250,1071440,1082670,1057150,1065140,972320,942480,1084590,1020010,1136490,1176210,1134230,1211060,1254150,1225260,1141590,1126800,1097020,1116310,1190080,1083590,1061660,1081860,1190650,1240910,1128780,1306380,1180990,1104640,1089710,1072170,1017930,951700,925540,908060,931880,896250,881250,865610,821900,813310,788800,798780,763500,790140,798520,778490,777910,768550,812480,872860,854570,855830,827190,864780,871630,876010,863020,802740,797010,785210,763570,793030,796530,815720,726260,735950,787180,816460,799460,780600,698480,719030,638600,619150,599030,584950,574510,577490,583090,576680,549380,538420,532080,523500,530230,526590,529830,520910,541560,551160,534670,524350,529020,524100,526470,520830,518090,503230,513480,505180,505420,502260,530780,515840,524520,517360,504620,501020,490240,496870,485930,414510,410230,411180,410220,402560,404170,394280,393700,399470,400250,399040,398220,404120,401700,399020,398150,400640,392430,387900,386510,388600,387030,391520,394430,386590,387510,386300,385720,371590,380950,382310,382190,381660,381460,381030,383370,375520,412040,396520,393660,397240,391430,389600,366420,361680,360470,359260,361150,363200,363180,367900,366140,366170,339770,340430,346840,346280,345910,350250,346790,343720,346000,341480,344280,355560,357090,357200,357430,356150,358010,353670,354230,367780,360560,362640,358800,357130,363810,349020,359720,361650,360370,397800,397100,398590,400410,378540,380270,378010,387380,380940,370940,381500,370680,386160,358690,379370,376250,402610,394440,396440,385090,407600,368710,366800,352610,324790,322870,324780,331530,346610,340770,346050,356750,343040,342220,350860,377160,395850,389780,416040,419620,403970,429650,426540,386650,383700,406220,392040,439800,435600,463870,452460,488380,565830,562180,563620,571890,584240,642920,643500,644610,642710,641200,647400,656530,650280,645970,647820,638620,642470,640050,636590,632570,633500,648610,649420,651000,650700,653070,652870,655580,658300,657220,651200,657410,668660,670530,669980,632680,632170,629130,623910,661800,665080,666960,661100,659630,663910,658420,650780,654990,660820,663520,660390,663600,668920,646810,644510,658410,670410,672960,676670,648920,639040,634200,625190,650020,651900,648370,648290,633800,629390,632100,623850,618430,639090,651400,670680,737750,726420,729390,718960,703380,699370,702910,707460,689760,671270,673480,668040,652120,635960,648220,626810,648150,637910,658170,630670,625690,619020,625530,631300,623160,615230,653880,628360,672490,694360,702710,701430,741900,753560,760640,772940,817710,821560,823410,818740,793700,817370,840700,772300,741230,740870,733940,747750,738360,732200,672990,636290,625480,623020,625060,638910,630720,666710,671480,676550,661770,654650,659840,651350,661950,636680,639890,621330,588350,615490,608210,625660,615460,616730,605570,672800,676540,675240,671980,646030,650580,641030,664710,631230,655820,688590,677510,751580,762210,769780,766100,763150,750430,772930,764660,753080,750260,740010,746770,711930,736670,736130,747770,759290,751230,800600,840330,852900,824510,824570,806300,834440,847700,867410,869350,845950,840830,902570,931910,919640,943160,965640,985350,970860,974970,924320,907490,924510,941510,935240,894090,928700,887310,964530,895280,880670,892310,886700,829080,817840,790860,807000,836360,800440,788740,792660,696210,685480,678190,703050,690570,662430,678200,680890,742420,706840,682520,693820,685370,712920,795490,780170,814350,847320,854740,891680,872620,890590,891260,861680,820120,787490,828920,826440,821060,915490,913740,952960,876200,921700,930000,990290,1067510,1133060,1141650,1140230,1082770,1090450,1033390,1059440,1028510,958520,970430,1017040,984170,1047300,1123870,1116940,1039880,1107350,1017870,1003730,947630,853920,890350,808190,855960,869980,816420,759470,770120,693850,822220,924110,889320,918110,1026540,1016600,1124480,1179510,1146750,1111810,1120300,1145230,1090320,1086480,1159490,1285890,1158020,1124540,1119230,1136200,1369750,1369520,1429220,1388670,1353540,1504300,1477850,1497620,1622820,1717230,1695480,1518010,1515660,1475410,1344490,1385040,1253150,1439260,1439870,1541660,1575660,1383350,1379000,1439650,1366500,1563210,1646200,1752370,1897230,1906570,1934550,1760480,1646790,1628680,1708390,1673250,1505960,1484340,1604760,1685030,1374960,1166710,1162390,1124620,1091270,1086150,994680,983790,990600,973320,931840,875470,820080,801340,823450,810000,824470,804260,778090,770000,785370,728320,659710,652250,587810,633990,656580,712960,744440,710280,695920,738950,736380,715210,702480,673780,645120,612430,614750,572660,576460,588760,573400,551310,590360,598290,600660,599310,569860,557580,559860,575930,568810,582470,563730,543260,482420,476340,477750,461170,443580,437190,432140,421870,431420,440130,440310,436060,417280,419560,421220,389270,393280,366750,378800,360080,361730,388220,390800,410030,368960,369890,371380,324310,387030,415890,421790,424590,433510,432650,463560,461870,440910,426750,461290,457380,492190,473510,458300,459730,439030,434580,435230,436440,431840,414110,408970,400510,406660,415050,410540,427890,438740,416170,432790,406260,387160,365440,342570,334880,342940,340190,323200,326280,287850,281000,272050,274700,288330,276650,273350,280680,269190,255920,258260,276340,275660,283650,267510,286600,228260,232020,223340,191410,197510,223420,236240,240310,232430,234400,251140,256490,251390,261420,262790,261730,257250,253650,242460,248060,255840,257770,258380,244610,254160,259010,271040,272280,267760,275440,261680,253960,265510,250860,244250,246730,271300,265680,297340,290030,281140,279880,269150,287050,270500,252410,254540,249260,241260,230330,219260,227820,218900,205240,224490,230720,244530,227260,212440,204420,204020,196200,188100,180130,172930,170890,177260,176370,168640,181930,175230,169750,166450,155440,154530,150780,151680,148560,144590,141580,135190,133630,132960,133290,128660,126430,124820,124910,124090,124960,123810,121520,120610,119400,117680,117700,117730,117620,121250,122070,120670,120430,118080,119050,118870,112990,114180,114760,109740,108610,107910,103790,104190,104440,104510,9694,9663,9397,103500,104470,112130,104750,102260,9714,107170,117290,125340,124310,123820,122510,117920,111240,119130,114700,123270,127700,127120,126430,128330,125550,122270,118930,118880,117160,114910,117650,117190,112050,111900,107760,104890,105230,104940,103190,100820,100830,9954,9965,100830,9976,979,105550,104960,102470,101610,103180,101300,100400,9824,9655,9207,9145,9185,918,9156,8944,8938,9215,9188,9198,8929,8952,872,8997,8273,8212,8196,8248,8101,7854,9044,8998,9009,8889,8862,9893,113540,103330,101700,9954,9634,959,9711,9722,9258,8984,8911,8911,9172,8602,8292,7991,7898,789,7872,782,7752,7765,7787,7785,7679,774,7705,7685,7656,7582,7543,7664,7642,7709,7526,7425,7326,7333,7294,7341,7404,7353,7411,7493,7362,7285,7479,747,7375,7403,7111,7046,702,7043,715,7146,7214,7109,7054,7099,7021,7021,6849,7335,7268,6987,6973,715,6862,6823,6747,651,6505,653,6555,6305,6283,6291,6353,6374,6401,637,6379,6356,636,6405,6173,6158,6177,616,611,6118,609,6116,6107,6134,6081,6047,6047,6055,6065,6015,6026,6029,5956,5972,6092,6098,6107,6071,6078,6081,6095,6086,608,6056,6245,6232,6256,6132,6104,6058,6095,5988,5753,572,5739,5773,5742,575,5703,5794,578,5797,5836,5875,5807,5826,5746,5734,5723,5802,567,5691,5846,5871,5878,5909,5853,5892,5908,5865,5747,5762,5664,5134,607,6219,6547,6554,6541,6545,6544,654,6593,6552,6511,6646,6644,6711,6704,6763,6607,6642,6573,6612,6706,6467,6471,6518,6628,6353,6727,6637,6752,6616,6981,6746,670,6365,6449,6447,6254,6635,6569,6208,5906,6674,734,761,7538,7439,7612,6908,6851,7001,6665,5916,5779,5747,5805,5756,5836,5749,572,567,5371,5374,5289,5323,516,5242,474,4533,4498,4461,4437,4396,4436,4421,4427,4542,4533,4549,4581,4564,4554,4544,4525,4494,4604,4579,4585,4596,4481,4458,4503,4442,4522,4485,455,4485,447,466,4617,4576,4501,4453,4493,4412,4349,4277,4263,430,4287,424,4235,4247,4214,4203,418,4177,4201,4213,4221,4193,4191,4185,4156,4157,4124,415,4222,4246,4165,4157,4147,417,4162,4111,4115,4087,4082,4182,4159,4151,4143,4124,4104,4191,4158,4128,4119,4149,406,399,4095,4196,4254,434,4362,4325,4313,4273,4235,4227,4199,4378,4379,4401,420,4214,4171,4064,4011,4055,3901,384,3795,3819,3753,3726,3779,3767,3865,3906,368,3739,3722,3698,3778,3803,3797,395,3898,3928,4021,3886,3826,4102,4146,3795,3844,3825,385,3723,4291,4322,445,4477,4462,4483,4529,457,4308,4312,4333,4307,4337,434,430,4271,4319,4218,4224,4154,454,453,4424,437,4376,4418,4612,4632,4555,454,4626,442,4347,4323,4498,4155,416,4107,3943,3934,3867,3617,3603,360,3618,378,3708,3558,3595,3537,3275,3184,3221,3228,3247,3211,325,3359,3339,3302,3175,3318,3338,3339,3047,3367,3802,3716,3851,3698,3827,4009,3965,3593,323,3112,3271,3136,3035,2947,2851,2879,2826,2769,2744,2671,2698,2638,2617,2696,2629,2544,2523,2488,2454,2476,2454,244,2426,243,2461,2401,2383,2386,2367,2371,2359,2367,2389,2325,2343,235,2338,2299,230,2263,2311,2311,2322,2327,2286,2295,2299,2302,2356,2399,2381,2374,2432,2396,2399,2337,2303,2262,2286,2272,2295,2284,2285,2316,2227,225,2205,2114,2268,2295,2324,2347,226,2467,2571,2571,2605,265,2634,2677,269,2633,2639,2586,2779,278,2817,2843,2816,2814,2805,2837,287,2884,2937,293,2918,2887,2884,2755,2765,2751,2777,2732,274,2796,2766,2834,287,2904,3104,292,2836,2691,2686,2662,2691,2701,2605,2554,2549,2576,2641,257,2489,2507,2429,2426,2406,2438,2475,2441,245,2441,2484,2474,2498,237,2338,2325,2305,2299,2288,2296,2286,2235,2247,2253,2242,2256,2257,2231,2298,2332,237,2373,2373,2378,2374,241,2389,2404,2354,234,232,2326,2363,2362,2372,2369,2364,2416,2418,240,2414,2437,2377,230,2358,239,240,2353,2332,2358,2254,2258,229,2187,2261,2311,2354,2338,2337,2242,223,2234,2226,228,223,218,2236,2359,2365,2347,2433,2446,253,255,2596,2529,2545,2526,2462,2441,2468,2421,252,2472,248,2464,2467,2655,2686,2597,2618,2609,2559,2854,2904,2849,2816,2872,2939,2956,2914,290,2745,2749,2726,2752,2719,2806,2738,2579,2541,2535,2365,2373,2389,2388,2357,2444,2445,2419,2352,2432,2358,2333,2586,2362,2218,2188,2197,2203,2237,2277,223,2165,2266,2274,2389,2253,2185,2318,234,2362,2633,2692,2521,2482,2322,2327,2282,2106,2159,2106,1996,2069,2098,1649,2213,2693,2648,2734,288,2827,2913,2823,2748,2647,2871,3152,3149,3182,3113,3141,3165,3153,330,319,3224,3353,3308,3226,3304,3178,3103,320,3302,3454,3494,3482,3534,3477,3479,3522,365,3765,3763,3776,3698,377,3806,3786,3749,3763,3776,3688,3654,3764,3789,3659,352,3518,3573,3814,3792,3847,3856,3749,3965,4287,432,3654,3671,362,3435,3419,3477,338,328,3242,3225,3254,3379,3449,3351,3511,3501,3487,3467,3551,3558,3789,3824,3804,3873,3909,3805,3798,3932,3971,3873,3732,3612,3617,3609,3509,3316,3315,3229,3353,3635,3751,3828,3882,3768,3791,399,4045,4123,4238,4369,4041,4016,4115,3977,4243,4611,4668,4777,4777,4782,4777,4785,4797,4749,4757,4858,4845,4836,491,480,4789,4772,4818,506,5126,5108,5152,5126,5029,5097,4977,5161,5179,5168,4851,4622,4855,522,4965,5048,5421,5677,5759,5921,5895,5958,5928,5898,5888,5928,5889,5917,5988,5895,5646,5858,5879,595,596,6005,6019,6217,6225,6251,621,627,6275,6266,6148,6196,6183,628,6359,6329,6184,623,6153,6136,6267,623,624,638,6457,6432,6351,6011,5976,6022,5827,5685,5888,5912,6036,597,5908,6002,6062,6051,5991,5823,5834,6103,5971,643,6556,6443,651,6517,6504,6602,6389,6694,6555,6498,6279,6123,5644,5708,5701,582,5704,5205,5181,5154,4888,4846,4439,4501,4528,4536,4481,4426,4339,4382,4332,4519,4455,4411,4465,4322,4309,436,4386,4537,4601,4456,4461,4419,4432,4579,4645,5003,4873,4879,4952,4985,506,4855,502,537,5264,4784,4276,4376,4351,3846,4573,4666,4624,4557,4566,4444,4363,4244,4635,4447,4469,4771,4826,4605,5625,5629,5676,5512,5643,5496,566,595,5989,6064,6191,624,614,625,6194,6087,613,627,6092,6167,6483,6583,6618,6622,5446,5574,5739,5965,5931,1358,174,3102,2556,1116,1119,2615,294,2723,2998,3711,4277,4514,5311,579,5826,6596,6488,6957,8289,9045,9266,9317,9533,9404,9388,9414,9257,9327,9435,100700,961,9165,9442,951,9622,956,9548,9057,8942,9135,9412,9193,9229,9398,100530,9578,937,9388,8799,101270,101470,9247,8843,8569,8159,8059,8048,785,762,803,802,7073,7028,7132,6395,6405,650,732,541,715,7599,9199,9089,9368,900,9199,103370,919,804,697,845,110630,123760,115490,109660,100440,120570,120690,110140,107990,970,830,795,8325,802,7649,638,6457,7854,5283,462,4339,4334,4349,380,363,3363,3678,355,3096,2641,2513,2382,224,2117,2134,2112,208,216,2069,2069,1886,1979,207,228,203,1928,1861,1831,1683,1576,1528,1581,1514,1475,1429,1401,1404,1395,1365,1358,1378,1367,1368,131,123,1403,1419,1439,1425,1389,1371,135,1348,1334,134,1344,1338,1351,1404,1391,1394,1383,1367,1407,1394,1421,1326,1331,1263,129,1219,1302,1325,144,144,146,141,138,1293,1288,1313,1201,1221,1196,1185,122,1233,1212,1185,1134,1128,109,110,1126,1096,1068,105,103,1028,1031,106,1066,1067,1051,1049,1045,104,1062,108,1015,988,944,96,969,951,956,916,92,898,92,901,985,971,989,944,983,94,89,88,767,76,765,697,685,80,789,904,881,975,95,947,1017,104,1033,1021,1079,1082,1095,1113,1083,1073,1019,999,998,100,1039,1088,109,1063,1004,1079,111,119,1219,1214,1207,1225,1293,1288,1288,1323,129,1298,1335,132,1331,1263,1238,1229,122,1225,1232,1235,1182,1142,1114,118,1148,1156,1177,1128,1132,1096,1123,116,1129,981,1063,1164,1392,144,1344,128,1369,1417,1542,1435,1274,1192,1266,1185,109,931,684,824,90,93,117,1249,165,230,1875,1623,1426,1423,1321,135,118,104,93,922,905,862,889,785,736,715,643,699,708,645,591,516,474,47,47,472,469,443,484,46,468,442,42,41,403,362,345,343,345,334,309,311,304,299,298,303,298,296,294,27,268,272,271,272,242,252,246,24,236,227,221,212,206,204,206,196,205,204,197,195,187,178,179,174,169,175,173,168,157,156,157,155,147,143,143,141,142,141,141,138,137,136,134,134,135,134,133,133,135,134,134,134,134,135,134,134,133,134,135,135,136,133,133,133,135,136,137,137,136,134,134,134,135,133,134,134,127,125,126,126,124,124,122,123,125,124,124,124,118,117,118,116,118,118,112,109,109,11,109,109,108,109,109,109,108,108,106,105,106,112,109,106,107,103,102,109,116,116,117,116,117,117,119,118,119,118,117,119,12,12,121,119,118,118,125,127,129,129,128,124,124,124,124,123,123,122,121,122,122,124,123,126,123,119,119,118,117,114,114,113,112,11,11,11,112,11,104,105,102,10,102,108,109,109,109,106,105,106,101,98,99,101,8,116,116,135,133,122,12,116,115,114,111,111,111,109,109,11,11,105,96,94,91,87,89,89,89,88,86,84,84,89,85,89,91,88,85,76,75,77,78,72,72,7,68,68,67,67,65,64,68,66,67,67,66,67,64,63,63,64,66,67,67,65,63,62,64,65,59,59,57,56,55,56,56,56,55,54,53,52,53,53,52,51,52,51,51,51,52,51,51,51,51,51,51,51,51,51,5,5,49,49,5,48,5,51,51,51,51,51,51,51,5,49,49,5,51,51,51,51,5,52,53,53,51,51,5,49,5,5,49,49,49,48,49,48,47,49,49,49,49,5,48,49,49,48,48,48,46,46,47,47,47,48,48,47,53,52,53,53,54,53,49,49,48,49,49,49,5,5,48,46,47,49,49,49,5,49,48,5,5,44,43,44,44,42,44,43,43,45,53,55,56,59,58,56,57,54,57,59,6,61,61,55,55,54,56,53,53,58,63,64,63,62,65,64,59,56,67,7,68,64,68,69,64,63,71,68,67,69,56,49,52,53,47,43,42,42,41,4,42,39,4,39,39,4,35,32,32,32,32,32,33,31,33,3,3,3,3,3,29,28,28,31,31,3,28,25,25,25,25,24,23,23,23,22,22,2,23,26,23,22,3,3,31,28,3,3,3,3,3,31,32,33,32,33,33,36,32,3,28,28,25,32,32,26,23,23,24,26,36,38,4,41,42,39,41,41,4,43,47,49,5,5,5,5,51,48,48,49,49,53,55,56,54,56,61,55,52,48,48,48,56,58,61,59,48,5,65,72,69,76,82,85,86,82,82,88,9,91,86,82,97,109,109,109,113,114,116,108,109,11,111,108,101,95,95,10,10,78,79,66,98,108,93,121,131,134,135,135,135,139,139,141,14,137,137,136,137,139,135,132,137,138,14,139,14,142,149,144,143,148,148,129,139,154,154,154,161,169,17,168,165,175,175,175,175,175,175,175,169,157,17,195,193,198,185,146,24,289,296,239,185,167,189,143,106,96,87,88,84,83,85,88,84,74,72,67,61,56,68,69,72,8,7,72,82,63,55,58,38,39,36,35,33,34,34,32,3,35,29,22,19,18,16,16,17,14,12,11,12,12,11,1,1,1,09,09,08,07,07,08,08,07,07,07,08,08,08,08,08,08,08,08,09,09,09,08,08,08,07,08,08,08,09,09,09,09,09,09,09,09,09,09,09,09,09,09,09,09,09,09,1,09,1,09,09,08,09,09,09,1,1,1,11,1,11,11,1,11,09,09,09,09,08,07,07,07,05,05,04,04,04,04,04,04,04,04,04,04,03,03,03,04,04,04,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,02,02,03,03,02,03,02,02,02,03,02,02,02,02,02,02,02,02,02,02,02,02,03,03,02,02,02,03,03,03,03,03,03,03,03,03,03,03])

#reproducing results from Paulo Ferreira's paper "DCCA and DMCA correlations of cryptocurrency markets".
#to make sure the function behaves as it should.
n, rho = rhoDCCA(Float64.(bitcoin[1520:end]), Float64.(bitcoin[1500:end-20]); box_start = 4, box_stop = 250)
#testing if rhoDCCA function gives correct results. If plotted, we see it does.
@test rho[1:10] == [0.09412010216170162, 0.097082646460856, 0.09762942560114769, 0.09516841871967908, 0.09003969456061856, 0.0819174901591955, 0.06441522187937594, 0.043691960259373795, 0.02819918700082718, 0.00301404823865243]
p, ci = empirical_CI(length(x1))
#testing if the empirical_CI function gives the correct abscissa points.
@test p[1:23] == [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]
#testing if the empirical_CI function gives the correct table values.
@test ci[1:10] == [0.064, 0.067, 0.07, 0.074, 0.077, 0.08, 0.084, 0.087, 0.09, 0.094]
