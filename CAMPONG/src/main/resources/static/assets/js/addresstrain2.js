function addressKindChange(e) {
  var ga = [{txt:"가남", val:"NAT280090"},{txt:"가평", val:"NAT140576"},{txt:"각계", val:"NAT012054"},{txt:"감곡장호원", val:"NAT280212"},
  			{txt:"강경", val:"NAT030607"},{txt:"강구", val:"NAT8B0671"},{txt:"강릉", val:"NAT601936"},{txt:"강촌", val:"NAT140701"},
  			{txt:"검암", val:"NATC10325"},{txt:"개포", val:"NAT300733"},{txt:"경산", val:"NAT013395"},{txt:"계룡", val:"NAT030254"},
  			{txt:"고한", val:"NAT650828"},{txt:"곡성", val:"NAT041072"},{txt:"공주", val:"NATH20438"},{txt:"관촌", val:"NAT040496"},
  			{txt:"광명", val:"NATH10219"},{txt:"광양", val:"NAT881708"},{txt:"광운대", val:"NAT130182"},{txt:"광주", val:"NAT883012"},
  			{txt:"광주송정", val:"NAT031857"},{txt:"광천", val:"NAT080749"},{txt:"구례구", val:"NAT041285"},{txt:"구미", val:"NAT012775"},
  			{txt:"구포", val:"NAT014281"},{txt:"군북", val:"NAT880608"},{txt:"군산", val:"NAT081388"},{txt:"극락강", val:"NAT883086"},
  			{txt:"기장", val:"NAT750329"},{txt:"김유정", val:"NAT140787"},{txt:"김제", val:"NAT031056"},{txt:"김천", val:"NAT012546"},
  			{txt:"김천구미", val:"NATH12383"}];
  var na = [{txt:"나전", val:"NAT610326"},{txt:"나주", val:"NAT031998"},{txt:"남성현", val:"NAT013542"},{txt:"남원", val:"NAT040868"},
  			{txt:"남창", val:"NAT750560"},{txt:"남춘천", val:"NAT140840"},{txt:"남평", val:"NAT882847"},{txt:"노량진", val:"NAT010058"},
  			{txt:"논산", val:"NAT030508"},{txt:"능곡", val:"NAT110165"},{txt:"능주", val:"NAT882666"}];
  var da = [{txt:"다시", val:"NAT032099"},{txt:"단양", val:"NAT021784"},{txt:"덕하", val:"NAT750653"},{txt:"대광리", val:"NAT130844"},
  			{txt:"대구", val:"NAT013239"},{txt:"대성리", val:"NAT140362"},{txt:"대야", val:"NAT320131"},{txt:"대전", val:"NAT011668"},
  			{txt:"대천", val:"NAT080952"},{txt:"덕소", val:"NAT020178"},{txt:"도계", val:"NAT601122"},{txt:"도고온천", val:"NAT080309"},
  			{txt:"도담", val:"NAT021723"},{txt:"도라산", val:"NAT110557"},{txt:"동대구", val:"NAT013271"},{txt:"동두천", val:"NAT130531"},
  			{txt:"동래", val:"NAT750106"},{txt:"동백산", val:"NAT651053"},{txt:"동산", val:"NAT040173"},{txt:"동점", val:"동점"},
  			{txt:"동탄", val:"NATH30326"},{txt:"동화", val:"NAT020986"},{txt:"동해", val:"NAT601485"},{txt:"둔내", val:"NATN10428"},
  			{txt:"득량", val:"NAT882237"}];
  var ma = [{txt:"마산", val:"NAT880345"},{txt:"마석", val:"NAT140277"},{txt:"만종", val:"NAT021033"},{txt:"망상", val:"NAT601605"},
  			{txt:"망상해변", val:"NAT601602"},{txt:"매곡", val:"NAT020803"},{txt:"명봉", val:"NAT882416"},{txt:"목포", val:"NAT032563"},
  			{txt:"목행", val:"NAT050881"},{txt:"몽탄", val:"NAT032313"},{txt:"무안", val:"NAT032273"},{txt:"묵호", val:"NAT601545"},
  			{txt:"문산", val:"NAT110460"},{txt:"물금", val:"NAT014150"},{txt:"민둥산", val:"NAT650722"},{txt:"밀양", val:"NAT013841"}];
  var ba = [{txt:"반성", val:"NAT880766"},{txt:"반곡", val:"NAT021175"},{txt:"백마고지", val:"NAT130944"},{txt:"백양리", val:"NAT140681"},
  			{txt:"백양사", val:"NAT031486"},{txt:"벌교", val:"NAT882034"},{txt:"별어곡", val:"NAT610064"},{txt:"보성", val:"NAT882328"},
  			{txt:"봉성", val:"NAT600257"},{txt:"봉양", val:"NAT021478"},{txt:"봉화", val:"NAT600147"},{txt:"부강", val:"NAT011403"},
  			{txt:"부발", val:"NAT250428"},{txt:"부산", val:"NAT014445"},{txt:"부전", val:"NAT750046"},{txt:"부조", val:"NAT751354"},
  			{txt:"부천", val:"NAT060121"},{txt:"북영천", val:"NAT023424"},{txt:"북울산", val:"NAT750781"},{txt:"북천", val:"NAT881269"},
  			{txt:"분천", val:"NAT600593"},{txt:"비동", val:"NAT600635"}];
  var sa = [{txt:"사곡", val:"NAT012821"},{txt:"사릉", val:"NAT140133"},{txt:"사방", val:"NAT751238"},{txt:"사북", val:"NAT650782"},
  			{txt:"사상", val:"NAT014331"},{txt:"삼랑진", val:"NAT013967"},{txt:"삼례", val:"NAT040133"},{txt:"삼산", val:"NAT020884"},
  			{txt:"삼척해변", val:"NAT630078"},{txt:"삼탄", val:"NAT051006"},{txt:"삽교", val:"NAT080492"},{txt:"상동", val:"NAT013747"},
  			{txt:"상봉", val:"NAT020040"},{txt:"상주", val:"NAT300360"},{txt:"서경주", val:"NAT023821"},{txt:"서광주", val:"NAT882936"},
  			{txt:"서대구", val:"NAT013189"},{txt:"서빙고", val:"NAT130036"},{txt:"서대전", val:"NAT030057"},{txt:"서울", val:"NAT010000"},
  			{txt:"서원주", val:"NAT020864"},{txt:"서정리", val:"NAT010670"},{txt:"서천", val:"NAT081343"},{txt:"석불", val:"NAT020717"},
  			{txt:"석포", val:"NAT600768"},{txt:"선평", val:"NAT610137"},{txt:"성환", val:"NAT010848"},{txt:"센텀", val:"NAT750161"},
  			{txt:"소요산", val:"NAT130556"},{txt:"소정리", val:"NAT011079"},{txt:"송정", val:"NAT750254"},{txt:"수서", val:"NATH30000"},
  			{txt:"수원", val:"NAT010415"},{txt:"순천", val:"NAT041595"},{txt:"승부", val:"NAT600692"},{txt:"신경주", val:"NATH13421"},
  			{txt:"신기", val:"NAT601275"},{txt:"신나원", val:"NAT8B0082"},{txt:"신녕", val:"NAT023279"},{txt:"신도림", val:"NAT010106"},
  			{txt:"신동", val:"NAT013067"},{txt:"신례원", val:"NAT080353"},{txt:"신리", val:"NAT040352"},{txt:"신림", val:"NAT021357"},
  			{txt:"신망리", val:"NAT130774"},{txt:"신안강", val:"NAT8B0190"},{txt:"신웅천", val:"NAT081099"},{txt:"신창", val:"NAT080216"},
  			{txt:"신창원", val:"NAT810048"},{txt:"신탄리", val:"NAT130888"},{txt:"신탄진", val:"NAT011524"},{txt:"신태인", val:"NAT031179"},
  			{txt:"신해운대", val:"NAT750189"},{txt:"심천", val:"NAT012016"},{txt:"쌍룡", val:"NAT650177"}];
  var oa = [{txt:"아산", val:"NAT080045"},{txt:"아신", val:"NAT020471"},{txt:"아우라지", val:"NAT610387"},{txt:"아포", val:"NAT012700"},
  			{txt:"아화", val:"NAT023601"},{txt:"안강", val:"NAT751296"},{txt:"안동", val:"NAT022558"},{txt:"안양", val:"NAT010239"},
  			{txt:"앙성온천", val:"NAT280358"},{txt:"약목", val:"NAT012903"},{txt:"양동", val:"NAT020845"},
  			{txt:"양보", val:"NAT881323"},{txt:"양원", val:"NAT600655"},{txt:"양자동", val:"NAT751325"},{txt:"양평", val:"NAT020524"},
  			{txt:"여수EXPO", val:"NAT041993"},{txt:"여천", val:"NAT041866"},{txt:"연당", val:"NAT650253"},{txt:"연무대", val:"NAT340090"},
  			{txt:"연산", val:"NAT030396"},{txt:"연천", val:"NAT130738"},{txt:"영덕", val:"NAT8B0737"},{txt:"영동", val:"NAT012124"},
  			{txt:"영등포", val:"NAT010091"},{txt:"영월", val:"NAT650341"},{txt:"영주", val:"NAT022188"},{txt:"영천", val:"NAT023449"},
  			{txt:"예당", val:"NAT882194"},{txt:"예미", val:"NAT650515"},{txt:"예산", val:"NAT080402"},{txt:"예천", val:"NAT300850"},
  			{txt:"오근장", val:"NAT050215"},{txt:"오산", val:"NAT010570"},{txt:"오송", val:"NAT050044"},{txt:"오수", val:"NAT040667"},
  			{txt:"옥곡", val:"NAT881584"},{txt:"옥산", val:"NAT300200"},{txt:"옥수", val:"NAT130070"},{txt:"옥천", val:"NAT011833"},
  			{txt:"온양온천", val:"NAT080147"},{txt:"완사", val:"NAT881168"},{txt:"왕십리", val:"NAT130104"},{txt:"왜관", val:"NAT012968"},
  			{txt:"용궁", val:"NAT300669"},{txt:"용동", val:"NAT030667"},{txt:"용문", val:"NAT020641"},{txt:"용산", val:"NAT010032"},
  			{txt:"운천", val:"NAT110497"},{txt:"울산(통도사)", val:"NATH13717"},{txt:"율촌", val:"NAT041710"},{txt:"원동", val:"NAT014058"},
  			{txt:"원북", val:"NAT880644"},{txt:"원주", val:"NAT020947"},{txt:"월포", val:"NAT8B0504"},{txt:"음성", val:"NAT050596"},
  			{txt:"의성", val:"NAT022844"},{txt:"의정부", val:"NAT130312"},{txt:"이양", val:"NAT882544"},{txt:"이원", val:"NAT011916"},
  			{txt:"익산", val:"NAT030879"},{txt:"인천공항T1", val:"NATC10580"},{txt:"인천공항T2", val:"NATC30058"}, {txt:"일로", val:"NAT032422"},
  			{txt:"일산", val:"NAT110249"},{txt:"일신", val:"NAT020760"},{txt:"임기", val:"NAT600476"},{txt:"임성리", val:"NAT032489"},
  			{txt:"임실", val:"NAT040536"},{txt:"임진강", val:"NAT110520"},{txt:"입실", val:"NAT750933"}];
  var ja = [{txt:"장락", val:"NAT650050"},{txt:"장사", val:"NAT8B0595"},{txt:"장성", val:"NAT031638"},{txt:"장항", val:"NAT081318"},
  			{txt:"좌천", val:"NAT750412"},{txt:"전곡", val:"NAT130652"},{txt:"전의", val:"NAT011154"},{txt:"전주", val:"NAT040257"},
  			{txt:"점촌", val:"NAT300600"},{txt:"정동진", val:"NAT601774"},{txt:"정선", val:"NAT610226"},{txt:"정읍", val:"NAT031314"},
  			{txt:"제천", val:"NAT021549"},{txt:"조성", val:"NAT882141"},{txt:"조치원", val:"NAT011298"},{txt:"주덕", val:"NAT050719"},
  			{txt:"주안", val:"NAT060231"},{txt:"중리", val:"NAT880408"},{txt:"증평", val:"NAT050366"},{txt:"지탄", val:"NAT011972"},
  			{txt:"지평", val:"NAT020677"},{txt:"진례", val:"NAT880179"},{txt:"진부(오대산)", val:"NATN10787"},{txt:"진상", val:"NAT881538"},
  			{txt:"진성", val:"NAT880825"},{txt:"진영", val:"NAT880177"},{txt:"진주", val:"NAT881014"},{txt:"진해", val:"NAT810195"}];
  var cha = [{txt:"창원", val:"NAT880310"},{txt:"창원중앙", val:"NAT880281"},{txt:"천안", val:"NAT010971"},{txt:"천안아산", val:"NATH10960"},
  			 {txt:"철암", val:"NAT600870"},{txt:"청도", val:"NAT013629"},{txt:"청량리", val:"NAT130126"},{txt:"청리", val:"NAT300271"},
  			 {txt:"청소", val:"NAT080827"},{txt:"청주", val:"NAT050114"},{txt:"청주공항", val:"NAT050244"},{txt:"청평", val:"NAT140436"},
  			 {txt:"초성리", val:"NAT130597"},{txt:"추암", val:"NAT630064"},{txt:"추전", val:"NAT650918"},{txt:"추풍령", val:"NAT012355"},
  			 {txt:"춘양", val:"NAT600379"},{txt:"춘천", val:"NAT140873"},{txt:"충주", val:"NAT050827"}];
  var ta = [{txt:"탄현", val:"NAT110265"},{txt:"탑리", val:"NAT022961"},{txt:"태백", val:"NAT650978"},{txt:"태화강", val:"NAT750726"},
  			{txt:"퇴계원", val:"NAT140098"}];
  var pa = [{txt:"파주", val:"NAT110407"},{txt:"판교", val:"NAT081240"},{txt:"평내호평", val:"NAT140214"},{txt:"평창", val:"NATN10625"},
  			{txt:"평촌", val:"NAT880702"},{txt:"평택", val:"NAT010754"},{txt:"평택지제", val:"NATH30536"},{txt:"포항", val:"NAT8B0351"},
  			{txt:"풍기", val:"NAT022053"}];
  var ha = [{txt:"하동", val:"NAT881460"},{txt:"하양", val:"NAT830200"},{txt:"한림정", val:"NAT880099"},{txt:"한탄강", val:"NAT130627"},
  			{txt:"함백", val:"NAT650567"},{txt:"함안", val:"NAT880520"},{txt:"함열", val:"NAT030718"},{txt:"함창", val:"NAT300558"},
  			{txt:"함평", val:"NAT032212"},{txt:"행신", val:"NAT110147"},{txt:"현동", val:"NAT600527"},{txt:"홍성", val:"NAT080622"},
  			{txt:"화명", val:"NAT014244"},{txt:"화본", val:"NAT023127"},{txt:"화순", val:"NAT882755"},{txt:"황간", val:"NAT012270"},
  			{txt:"횡성", val:"NATN10230"},{txt:"횡천", val:"NAT881386"},{txt:"효문", val:"NAT750760"},{txt:"효자", val:"NAT751418"},
  			{txt:"효천", val:"NAT882904"},{txt:"흑석리", val:"NAT030173"}];

  var target = document.getElementById("addressKindD");

  if(e.value == "a") var d = ga;
  else if(e.value == "b") var d = na;
  else if(e.value == "c") var d = da;
  else if(e.value == "d") var d = ma;
  else if(e.value == "e") var d = ba;
  else if(e.value == "f") var d = sa;
  else if(e.value == "g") var d = oa;
  else if(e.value == "h") var d = ja;
  else if(e.value == "i") var d = cha;
  else if(e.value == "j") var d = ta;
  else if(e.value == "k") var d = pa;
  else if(e.value == "l") var d = ha;

  target.options.length = 0;

  for (x in d) {
      var opt = document.createElement("option");
      opt.value = d[x].val;
      opt.innerHTML = d[x].txt;
      target.appendChild(opt);
  }   
}


function addressKindChange2(e) {
  var ga = [{txt:"가남", val:"NAT280090"},{txt:"가평", val:"NAT140576"},{txt:"각계", val:"NAT012054"},{txt:"감곡장호원", val:"NAT280212"},
  			{txt:"강경", val:"NAT030607"},{txt:"강구", val:"NAT8B0671"},{txt:"강릉", val:"NAT601936"},{txt:"강촌", val:"NAT140701"},
  			{txt:"검암", val:"NATC10325"},{txt:"개포", val:"NAT300733"},{txt:"경산", val:"NAT013395"},{txt:"계룡", val:"NAT030254"},
  			{txt:"고한", val:"NAT650828"},{txt:"곡성", val:"NAT041072"},{txt:"공주", val:"NATH20438"},{txt:"관촌", val:"NAT040496"},
  			{txt:"광명", val:"NATH10219"},{txt:"광양", val:"NAT881708"},{txt:"광운대", val:"NAT130182"},{txt:"광주", val:"NAT883012"},
  			{txt:"광주송정", val:"NAT031857"},{txt:"광천", val:"NAT080749"},{txt:"구례구", val:"NAT041285"},{txt:"구미", val:"NAT012775"},
  			{txt:"구포", val:"NAT014281"},{txt:"군북", val:"NAT880608"},{txt:"군산", val:"NAT081388"},{txt:"극락강", val:"NAT883086"},
  			{txt:"기장", val:"NAT750329"},{txt:"김유정", val:"NAT140787"},{txt:"김제", val:"NAT031056"},{txt:"김천", val:"NAT012546"},
  			{txt:"김천구미", val:"NATH12383"}];
  var na = [{txt:"나전", val:"NAT610326"},{txt:"나주", val:"NAT031998"},{txt:"남성현", val:"NAT013542"},{txt:"남원", val:"NAT040868"},
  			{txt:"남창", val:"NAT750560"},{txt:"남춘천", val:"NAT140840"},{txt:"남평", val:"NAT882847"},{txt:"노량진", val:"NAT010058"},
  			{txt:"논산", val:"NAT030508"},{txt:"능곡", val:"NAT110165"},{txt:"능주", val:"NAT882666"}];
  var da = [{txt:"다시", val:"NAT032099"},{txt:"단양", val:"NAT021784"},{txt:"덕하", val:"NAT750653"},{txt:"대광리", val:"NAT130844"},
  			{txt:"대구", val:"NAT013239"},{txt:"대성리", val:"NAT140362"},{txt:"대야", val:"NAT320131"},{txt:"대전", val:"NAT011668"},
  			{txt:"대천", val:"NAT080952"},{txt:"덕소", val:"NAT020178"},{txt:"도계", val:"NAT601122"},{txt:"도고온천", val:"NAT080309"},
  			{txt:"도담", val:"NAT021723"},{txt:"도라산", val:"NAT110557"},{txt:"동대구", val:"NAT013271"},{txt:"동두천", val:"NAT130531"},
  			{txt:"동래", val:"NAT750106"},{txt:"동백산", val:"NAT651053"},{txt:"동산", val:"NAT040173"},{txt:"동점", val:"동점"},
  			{txt:"동탄", val:"NATH30326"},{txt:"동화", val:"NAT020986"},{txt:"동해", val:"NAT601485"},{txt:"둔내", val:"NATN10428"},
  			{txt:"득량", val:"NAT882237"}];
  var ma = [{txt:"마산", val:"NAT880345"},{txt:"마석", val:"NAT140277"},{txt:"만종", val:"NAT021033"},{txt:"망상", val:"NAT601605"},
  			{txt:"망상해변", val:"NAT601602"},{txt:"매곡", val:"NAT020803"},{txt:"명봉", val:"NAT882416"},{txt:"목포", val:"NAT032563"},
  			{txt:"목행", val:"NAT050881"},{txt:"몽탄", val:"NAT032313"},{txt:"무안", val:"NAT032273"},{txt:"묵호", val:"NAT601545"},
  			{txt:"문산", val:"NAT110460"},{txt:"물금", val:"NAT014150"},{txt:"민둥산", val:"NAT650722"},{txt:"밀양", val:"NAT013841"}];
  var ba = [{txt:"반성", val:"NAT880766"},{txt:"반곡", val:"NAT021175"},{txt:"백마고지", val:"NAT130944"},{txt:"백양리", val:"NAT140681"},
  			{txt:"백양사", val:"NAT031486"},{txt:"벌교", val:"NAT882034"},{txt:"별어곡", val:"NAT610064"},{txt:"보성", val:"NAT882328"},
  			{txt:"봉성", val:"NAT600257"},{txt:"봉양", val:"NAT021478"},{txt:"봉화", val:"NAT600147"},{txt:"부강", val:"NAT011403"},
  			{txt:"부발", val:"NAT250428"},{txt:"부산", val:"NAT014445"},{txt:"부전", val:"NAT750046"},{txt:"부조", val:"NAT751354"},
  			{txt:"부천", val:"NAT060121"},{txt:"북영천", val:"NAT023424"},{txt:"북울산", val:"NAT750781"},{txt:"북천", val:"NAT881269"},
  			{txt:"분천", val:"NAT600593"},{txt:"비동", val:"NAT600635"}];
  var sa = [{txt:"사곡", val:"NAT012821"},{txt:"사릉", val:"NAT140133"},{txt:"사방", val:"NAT751238"},{txt:"사북", val:"NAT650782"},
  			{txt:"사상", val:"NAT014331"},{txt:"삼랑진", val:"NAT013967"},{txt:"삼례", val:"NAT040133"},{txt:"삼산", val:"NAT020884"},
  			{txt:"삼척해변", val:"NAT630078"},{txt:"삼탄", val:"NAT051006"},{txt:"삽교", val:"NAT080492"},{txt:"상동", val:"NAT013747"},
  			{txt:"상봉", val:"NAT020040"},{txt:"상주", val:"NAT300360"},{txt:"서경주", val:"NAT023821"},{txt:"서광주", val:"NAT882936"},
  			{txt:"서대구", val:"NAT013189"},{txt:"서빙고", val:"NAT130036"},{txt:"서대전", val:"NAT030057"},{txt:"서울", val:"NAT010000"},
  			{txt:"서원주", val:"NAT020864"},{txt:"서정리", val:"NAT010670"},{txt:"서천", val:"NAT081343"},{txt:"석불", val:"NAT020717"},
  			{txt:"석포", val:"NAT600768"},{txt:"선평", val:"NAT610137"},{txt:"성환", val:"NAT010848"},{txt:"센텀", val:"NAT750161"},
  			{txt:"소요산", val:"NAT130556"},{txt:"소정리", val:"NAT011079"},{txt:"송정", val:"NAT750254"},{txt:"수서", val:"NATH30000"},
  			{txt:"수원", val:"NAT010415"},{txt:"순천", val:"NAT041595"},{txt:"승부", val:"NAT600692"},{txt:"신경주", val:"NATH13421"},
  			{txt:"신기", val:"NAT601275"},{txt:"신나원", val:"NAT8B0082"},{txt:"신녕", val:"NAT023279"},{txt:"신도림", val:"NAT010106"},
  			{txt:"신동", val:"NAT013067"},{txt:"신례원", val:"NAT080353"},{txt:"신리", val:"NAT040352"},{txt:"신림", val:"NAT021357"},
  			{txt:"신망리", val:"NAT130774"},{txt:"신안강", val:"NAT8B0190"},{txt:"신웅천", val:"NAT081099"},{txt:"신창", val:"NAT080216"},
  			{txt:"신창원", val:"NAT810048"},{txt:"신탄리", val:"NAT130888"},{txt:"신탄진", val:"NAT011524"},{txt:"신태인", val:"NAT031179"},
  			{txt:"신해운대", val:"NAT750189"},{txt:"심천", val:"NAT012016"},{txt:"쌍룡", val:"NAT650177"}];
  var oa = [{txt:"아산", val:"NAT080045"},{txt:"아신", val:"NAT020471"},{txt:"아우라지", val:"NAT610387"},{txt:"아포", val:"NAT012700"},
  			{txt:"아화", val:"NAT023601"},{txt:"안강", val:"NAT751296"},{txt:"안동", val:"NAT022558"},{txt:"안양", val:"NAT010239"},
  			{txt:"앙성온천", val:"NAT280358"},{txt:"약목", val:"NAT012903"},{txt:"양동", val:"NAT020845"},
  			{txt:"양보", val:"NAT881323"},{txt:"양원", val:"NAT600655"},{txt:"양자동", val:"NAT751325"},{txt:"양평", val:"NAT020524"},
  			{txt:"여수EXPO", val:"NAT041993"},{txt:"여천", val:"NAT041866"},{txt:"연당", val:"NAT650253"},{txt:"연무대", val:"NAT340090"},
  			{txt:"연산", val:"NAT030396"},{txt:"연천", val:"NAT130738"},{txt:"영덕", val:"NAT8B0737"},{txt:"영동", val:"NAT012124"},
  			{txt:"영등포", val:"NAT010091"},{txt:"영월", val:"NAT650341"},{txt:"영주", val:"NAT022188"},{txt:"영천", val:"NAT023449"},
  			{txt:"예당", val:"NAT882194"},{txt:"예미", val:"NAT650515"},{txt:"예산", val:"NAT080402"},{txt:"예천", val:"NAT300850"},
  			{txt:"오근장", val:"NAT050215"},{txt:"오산", val:"NAT010570"},{txt:"오송", val:"NAT050044"},{txt:"오수", val:"NAT040667"},
  			{txt:"옥곡", val:"NAT881584"},{txt:"옥산", val:"NAT300200"},{txt:"옥수", val:"NAT130070"},{txt:"옥천", val:"NAT011833"},
  			{txt:"온양온천", val:"NAT080147"},{txt:"완사", val:"NAT881168"},{txt:"왕십리", val:"NAT130104"},{txt:"왜관", val:"NAT012968"},
  			{txt:"용궁", val:"NAT300669"},{txt:"용동", val:"NAT030667"},{txt:"용문", val:"NAT020641"},{txt:"용산", val:"NAT010032"},
  			{txt:"운천", val:"NAT110497"},{txt:"울산(통도사)", val:"NATH13717"},{txt:"율촌", val:"NAT041710"},{txt:"원동", val:"NAT014058"},
  			{txt:"원북", val:"NAT880644"},{txt:"원주", val:"NAT020947"},{txt:"월포", val:"NAT8B0504"},{txt:"음성", val:"NAT050596"},
  			{txt:"의성", val:"NAT022844"},{txt:"의정부", val:"NAT130312"},{txt:"이양", val:"NAT882544"},{txt:"이원", val:"NAT011916"},
  			{txt:"익산", val:"NAT030879"},{txt:"인천공항T1", val:"NATC10580"},{txt:"인천공항T2", val:"NATC30058"}, {txt:"일로", val:"NAT032422"},
  			{txt:"일산", val:"NAT110249"},{txt:"일신", val:"NAT020760"},{txt:"임기", val:"NAT600476"},{txt:"임성리", val:"NAT032489"},
  			{txt:"임실", val:"NAT040536"},{txt:"임진강", val:"NAT110520"},{txt:"입실", val:"NAT750933"}];
  var ja = [{txt:"장락", val:"NAT650050"},{txt:"장사", val:"NAT8B0595"},{txt:"장성", val:"NAT031638"},{txt:"장항", val:"NAT081318"},
  			{txt:"좌천", val:"NAT750412"},{txt:"전곡", val:"NAT130652"},{txt:"전의", val:"NAT011154"},{txt:"전주", val:"NAT040257"},
  			{txt:"점촌", val:"NAT300600"},{txt:"정동진", val:"NAT601774"},{txt:"정선", val:"NAT610226"},{txt:"정읍", val:"NAT031314"},
  			{txt:"제천", val:"NAT021549"},{txt:"조성", val:"NAT882141"},{txt:"조치원", val:"NAT011298"},{txt:"주덕", val:"NAT050719"},
  			{txt:"주안", val:"NAT060231"},{txt:"중리", val:"NAT880408"},{txt:"증평", val:"NAT050366"},{txt:"지탄", val:"NAT011972"},
  			{txt:"지평", val:"NAT020677"},{txt:"진례", val:"NAT880179"},{txt:"진부(오대산)", val:"NATN10787"},{txt:"진상", val:"NAT881538"},
  			{txt:"진성", val:"NAT880825"},{txt:"진영", val:"NAT880177"},{txt:"진주", val:"NAT881014"},{txt:"진해", val:"NAT810195"}];
  var cha = [{txt:"창원", val:"NAT880310"},{txt:"창원중앙", val:"NAT880281"},{txt:"천안", val:"NAT010971"},{txt:"천안아산", val:"NATH10960"},
  			 {txt:"철암", val:"NAT600870"},{txt:"청도", val:"NAT013629"},{txt:"청량리", val:"NAT130126"},{txt:"청리", val:"NAT300271"},
  			 {txt:"청소", val:"NAT080827"},{txt:"청주", val:"NAT050114"},{txt:"청주공항", val:"NAT050244"},{txt:"청평", val:"NAT140436"},
  			 {txt:"초성리", val:"NAT130597"},{txt:"추암", val:"NAT630064"},{txt:"추전", val:"NAT650918"},{txt:"추풍령", val:"NAT012355"},
  			 {txt:"춘양", val:"NAT600379"},{txt:"춘천", val:"NAT140873"},{txt:"충주", val:"NAT050827"}];
  var ta = [{txt:"탄현", val:"NAT110265"},{txt:"탑리", val:"NAT022961"},{txt:"태백", val:"NAT650978"},{txt:"태화강", val:"NAT750726"},
  			{txt:"퇴계원", val:"NAT140098"}];
  var pa = [{txt:"파주", val:"NAT110407"},{txt:"판교", val:"NAT081240"},{txt:"평내호평", val:"NAT140214"},{txt:"평창", val:"NATN10625"},
  			{txt:"평촌", val:"NAT880702"},{txt:"평택", val:"NAT010754"},{txt:"평택지제", val:"NATH30536"},{txt:"포항", val:"NAT8B0351"},
  			{txt:"풍기", val:"NAT022053"}];
  var ha = [{txt:"하동", val:"NAT881460"},{txt:"하양", val:"NAT830200"},{txt:"한림정", val:"NAT880099"},{txt:"한탄강", val:"NAT130627"},
  			{txt:"함백", val:"NAT650567"},{txt:"함안", val:"NAT880520"},{txt:"함열", val:"NAT030718"},{txt:"함창", val:"NAT300558"},
  			{txt:"함평", val:"NAT032212"},{txt:"행신", val:"NAT110147"},{txt:"현동", val:"NAT600527"},{txt:"홍성", val:"NAT080622"},
  			{txt:"화명", val:"NAT014244"},{txt:"화본", val:"NAT023127"},{txt:"화순", val:"NAT882755"},{txt:"황간", val:"NAT012270"},
  			{txt:"횡성", val:"NATN10230"},{txt:"횡천", val:"NAT881386"},{txt:"효문", val:"NAT750760"},{txt:"효자", val:"NAT751418"},
  			{txt:"효천", val:"NAT882904"},{txt:"흑석리", val:"NAT030173"}];
  			
  var target = document.getElementById("addressKindD2");

  if(e.value == "a") var d = ga;
  else if(e.value == "b") var d = na;
  else if(e.value == "c") var d = da;
  else if(e.value == "d") var d = ma;
  else if(e.value == "e") var d = ba;
  else if(e.value == "f") var d = sa;
  else if(e.value == "g") var d = oa;
  else if(e.value == "h") var d = ja;
  else if(e.value == "i") var d = cha;
  else if(e.value == "j") var d = ta;
  else if(e.value == "k") var d = pa;
  else if(e.value == "l") var d = ha;

  target.options.length = 0;

  for (x in d) {
      var opt = document.createElement("option");
      opt.value = d[x].val;
      opt.innerHTML = d[x].txt;
      target.appendChild(opt);
  }   
}

function addressKindChange3(e) {
  var ga = [{txt:"가남", val:"NAT280090"},{txt:"가평", val:"NAT140576"},{txt:"각계", val:"NAT012054"},{txt:"감곡장호원", val:"NAT280212"},
  			{txt:"강경", val:"NAT030607"},{txt:"강구", val:"NAT8B0671"},{txt:"강릉", val:"NAT601936"},{txt:"강촌", val:"NAT140701"},
  			{txt:"검암", val:"NATC10325"},{txt:"개포", val:"NAT300733"},{txt:"경산", val:"NAT013395"},{txt:"계룡", val:"NAT030254"},
  			{txt:"고한", val:"NAT650828"},{txt:"곡성", val:"NAT041072"},{txt:"공주", val:"NATH20438"},{txt:"관촌", val:"NAT040496"},
  			{txt:"광명", val:"NATH10219"},{txt:"광양", val:"NAT881708"},{txt:"광운대", val:"NAT130182"},{txt:"광주", val:"NAT883012"},
  			{txt:"광주송정", val:"NAT031857"},{txt:"광천", val:"NAT080749"},{txt:"구례구", val:"NAT041285"},{txt:"구미", val:"NAT012775"},
  			{txt:"구포", val:"NAT014281"},{txt:"군북", val:"NAT880608"},{txt:"군산", val:"NAT081388"},{txt:"극락강", val:"NAT883086"},
  			{txt:"기장", val:"NAT750329"},{txt:"김유정", val:"NAT140787"},{txt:"김제", val:"NAT031056"},{txt:"김천", val:"NAT012546"},
  			{txt:"김천구미", val:"NATH12383"}];
  var na = [{txt:"나전", val:"NAT610326"},{txt:"나주", val:"NAT031998"},{txt:"남성현", val:"NAT013542"},{txt:"남원", val:"NAT040868"},
  			{txt:"남창", val:"NAT750560"},{txt:"남춘천", val:"NAT140840"},{txt:"남평", val:"NAT882847"},{txt:"노량진", val:"NAT010058"},
  			{txt:"논산", val:"NAT030508"},{txt:"능곡", val:"NAT110165"},{txt:"능주", val:"NAT882666"}];
  var da = [{txt:"다시", val:"NAT032099"},{txt:"단양", val:"NAT021784"},{txt:"덕하", val:"NAT750653"},{txt:"대광리", val:"NAT130844"},
  			{txt:"대구", val:"NAT013239"},{txt:"대성리", val:"NAT140362"},{txt:"대야", val:"NAT320131"},{txt:"대전", val:"NAT011668"},
  			{txt:"대천", val:"NAT080952"},{txt:"덕소", val:"NAT020178"},{txt:"도계", val:"NAT601122"},{txt:"도고온천", val:"NAT080309"},
  			{txt:"도담", val:"NAT021723"},{txt:"도라산", val:"NAT110557"},{txt:"동대구", val:"NAT013271"},{txt:"동두천", val:"NAT130531"},
  			{txt:"동래", val:"NAT750106"},{txt:"동백산", val:"NAT651053"},{txt:"동산", val:"NAT040173"},{txt:"동점", val:"동점"},
  			{txt:"동탄", val:"NATH30326"},{txt:"동화", val:"NAT020986"},{txt:"동해", val:"NAT601485"},{txt:"둔내", val:"NATN10428"},
  			{txt:"득량", val:"NAT882237"}];
  var ma = [{txt:"마산", val:"NAT880345"},{txt:"마석", val:"NAT140277"},{txt:"만종", val:"NAT021033"},{txt:"망상", val:"NAT601605"},
  			{txt:"망상해변", val:"NAT601602"},{txt:"매곡", val:"NAT020803"},{txt:"명봉", val:"NAT882416"},{txt:"목포", val:"NAT032563"},
  			{txt:"목행", val:"NAT050881"},{txt:"몽탄", val:"NAT032313"},{txt:"무안", val:"NAT032273"},{txt:"묵호", val:"NAT601545"},
  			{txt:"문산", val:"NAT110460"},{txt:"물금", val:"NAT014150"},{txt:"민둥산", val:"NAT650722"},{txt:"밀양", val:"NAT013841"}];
  var ba = [{txt:"반성", val:"NAT880766"},{txt:"반곡", val:"NAT021175"},{txt:"백마고지", val:"NAT130944"},{txt:"백양리", val:"NAT140681"},
  			{txt:"백양사", val:"NAT031486"},{txt:"벌교", val:"NAT882034"},{txt:"별어곡", val:"NAT610064"},{txt:"보성", val:"NAT882328"},
  			{txt:"봉성", val:"NAT600257"},{txt:"봉양", val:"NAT021478"},{txt:"봉화", val:"NAT600147"},{txt:"부강", val:"NAT011403"},
  			{txt:"부발", val:"NAT250428"},{txt:"부산", val:"NAT014445"},{txt:"부전", val:"NAT750046"},{txt:"부조", val:"NAT751354"},
  			{txt:"부천", val:"NAT060121"},{txt:"북영천", val:"NAT023424"},{txt:"북울산", val:"NAT750781"},{txt:"북천", val:"NAT881269"},
  			{txt:"분천", val:"NAT600593"},{txt:"비동", val:"NAT600635"}];
  var sa = [{txt:"사곡", val:"NAT012821"},{txt:"사릉", val:"NAT140133"},{txt:"사방", val:"NAT751238"},{txt:"사북", val:"NAT650782"},
  			{txt:"사상", val:"NAT014331"},{txt:"삼랑진", val:"NAT013967"},{txt:"삼례", val:"NAT040133"},{txt:"삼산", val:"NAT020884"},
  			{txt:"삼척해변", val:"NAT630078"},{txt:"삼탄", val:"NAT051006"},{txt:"삽교", val:"NAT080492"},{txt:"상동", val:"NAT013747"},
  			{txt:"상봉", val:"NAT020040"},{txt:"상주", val:"NAT300360"},{txt:"서경주", val:"NAT023821"},{txt:"서광주", val:"NAT882936"},
  			{txt:"서대구", val:"NAT013189"},{txt:"서빙고", val:"NAT130036"},{txt:"서대전", val:"NAT030057"},{txt:"서울", val:"NAT010000"},
  			{txt:"서원주", val:"NAT020864"},{txt:"서정리", val:"NAT010670"},{txt:"서천", val:"NAT081343"},{txt:"석불", val:"NAT020717"},
  			{txt:"석포", val:"NAT600768"},{txt:"선평", val:"NAT610137"},{txt:"성환", val:"NAT010848"},{txt:"센텀", val:"NAT750161"},
  			{txt:"소요산", val:"NAT130556"},{txt:"소정리", val:"NAT011079"},{txt:"송정", val:"NAT750254"},{txt:"수서", val:"NATH30000"},
  			{txt:"수원", val:"NAT010415"},{txt:"순천", val:"NAT041595"},{txt:"승부", val:"NAT600692"},{txt:"신경주", val:"NATH13421"},
  			{txt:"신기", val:"NAT601275"},{txt:"신나원", val:"NAT8B0082"},{txt:"신녕", val:"NAT023279"},{txt:"신도림", val:"NAT010106"},
  			{txt:"신동", val:"NAT013067"},{txt:"신례원", val:"NAT080353"},{txt:"신리", val:"NAT040352"},{txt:"신림", val:"NAT021357"},
  			{txt:"신망리", val:"NAT130774"},{txt:"신안강", val:"NAT8B0190"},{txt:"신웅천", val:"NAT081099"},{txt:"신창", val:"NAT080216"},
  			{txt:"신창원", val:"NAT810048"},{txt:"신탄리", val:"NAT130888"},{txt:"신탄진", val:"NAT011524"},{txt:"신태인", val:"NAT031179"},
  			{txt:"신해운대", val:"NAT750189"},{txt:"심천", val:"NAT012016"},{txt:"쌍룡", val:"NAT650177"}];
  var oa = [{txt:"아산", val:"NAT080045"},{txt:"아신", val:"NAT020471"},{txt:"아우라지", val:"NAT610387"},{txt:"아포", val:"NAT012700"},
  			{txt:"아화", val:"NAT023601"},{txt:"안강", val:"NAT751296"},{txt:"안동", val:"NAT022558"},{txt:"안양", val:"NAT010239"},
  			{txt:"앙성온천", val:"NAT280358"},{txt:"약목", val:"NAT012903"},{txt:"양동", val:"NAT020845"},
  			{txt:"양보", val:"NAT881323"},{txt:"양원", val:"NAT600655"},{txt:"양자동", val:"NAT751325"},{txt:"양평", val:"NAT020524"},
  			{txt:"여수EXPO", val:"NAT041993"},{txt:"여천", val:"NAT041866"},{txt:"연당", val:"NAT650253"},{txt:"연무대", val:"NAT340090"},
  			{txt:"연산", val:"NAT030396"},{txt:"연천", val:"NAT130738"},{txt:"영덕", val:"NAT8B0737"},{txt:"영동", val:"NAT012124"},
  			{txt:"영등포", val:"NAT010091"},{txt:"영월", val:"NAT650341"},{txt:"영주", val:"NAT022188"},{txt:"영천", val:"NAT023449"},
  			{txt:"예당", val:"NAT882194"},{txt:"예미", val:"NAT650515"},{txt:"예산", val:"NAT080402"},{txt:"예천", val:"NAT300850"},
  			{txt:"오근장", val:"NAT050215"},{txt:"오산", val:"NAT010570"},{txt:"오송", val:"NAT050044"},{txt:"오수", val:"NAT040667"},
  			{txt:"옥곡", val:"NAT881584"},{txt:"옥산", val:"NAT300200"},{txt:"옥수", val:"NAT130070"},{txt:"옥천", val:"NAT011833"},
  			{txt:"온양온천", val:"NAT080147"},{txt:"완사", val:"NAT881168"},{txt:"왕십리", val:"NAT130104"},{txt:"왜관", val:"NAT012968"},
  			{txt:"용궁", val:"NAT300669"},{txt:"용동", val:"NAT030667"},{txt:"용문", val:"NAT020641"},{txt:"용산", val:"NAT010032"},
  			{txt:"운천", val:"NAT110497"},{txt:"울산(통도사)", val:"NATH13717"},{txt:"율촌", val:"NAT041710"},{txt:"원동", val:"NAT014058"},
  			{txt:"원북", val:"NAT880644"},{txt:"원주", val:"NAT020947"},{txt:"월포", val:"NAT8B0504"},{txt:"음성", val:"NAT050596"},
  			{txt:"의성", val:"NAT022844"},{txt:"의정부", val:"NAT130312"},{txt:"이양", val:"NAT882544"},{txt:"이원", val:"NAT011916"},
  			{txt:"익산", val:"NAT030879"},{txt:"인천공항T1", val:"NATC10580"},{txt:"인천공항T2", val:"NATC30058"}, {txt:"일로", val:"NAT032422"},
  			{txt:"일산", val:"NAT110249"},{txt:"일신", val:"NAT020760"},{txt:"임기", val:"NAT600476"},{txt:"임성리", val:"NAT032489"},
  			{txt:"임실", val:"NAT040536"},{txt:"임진강", val:"NAT110520"},{txt:"입실", val:"NAT750933"}];
  var ja = [{txt:"장락", val:"NAT650050"},{txt:"장사", val:"NAT8B0595"},{txt:"장성", val:"NAT031638"},{txt:"장항", val:"NAT081318"},
  			{txt:"좌천", val:"NAT750412"},{txt:"전곡", val:"NAT130652"},{txt:"전의", val:"NAT011154"},{txt:"전주", val:"NAT040257"},
  			{txt:"점촌", val:"NAT300600"},{txt:"정동진", val:"NAT601774"},{txt:"정선", val:"NAT610226"},{txt:"정읍", val:"NAT031314"},
  			{txt:"제천", val:"NAT021549"},{txt:"조성", val:"NAT882141"},{txt:"조치원", val:"NAT011298"},{txt:"주덕", val:"NAT050719"},
  			{txt:"주안", val:"NAT060231"},{txt:"중리", val:"NAT880408"},{txt:"증평", val:"NAT050366"},{txt:"지탄", val:"NAT011972"},
  			{txt:"지평", val:"NAT020677"},{txt:"진례", val:"NAT880179"},{txt:"진부(오대산)", val:"NATN10787"},{txt:"진상", val:"NAT881538"},
  			{txt:"진성", val:"NAT880825"},{txt:"진영", val:"NAT880177"},{txt:"진주", val:"NAT881014"},{txt:"진해", val:"NAT810195"}];
  var cha = [{txt:"창원", val:"NAT880310"},{txt:"창원중앙", val:"NAT880281"},{txt:"천안", val:"NAT010971"},{txt:"천안아산", val:"NATH10960"},
  			 {txt:"철암", val:"NAT600870"},{txt:"청도", val:"NAT013629"},{txt:"청량리", val:"NAT130126"},{txt:"청리", val:"NAT300271"},
  			 {txt:"청소", val:"NAT080827"},{txt:"청주", val:"NAT050114"},{txt:"청주공항", val:"NAT050244"},{txt:"청평", val:"NAT140436"},
  			 {txt:"초성리", val:"NAT130597"},{txt:"추암", val:"NAT630064"},{txt:"추전", val:"NAT650918"},{txt:"추풍령", val:"NAT012355"},
  			 {txt:"춘양", val:"NAT600379"},{txt:"춘천", val:"NAT140873"},{txt:"충주", val:"NAT050827"}];
  var ta = [{txt:"탄현", val:"NAT110265"},{txt:"탑리", val:"NAT022961"},{txt:"태백", val:"NAT650978"},{txt:"태화강", val:"NAT750726"},
  			{txt:"퇴계원", val:"NAT140098"}];
  var pa = [{txt:"파주", val:"NAT110407"},{txt:"판교", val:"NAT081240"},{txt:"평내호평", val:"NAT140214"},{txt:"평창", val:"NATN10625"},
  			{txt:"평촌", val:"NAT880702"},{txt:"평택", val:"NAT010754"},{txt:"평택지제", val:"NATH30536"},{txt:"포항", val:"NAT8B0351"},
  			{txt:"풍기", val:"NAT022053"}];
  var ha = [{txt:"하동", val:"NAT881460"},{txt:"하양", val:"NAT830200"},{txt:"한림정", val:"NAT880099"},{txt:"한탄강", val:"NAT130627"},
  			{txt:"함백", val:"NAT650567"},{txt:"함안", val:"NAT880520"},{txt:"함열", val:"NAT030718"},{txt:"함창", val:"NAT300558"},
  			{txt:"함평", val:"NAT032212"},{txt:"행신", val:"NAT110147"},{txt:"현동", val:"NAT600527"},{txt:"홍성", val:"NAT080622"},
  			{txt:"화명", val:"NAT014244"},{txt:"화본", val:"NAT023127"},{txt:"화순", val:"NAT882755"},{txt:"황간", val:"NAT012270"},
  			{txt:"횡성", val:"NATN10230"},{txt:"횡천", val:"NAT881386"},{txt:"효문", val:"NAT750760"},{txt:"효자", val:"NAT751418"},
  			{txt:"효천", val:"NAT882904"},{txt:"흑석리", val:"NAT030173"}];
  			
  var target = document.getElementById("addressKindD3");

  if(e.value == "a") var d = ga;
  else if(e.value == "b") var d = na;
  else if(e.value == "c") var d = da;
  else if(e.value == "d") var d = ma;
  else if(e.value == "e") var d = ba;
  else if(e.value == "f") var d = sa;
  else if(e.value == "g") var d = oa;
  else if(e.value == "h") var d = ja;
  else if(e.value == "i") var d = cha;
  else if(e.value == "j") var d = ta;
  else if(e.value == "k") var d = pa;
  else if(e.value == "l") var d = ha;

  target.options.length = 0;

  for (x in d) {
      var opt = document.createElement("option");
      opt.value = d[x].val;
      opt.innerHTML = d[x].txt;
      target.appendChild(opt);
  }   
}

function addressKindChange4(e) {
  var ga = [{txt:"가남", val:"NAT280090"},{txt:"가평", val:"NAT140576"},{txt:"각계", val:"NAT012054"},{txt:"감곡장호원", val:"NAT280212"},
  			{txt:"강경", val:"NAT030607"},{txt:"강구", val:"NAT8B0671"},{txt:"강릉", val:"NAT601936"},{txt:"강촌", val:"NAT140701"},
  			{txt:"검암", val:"NATC10325"},{txt:"개포", val:"NAT300733"},{txt:"경산", val:"NAT013395"},{txt:"계룡", val:"NAT030254"},
  			{txt:"고한", val:"NAT650828"},{txt:"곡성", val:"NAT041072"},{txt:"공주", val:"NATH20438"},{txt:"관촌", val:"NAT040496"},
  			{txt:"광명", val:"NATH10219"},{txt:"광양", val:"NAT881708"},{txt:"광운대", val:"NAT130182"},{txt:"광주", val:"NAT883012"},
  			{txt:"광주송정", val:"NAT031857"},{txt:"광천", val:"NAT080749"},{txt:"구례구", val:"NAT041285"},{txt:"구미", val:"NAT012775"},
  			{txt:"구포", val:"NAT014281"},{txt:"군북", val:"NAT880608"},{txt:"군산", val:"NAT081388"},{txt:"극락강", val:"NAT883086"},
  			{txt:"기장", val:"NAT750329"},{txt:"김유정", val:"NAT140787"},{txt:"김제", val:"NAT031056"},{txt:"김천", val:"NAT012546"},
  			{txt:"김천구미", val:"NATH12383"}];
  var na = [{txt:"나전", val:"NAT610326"},{txt:"나주", val:"NAT031998"},{txt:"남성현", val:"NAT013542"},{txt:"남원", val:"NAT040868"},
  			{txt:"남창", val:"NAT750560"},{txt:"남춘천", val:"NAT140840"},{txt:"남평", val:"NAT882847"},{txt:"노량진", val:"NAT010058"},
  			{txt:"논산", val:"NAT030508"},{txt:"능곡", val:"NAT110165"},{txt:"능주", val:"NAT882666"}];
  var da = [{txt:"다시", val:"NAT032099"},{txt:"단양", val:"NAT021784"},{txt:"덕하", val:"NAT750653"},{txt:"대광리", val:"NAT130844"},
  			{txt:"대구", val:"NAT013239"},{txt:"대성리", val:"NAT140362"},{txt:"대야", val:"NAT320131"},{txt:"대전", val:"NAT011668"},
  			{txt:"대천", val:"NAT080952"},{txt:"덕소", val:"NAT020178"},{txt:"도계", val:"NAT601122"},{txt:"도고온천", val:"NAT080309"},
  			{txt:"도담", val:"NAT021723"},{txt:"도라산", val:"NAT110557"},{txt:"동대구", val:"NAT013271"},{txt:"동두천", val:"NAT130531"},
  			{txt:"동래", val:"NAT750106"},{txt:"동백산", val:"NAT651053"},{txt:"동산", val:"NAT040173"},{txt:"동점", val:"동점"},
  			{txt:"동탄", val:"NATH30326"},{txt:"동화", val:"NAT020986"},{txt:"동해", val:"NAT601485"},{txt:"둔내", val:"NATN10428"},
  			{txt:"득량", val:"NAT882237"}];
  var ma = [{txt:"마산", val:"NAT880345"},{txt:"마석", val:"NAT140277"},{txt:"만종", val:"NAT021033"},{txt:"망상", val:"NAT601605"},
  			{txt:"망상해변", val:"NAT601602"},{txt:"매곡", val:"NAT020803"},{txt:"명봉", val:"NAT882416"},{txt:"목포", val:"NAT032563"},
  			{txt:"목행", val:"NAT050881"},{txt:"몽탄", val:"NAT032313"},{txt:"무안", val:"NAT032273"},{txt:"묵호", val:"NAT601545"},
  			{txt:"문산", val:"NAT110460"},{txt:"물금", val:"NAT014150"},{txt:"민둥산", val:"NAT650722"},{txt:"밀양", val:"NAT013841"}];
  var ba = [{txt:"반성", val:"NAT880766"},{txt:"반곡", val:"NAT021175"},{txt:"백마고지", val:"NAT130944"},{txt:"백양리", val:"NAT140681"},
  			{txt:"백양사", val:"NAT031486"},{txt:"벌교", val:"NAT882034"},{txt:"별어곡", val:"NAT610064"},{txt:"보성", val:"NAT882328"},
  			{txt:"봉성", val:"NAT600257"},{txt:"봉양", val:"NAT021478"},{txt:"봉화", val:"NAT600147"},{txt:"부강", val:"NAT011403"},
  			{txt:"부발", val:"NAT250428"},{txt:"부산", val:"NAT014445"},{txt:"부전", val:"NAT750046"},{txt:"부조", val:"NAT751354"},
  			{txt:"부천", val:"NAT060121"},{txt:"북영천", val:"NAT023424"},{txt:"북울산", val:"NAT750781"},{txt:"북천", val:"NAT881269"},
  			{txt:"분천", val:"NAT600593"},{txt:"비동", val:"NAT600635"}];
  var sa = [{txt:"사곡", val:"NAT012821"},{txt:"사릉", val:"NAT140133"},{txt:"사방", val:"NAT751238"},{txt:"사북", val:"NAT650782"},
  			{txt:"사상", val:"NAT014331"},{txt:"삼랑진", val:"NAT013967"},{txt:"삼례", val:"NAT040133"},{txt:"삼산", val:"NAT020884"},
  			{txt:"삼척해변", val:"NAT630078"},{txt:"삼탄", val:"NAT051006"},{txt:"삽교", val:"NAT080492"},{txt:"상동", val:"NAT013747"},
  			{txt:"상봉", val:"NAT020040"},{txt:"상주", val:"NAT300360"},{txt:"서경주", val:"NAT023821"},{txt:"서광주", val:"NAT882936"},
  			{txt:"서대구", val:"NAT013189"},{txt:"서빙고", val:"NAT130036"},{txt:"서대전", val:"NAT030057"},{txt:"서울", val:"NAT010000"},
  			{txt:"서원주", val:"NAT020864"},{txt:"서정리", val:"NAT010670"},{txt:"서천", val:"NAT081343"},{txt:"석불", val:"NAT020717"},
  			{txt:"석포", val:"NAT600768"},{txt:"선평", val:"NAT610137"},{txt:"성환", val:"NAT010848"},{txt:"센텀", val:"NAT750161"},
  			{txt:"소요산", val:"NAT130556"},{txt:"소정리", val:"NAT011079"},{txt:"송정", val:"NAT750254"},{txt:"수서", val:"NATH30000"},
  			{txt:"수원", val:"NAT010415"},{txt:"순천", val:"NAT041595"},{txt:"승부", val:"NAT600692"},{txt:"신경주", val:"NATH13421"},
  			{txt:"신기", val:"NAT601275"},{txt:"신나원", val:"NAT8B0082"},{txt:"신녕", val:"NAT023279"},{txt:"신도림", val:"NAT010106"},
  			{txt:"신동", val:"NAT013067"},{txt:"신례원", val:"NAT080353"},{txt:"신리", val:"NAT040352"},{txt:"신림", val:"NAT021357"},
  			{txt:"신망리", val:"NAT130774"},{txt:"신안강", val:"NAT8B0190"},{txt:"신웅천", val:"NAT081099"},{txt:"신창", val:"NAT080216"},
  			{txt:"신창원", val:"NAT810048"},{txt:"신탄리", val:"NAT130888"},{txt:"신탄진", val:"NAT011524"},{txt:"신태인", val:"NAT031179"},
  			{txt:"신해운대", val:"NAT750189"},{txt:"심천", val:"NAT012016"},{txt:"쌍룡", val:"NAT650177"}];
  var oa = [{txt:"아산", val:"NAT080045"},{txt:"아신", val:"NAT020471"},{txt:"아우라지", val:"NAT610387"},{txt:"아포", val:"NAT012700"},
  			{txt:"아화", val:"NAT023601"},{txt:"안강", val:"NAT751296"},{txt:"안동", val:"NAT022558"},{txt:"안양", val:"NAT010239"},
  			{txt:"앙성온천", val:"NAT280358"},{txt:"약목", val:"NAT012903"},{txt:"양동", val:"NAT020845"},
  			{txt:"양보", val:"NAT881323"},{txt:"양원", val:"NAT600655"},{txt:"양자동", val:"NAT751325"},{txt:"양평", val:"NAT020524"},
  			{txt:"여수EXPO", val:"NAT041993"},{txt:"여천", val:"NAT041866"},{txt:"연당", val:"NAT650253"},{txt:"연무대", val:"NAT340090"},
  			{txt:"연산", val:"NAT030396"},{txt:"연천", val:"NAT130738"},{txt:"영덕", val:"NAT8B0737"},{txt:"영동", val:"NAT012124"},
  			{txt:"영등포", val:"NAT010091"},{txt:"영월", val:"NAT650341"},{txt:"영주", val:"NAT022188"},{txt:"영천", val:"NAT023449"},
  			{txt:"예당", val:"NAT882194"},{txt:"예미", val:"NAT650515"},{txt:"예산", val:"NAT080402"},{txt:"예천", val:"NAT300850"},
  			{txt:"오근장", val:"NAT050215"},{txt:"오산", val:"NAT010570"},{txt:"오송", val:"NAT050044"},{txt:"오수", val:"NAT040667"},
  			{txt:"옥곡", val:"NAT881584"},{txt:"옥산", val:"NAT300200"},{txt:"옥수", val:"NAT130070"},{txt:"옥천", val:"NAT011833"},
  			{txt:"온양온천", val:"NAT080147"},{txt:"완사", val:"NAT881168"},{txt:"왕십리", val:"NAT130104"},{txt:"왜관", val:"NAT012968"},
  			{txt:"용궁", val:"NAT300669"},{txt:"용동", val:"NAT030667"},{txt:"용문", val:"NAT020641"},{txt:"용산", val:"NAT010032"},
  			{txt:"운천", val:"NAT110497"},{txt:"울산(통도사)", val:"NATH13717"},{txt:"율촌", val:"NAT041710"},{txt:"원동", val:"NAT014058"},
  			{txt:"원북", val:"NAT880644"},{txt:"원주", val:"NAT020947"},{txt:"월포", val:"NAT8B0504"},{txt:"음성", val:"NAT050596"},
  			{txt:"의성", val:"NAT022844"},{txt:"의정부", val:"NAT130312"},{txt:"이양", val:"NAT882544"},{txt:"이원", val:"NAT011916"},
  			{txt:"익산", val:"NAT030879"},{txt:"인천공항T1", val:"NATC10580"},{txt:"인천공항T2", val:"NATC30058"}, {txt:"일로", val:"NAT032422"},
  			{txt:"일산", val:"NAT110249"},{txt:"일신", val:"NAT020760"},{txt:"임기", val:"NAT600476"},{txt:"임성리", val:"NAT032489"},
  			{txt:"임실", val:"NAT040536"},{txt:"임진강", val:"NAT110520"},{txt:"입실", val:"NAT750933"}];
  var ja = [{txt:"장락", val:"NAT650050"},{txt:"장사", val:"NAT8B0595"},{txt:"장성", val:"NAT031638"},{txt:"장항", val:"NAT081318"},
  			{txt:"좌천", val:"NAT750412"},{txt:"전곡", val:"NAT130652"},{txt:"전의", val:"NAT011154"},{txt:"전주", val:"NAT040257"},
  			{txt:"점촌", val:"NAT300600"},{txt:"정동진", val:"NAT601774"},{txt:"정선", val:"NAT610226"},{txt:"정읍", val:"NAT031314"},
  			{txt:"제천", val:"NAT021549"},{txt:"조성", val:"NAT882141"},{txt:"조치원", val:"NAT011298"},{txt:"주덕", val:"NAT050719"},
  			{txt:"주안", val:"NAT060231"},{txt:"중리", val:"NAT880408"},{txt:"증평", val:"NAT050366"},{txt:"지탄", val:"NAT011972"},
  			{txt:"지평", val:"NAT020677"},{txt:"진례", val:"NAT880179"},{txt:"진부(오대산)", val:"NATN10787"},{txt:"진상", val:"NAT881538"},
  			{txt:"진성", val:"NAT880825"},{txt:"진영", val:"NAT880177"},{txt:"진주", val:"NAT881014"},{txt:"진해", val:"NAT810195"}];
  var cha = [{txt:"창원", val:"NAT880310"},{txt:"창원중앙", val:"NAT880281"},{txt:"천안", val:"NAT010971"},{txt:"천안아산", val:"NATH10960"},
  			 {txt:"철암", val:"NAT600870"},{txt:"청도", val:"NAT013629"},{txt:"청량리", val:"NAT130126"},{txt:"청리", val:"NAT300271"},
  			 {txt:"청소", val:"NAT080827"},{txt:"청주", val:"NAT050114"},{txt:"청주공항", val:"NAT050244"},{txt:"청평", val:"NAT140436"},
  			 {txt:"초성리", val:"NAT130597"},{txt:"추암", val:"NAT630064"},{txt:"추전", val:"NAT650918"},{txt:"추풍령", val:"NAT012355"},
  			 {txt:"춘양", val:"NAT600379"},{txt:"춘천", val:"NAT140873"},{txt:"충주", val:"NAT050827"}];
  var ta = [{txt:"탄현", val:"NAT110265"},{txt:"탑리", val:"NAT022961"},{txt:"태백", val:"NAT650978"},{txt:"태화강", val:"NAT750726"},
  			{txt:"퇴계원", val:"NAT140098"}];
  var pa = [{txt:"파주", val:"NAT110407"},{txt:"판교", val:"NAT081240"},{txt:"평내호평", val:"NAT140214"},{txt:"평창", val:"NATN10625"},
  			{txt:"평촌", val:"NAT880702"},{txt:"평택", val:"NAT010754"},{txt:"평택지제", val:"NATH30536"},{txt:"포항", val:"NAT8B0351"},
  			{txt:"풍기", val:"NAT022053"}];
  var ha = [{txt:"하동", val:"NAT881460"},{txt:"하양", val:"NAT830200"},{txt:"한림정", val:"NAT880099"},{txt:"한탄강", val:"NAT130627"},
  			{txt:"함백", val:"NAT650567"},{txt:"함안", val:"NAT880520"},{txt:"함열", val:"NAT030718"},{txt:"함창", val:"NAT300558"},
  			{txt:"함평", val:"NAT032212"},{txt:"행신", val:"NAT110147"},{txt:"현동", val:"NAT600527"},{txt:"홍성", val:"NAT080622"},
  			{txt:"화명", val:"NAT014244"},{txt:"화본", val:"NAT023127"},{txt:"화순", val:"NAT882755"},{txt:"황간", val:"NAT012270"},
  			{txt:"횡성", val:"NATN10230"},{txt:"횡천", val:"NAT881386"},{txt:"효문", val:"NAT750760"},{txt:"효자", val:"NAT751418"},
  			{txt:"효천", val:"NAT882904"},{txt:"흑석리", val:"NAT030173"}];
  			
  var target = document.getElementById("addressKindD4");

  if(e.value == "a") var d = ga;
  else if(e.value == "b") var d = na;
  else if(e.value == "c") var d = da;
  else if(e.value == "d") var d = ma;
  else if(e.value == "e") var d = ba;
  else if(e.value == "f") var d = sa;
  else if(e.value == "g") var d = oa;
  else if(e.value == "h") var d = ja;
  else if(e.value == "i") var d = cha;
  else if(e.value == "j") var d = ta;
  else if(e.value == "k") var d = pa;
  else if(e.value == "l") var d = ha;

  target.options.length = 0;

  for (x in d) {
      var opt = document.createElement("option");
      opt.value = d[x].val;
      opt.innerHTML = d[x].txt;
      target.appendChild(opt);
  }   
}
