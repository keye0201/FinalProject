function addressKindChange(e) {

  var seoul = [{txt:"서울경부", val:"NAEK010"}, {txt:"센트럴시티", val:"NAEK020"}, {txt:"동서울", val:"NAEK032"}, {txt:"상봉", val:"NAEK040"}];
  var incheon = [{txt:"인천", val:"NAEK100"}, {txt:"성남", val:"NAEK120"}, {txt:"수원", val:"NAEK110"}, {txt:"인천공항T1", val:"NAEK105"},
  				 {txt:"인천공항T2", val:"NAEK117"}, {txt:"안산", val:"NAEK190"}, {txt:"안성중대", val:"NAEK131"}, {txt:"이천", val:"NAEK160"},
  				 {txt:"용인", val:"NAEK150"}, {txt:"고양백석", val:"NAEK116"}, {txt:"고양화정", val:"NAEK115"}, {txt:"광명(KTX역)", val:"NAEK125"},
  				 {txt:"광명(철산역)", val:"NAEK126"}, {txt:"구리", val:"NAEK169"}, {txt:"부천", val:"NAEK101"}, {txt:"서수원", val:"NAEK109"},
				 {txt:"신갈시외", val:"NAEK114"}, {txt:"신갈영덕", val:"NAEK119"}, {txt:"시흥(시화)", val:"NAEK195"}, {txt:"안성", val:"NAEK130"},
  				 {txt:"안성공도", val:"NAEK133"}, {txt:"안성대림", val:"NAEK137"}, {txt:"안성풍림", val:"NAEK132"}, {txt:"안성한경", val:"NAEK134"},
 				 {txt:"안성회관", val:"NAEK138"}, {txt:"안중", val:"NAEK177"}, {txt:"안중오거리", val:"NAEK176"}, {txt:"여주", val:"NAEK140"},
 				 {txt:"여주대", val:"NAEK139"}, {txt:"오산", val:"NAEK127"}, {txt:"용인신갈", val:"NAEK111"},
 				 {txt:"용인유림", val:"NAEK149"}, {txt:"의정부", val:"NAEK170"}, {txt:"이천(마장택지구)", val:"NAEK171"}, {txt:"이천부발(신하리)", val:"NAEK172"}, 
  				 {txt:"죽전", val:"NAEK118"}, {txt:"평택", val:"NAEK180"}, {txt:"평택대", val:"NAEK175"}, {txt:"평택용이", val:"NAEK174"}];
  var gangwon = [{txt:"원주", val:"NAEK240"}, {txt:"속초", val:"NAEK230"}, {txt:"강릉", val:"NAEK200"}, {txt:"동해", val:"NAEK210"},
  				 {txt:"삼척", val:"NAEK220"}, {txt:"양양", val:"NAEK270"}, {txt:"원주기업", val:"NAEK270"}, {txt:"원주문막", val:"NAEK245"},
  				 {txt:"원주혁신", val:"NAEK244"}, {txt:"춘천", val:"NAEK250"}, {txt:"횡성(휴)상행", val:"NAEK239"}, {txt:"횡성(휴)하행", val:"NAEK238"}];
  var daejeon = [{txt:"대전복합", val:"NAEK300"}, {txt:"천안", val:"NAEK310"}, {txt:"서산", val:"NAEK393"}, {txt:"유성", val:"NAEK360"},
  				 {txt:"세종청사", val:"NAEK010"}, {txt:"당진", val:"NAEK010"}, {txt:"공주", val:"NAEK010"}, {txt:"대전청사(샘머리)", val:"NAEK010"},
  				 {txt:"세종터미널", val:"NAEK352"}, {txt:"고대조치원", val:"NAEK355"},  {txt:"금산", val:"NAEK330"}, {txt:"내포", val:"NAEK390"},
  				 {txt:"논산", val:"NAEK370"}, {txt:"당진기지시", val:"NAEK388"}, {txt:"대전도룡", val:"NAEK307"}, {txt:"덕산스파", val:"NAEK399"},
  				 {txt:"배방정류소", val:"NAEK337"}, {txt:"선문대", val:"NAEK347"}, {txt:"세종국무조정실", val:"NAEK361"}, {txt:"세종시청", val:"NAEK362"},
  				 {txt:"세종연구단지", val:"NAEK358"}, {txt:"안면도", val:"NAEK396"}, {txt:"아산둔포", val:"NAEK344"}, {txt:"아산서부(호서대)", val:"NAEK341"},
  				 {txt:"아산온양", val:"NAEK340"}, {txt:"아산탕정", val:"NAEK342"}, {txt:"아산테크노밸리", val:"NAEK338"}, {txt:"연무대", val:"NAEK380"},
  				 {txt:"예산", val:"NAEK398"}, {txt:"인삼랜드(휴)상행", val:"NAEK325"}, {txt:"인삼랜드(휴)하행", val:"NAEK324"}, {txt:"정산", val:"NAEK392"}, 
 				 {txt:"정안(휴)상행", val:"NAEK316"}, {txt:"정안(휴)하행", val:"NAEK315"}, {txt:"조치원", val:"NAEK350"}, {txt:"창기리", val:"NAEK397"},
 				 {txt:"천안공단", val:"NAEK346"}, {txt:"천안아산역", val:"NAEK343"}, {txt:"청양", val:"NAEK391"}, {txt:"탕정삼성", val:"NAEK349"},
 				 {txt:"태안", val:"NAEK394"}, {txt:"홍대조치원", val:"NAEK354"}, {txt:"홍성", val:"NAEK389"}];
  var chungbug = [{txt:"청주(센트럴)", val:"NAEK401"}, {txt:"충주", val:"NAEK420"}, {txt:"청주고속터미널", val:"NAEK400"}, {txt:"북청주(청주대)", val:"NAEK405"},
  				  {txt:"서충주", val:"NAEK421"}, {txt:"제천", val:"NAEK450"}, {txt:"제천하소", val:"NAEK449"},
  				  {txt:"청주공항", val:"NAEK407"}, {txt:"청주북부터미널", val:"NAEK406"}, {txt:"황간", val:"NAEK440"}];
  var gwangju = [{txt:"광주(유스퀘어)", val:"NAEK500"}, {txt:"순천", val:"NAEK515"}, {txt:"목포", val:"NAEK505"}, {txt:"여수", val:"NAEK510"},
  				 {txt:"강진", val:"NAEK535"}, {txt:"고흥", val:"NAEK540"}, {txt:"광양", val:"NAEK520"}, {txt:"광주비아", val:"NAEK503"},
  				 {txt:"구례", val:"NAEK519"}, {txt:"남악", val:"NAEK592"}, {txt:"나주", val:"NAEK592"}, 
  				 {txt:"녹동", val:"NAEK545"}, {txt:"능주", val:"NAEK587"}, {txt:"담양", val:"NAEK582"}, {txt:"동광양", val:"NAEK525"}, 
  				 {txt:"문장", val:"NAEK584"}, {txt:"무안", val:"NAEK550"}, {txt:"벌교", val:"NAEK555"}, {txt:"보성", val:"NAEK554"},
  				 {txt:"섬진강(휴)상행", val:"NAEK529"}, {txt:"섬진강(휴)하행", val:"NAEK528"}, {txt:"순천신대지구", val:"NAEK513"},
  				 {txt:"순천신대지구CGV", val:"NAEK512"}, {txt:"영광", val:"NAEK560"}, {txt:"영산포", val:"NAEK565"}, {txt:"영암", val:"NAEK570"},
  				 {txt:"여천", val:"NAEK509"}, {txt:"옥과", val:"NAEK588"}, {txt:"완도", val:"NAEK575"}, {txt:"원동", val:"NAEK578"},
  				 {txt:"임자대광", val:"NAEK593"}, {txt:"임자진리", val:"NAEK594"}, {txt:"장성", val:"NAEK583"}, {txt:"고흥", val:"NAEK540"},
  				 {txt:"진도", val:"NAEK590"}, {txt:"지도", val:"NAEK585"}, {txt:"함평", val:"NAEK581"}, {txt:"해남", val:"NAEK595"},
  				 {txt:"해제", val:"NAEK552"}, {txt:"화순", val:"NAEK586"}];
  var jeonbuk = [{txt:"덕과", val:"NAEK626"}, {txt:"순창", val:"NAEK645"}, {txt:"애통리", val:"NAEK619"}, {txt:"익산", val:"NAEK615"},
  				 {txt:"익산팔봉", val:"NAEK616"}, {txt:"자치인재원", val:"NAEK622"}, {txt:"전북혁신", val:"NAEK621"}, {txt:"전주호남제일문", val:"NAEK605"},
  				 {txt:"정읍", val:"NAEK630"}, {txt:"태인", val:"NAEK629"}, {txt:"흥덕", val:"NAEK634"}];
  var busan = [{txt:"김해장유", val:"NAEK736"}, {txt:"내서", val:"NAEK706"}, {txt:"마산", val:"NAEK705"},
  			   {txt:"울산", val:"NAEK715"}, {txt:"울산신복", val:"NAEK716"}, {txt:"진주개양", val:"NAEK723"}, {txt:"진주혁신", val:"NAEK724"},
  			   {txt:"진해", val:"NAEK704"}, {txt:"창원역", val:"NAEK704"}, {txt:"통영", val:"NAEK730"}];
  var daegu = [{txt:"김천혁신", val:"NAEK821"}, {txt:"낙동강(휴)상행", val:"NAEK824"}, {txt:"낙동강(휴)하행", val:"NAEK823"}, {txt:"대구용계", val:"NAEK807"},
  			   {txt:"대구혁신", val:"NAEK801"}, {txt:"상주", val:"NAEK825"}, {txt:"선산(휴)상행", val:"NAEK813"}, {txt:"선산(휴)하행", val:"NAEK812"},
  			   {txt:"서대구", val:"NAEK805"}, {txt:"안동", val:"NAEK840"}, {txt:"영덕", val:"NAEK843"}, {txt:"영주", val:"NAEK835"},
  			   {txt:"영천", val:"NAEK845"}, {txt:"영천망정", val:"NAEK846"}, {txt:"예천", val:"NAEK851"}, {txt:"점촌", val:"NAEK850"},
  			   {txt:"포항", val:"NAEK830"}, {txt:"포항시청", val:"NAEK828"}, {txt:"풍기", val:"NAEK834"}];
  var target = document.getElementById("addressKindD");

  if(e.value == "a") var d = seoul;
  else if(e.value == "b") var d = incheon;
  else if(e.value == "c") var d = gangwon;
  else if(e.value == "d") var d = daejeon;
  else if(e.value == "e") var d = chungbug;
  else if(e.value == "f") var d = gwangju;
  else if(e.value == "g") var d = jeonbuk;
  else if(e.value == "h") var d = busan;
  else if(e.value == "i") var d = daegu;

  target.options.length = 0;

  for (x in d) {
      var opt = document.createElement("option");
      opt.value = d[x].val;
      opt.innerHTML = d[x].txt;
      target.appendChild(opt);
  }   
}


function addressKindChange2(e) {
  var seoul = [{txt:"서울경부", val:"NAEK010"}, {txt:"센트럴시티", val:"NAEK020"}, {txt:"동서울", val:"NAEK032"}, {txt:"상봉", val:"NAEK040"}];
  var incheon = [{txt:"인천", val:"NAEK100"}, {txt:"성남", val:"NAEK120"}, {txt:"수원", val:"NAEK110"}, {txt:"인천공항T1", val:"NAEK105"},
  				 {txt:"인천공항T2", val:"NAEK117"}, {txt:"안산", val:"NAEK190"}, {txt:"안성중대", val:"NAEK131"}, {txt:"이천", val:"NAEK160"},
  				 {txt:"용인", val:"NAEK150"}, {txt:"고양백석", val:"NAEK116"}, {txt:"고양화정", val:"NAEK115"}, {txt:"광명(KTX역)", val:"NAEK125"},
  				 {txt:"광명(철산역)", val:"NAEK126"}, {txt:"구리", val:"NAEK169"}, {txt:"부천", val:"NAEK101"}, {txt:"서수원", val:"NAEK109"},
				 {txt:"신갈시외", val:"NAEK114"}, {txt:"신갈영덕", val:"NAEK119"}, {txt:"시흥(시화)", val:"NAEK195"}, {txt:"안성", val:"NAEK130"},
  				 {txt:"안성공도", val:"NAEK133"}, {txt:"안성대림", val:"NAEK137"}, {txt:"안성풍림", val:"NAEK132"}, {txt:"안성한경", val:"NAEK134"},
 				 {txt:"안성회관", val:"NAEK138"}, {txt:"안중", val:"NAEK177"}, {txt:"안중오거리", val:"NAEK176"}, {txt:"여주", val:"NAEK140"},
 				 {txt:"여주대", val:"NAEK139"}, {txt:"오산", val:"NAEK127"}, {txt:"용인신갈", val:"NAEK111"},
 				 {txt:"용인유림", val:"NAEK149"}, {txt:"의정부", val:"NAEK170"}, {txt:"이천(마장택지구)", val:"NAEK171"}, {txt:"이천부발(신하리)", val:"NAEK172"}, 
  				 {txt:"죽전", val:"NAEK118"}, {txt:"평택", val:"NAEK180"}, {txt:"평택대", val:"NAEK175"}, {txt:"평택용이", val:"NAEK174"}];
  var gangwon = [{txt:"원주", val:"NAEK240"}, {txt:"속초", val:"NAEK230"}, {txt:"강릉", val:"NAEK200"}, {txt:"동해", val:"NAEK210"},
  				 {txt:"삼척", val:"NAEK220"}, {txt:"양양", val:"NAEK270"}, {txt:"원주기업", val:"NAEK270"}, {txt:"원주문막", val:"NAEK245"},
  				 {txt:"원주혁신", val:"NAEK244"}, {txt:"춘천", val:"NAEK250"}, {txt:"횡성(휴)상행", val:"NAEK239"}, {txt:"횡성(휴)하행", val:"NAEK238"}];
  var daejeon = [{txt:"대전복합", val:"NAEK300"}, {txt:"천안", val:"NAEK310"}, {txt:"서산", val:"NAEK393"}, {txt:"유성", val:"NAEK360"},
  				 {txt:"세종청사", val:"NAEK010"}, {txt:"당진", val:"NAEK010"}, {txt:"공주", val:"NAEK010"}, {txt:"대전청사(샘머리)", val:"NAEK010"},
  				 {txt:"세종터미널", val:"NAEK352"}, {txt:"고대조치원", val:"NAEK355"},  {txt:"금산", val:"NAEK330"}, {txt:"내포", val:"NAEK390"},
  				 {txt:"논산", val:"NAEK370"}, {txt:"당진기지시", val:"NAEK388"}, {txt:"대전도룡", val:"NAEK307"}, {txt:"덕산스파", val:"NAEK399"},
  				 {txt:"배방정류소", val:"NAEK337"}, {txt:"선문대", val:"NAEK347"}, {txt:"세종국무조정실", val:"NAEK361"}, {txt:"세종시청", val:"NAEK362"},
  				 {txt:"세종연구단지", val:"NAEK358"}, {txt:"안면도", val:"NAEK396"}, {txt:"아산둔포", val:"NAEK344"}, {txt:"아산서부(호서대)", val:"NAEK341"},
  				 {txt:"아산온양", val:"NAEK340"}, {txt:"아산탕정", val:"NAEK342"}, {txt:"아산테크노밸리", val:"NAEK338"}, {txt:"연무대", val:"NAEK380"},
  				 {txt:"예산", val:"NAEK398"}, {txt:"인삼랜드(휴)상행", val:"NAEK325"}, {txt:"인삼랜드(휴)하행", val:"NAEK324"}, {txt:"정산", val:"NAEK392"}, 
 				 {txt:"정안(휴)상행", val:"NAEK316"}, {txt:"정안(휴)하행", val:"NAEK315"}, {txt:"조치원", val:"NAEK350"}, {txt:"창기리", val:"NAEK397"},
 				 {txt:"천안공단", val:"NAEK346"}, {txt:"천안아산역", val:"NAEK343"}, {txt:"청양", val:"NAEK391"}, {txt:"탕정삼성", val:"NAEK349"},
 				 {txt:"태안", val:"NAEK394"}, {txt:"홍대조치원", val:"NAEK354"}, {txt:"홍성", val:"NAEK389"}];
  var chungbug = [{txt:"청주(센트럴)", val:"NAEK401"}, {txt:"충주", val:"NAEK420"}, {txt:"청주고속터미널", val:"NAEK400"}, {txt:"북청주(청주대)", val:"NAEK405"},
  				  {txt:"서충주", val:"NAEK421"}, {txt:"제천", val:"NAEK450"}, {txt:"제천하소", val:"NAEK449"},
  				  {txt:"청주공항", val:"NAEK407"}, {txt:"청주북부터미널", val:"NAEK406"}, {txt:"황간", val:"NAEK440"}];
  var gwangju = [{txt:"광주(유스퀘어)", val:"NAEK500"}, {txt:"순천", val:"NAEK515"}, {txt:"목포", val:"NAEK505"}, {txt:"여수", val:"NAEK510"},
  				 {txt:"강진", val:"NAEK535"}, {txt:"고흥", val:"NAEK540"}, {txt:"광양", val:"NAEK520"}, {txt:"광주비아", val:"NAEK503"},
  				 {txt:"구례", val:"NAEK519"}, {txt:"남악", val:"NAEK592"}, {txt:"나주", val:"NAEK592"}, 
  				 {txt:"녹동", val:"NAEK545"}, {txt:"능주", val:"NAEK587"}, {txt:"담양", val:"NAEK582"}, {txt:"동광양", val:"NAEK525"}, 
  				 {txt:"문장", val:"NAEK584"}, {txt:"무안", val:"NAEK550"}, {txt:"벌교", val:"NAEK555"}, {txt:"보성", val:"NAEK554"},
  				 {txt:"섬진강(휴)상행", val:"NAEK529"}, {txt:"섬진강(휴)하행", val:"NAEK528"}, {txt:"순천신대지구", val:"NAEK513"},
  				 {txt:"순천신대지구CGV", val:"NAEK512"}, {txt:"영광", val:"NAEK560"}, {txt:"영산포", val:"NAEK565"}, {txt:"영암", val:"NAEK570"},
  				 {txt:"여천", val:"NAEK509"}, {txt:"옥과", val:"NAEK588"}, {txt:"완도", val:"NAEK575"}, {txt:"원동", val:"NAEK578"},
  				 {txt:"임자대광", val:"NAEK593"}, {txt:"임자진리", val:"NAEK594"}, {txt:"장성", val:"NAEK583"}, {txt:"고흥", val:"NAEK540"},
  				 {txt:"진도", val:"NAEK590"}, {txt:"지도", val:"NAEK585"}, {txt:"함평", val:"NAEK581"}, {txt:"해남", val:"NAEK595"},
  				 {txt:"해제", val:"NAEK552"}, {txt:"화순", val:"NAEK586"}];
  var jeonbuk = [{txt:"덕과", val:"NAEK626"}, {txt:"순창", val:"NAEK645"}, {txt:"애통리", val:"NAEK619"}, {txt:"익산", val:"NAEK615"},
  				 {txt:"익산팔봉", val:"NAEK616"}, {txt:"자치인재원", val:"NAEK622"}, {txt:"전북혁신", val:"NAEK621"}, {txt:"전주호남제일문", val:"NAEK605"},
  				 {txt:"정읍", val:"NAEK630"}, {txt:"태인", val:"NAEK629"}, {txt:"흥덕", val:"NAEK634"}];
  var busan = [{txt:"김해장유", val:"NAEK736"}, {txt:"내서", val:"NAEK706"}, {txt:"마산", val:"NAEK705"},
  			   {txt:"울산", val:"NAEK715"}, {txt:"울산신복", val:"NAEK716"}, {txt:"진주개양", val:"NAEK723"}, {txt:"진주혁신", val:"NAEK724"},
  			   {txt:"진해", val:"NAEK704"}, {txt:"창원역", val:"NAEK704"}, {txt:"통영", val:"NAEK730"}];
  var daegu = [{txt:"김천혁신", val:"NAEK821"}, {txt:"낙동강(휴)상행", val:"NAEK824"}, {txt:"낙동강(휴)하행", val:"NAEK823"}, {txt:"대구용계", val:"NAEK807"},
  			   {txt:"대구혁신", val:"NAEK801"}, {txt:"상주", val:"NAEK825"}, {txt:"선산(휴)상행", val:"NAEK813"}, {txt:"선산(휴)하행", val:"NAEK812"},
  			   {txt:"서대구", val:"NAEK805"}, {txt:"안동", val:"NAEK840"}, {txt:"영덕", val:"NAEK843"}, {txt:"영주", val:"NAEK835"},
  			   {txt:"영천", val:"NAEK845"}, {txt:"영천망정", val:"NAEK846"}, {txt:"예천", val:"NAEK851"}, {txt:"점촌", val:"NAEK850"},
  			   {txt:"포항", val:"NAEK830"}, {txt:"포항시청", val:"NAEK828"}, {txt:"풍기", val:"NAEK834"}];
  var target = document.getElementById("addressKindD2");

  if(e.value == "a") var d = seoul;
  else if(e.value == "b") var d = incheon;
  else if(e.value == "c") var d = gangwon;
  else if(e.value == "d") var d = daejeon;
  else if(e.value == "e") var d = chungbug;
  else if(e.value == "f") var d = gwangju;
  else if(e.value == "g") var d = jeonbuk;
  else if(e.value == "h") var d = busan;
  else if(e.value == "i") var d = daegu;

  target.options.length = 0;

  for (x in d) {
      var opt = document.createElement("option");
      opt.value = d[x].val;
      opt.innerHTML = d[x].txt;
      target.appendChild(opt);
  }   
}

function addressKindChange3(e) {
  var seoul = [{txt:"서울경부", val:"NAEK010"}, {txt:"센트럴시티", val:"NAEK020"}, {txt:"동서울", val:"NAEK032"}, {txt:"상봉", val:"NAEK040"}];
  var incheon = [{txt:"인천", val:"NAEK100"}, {txt:"성남", val:"NAEK120"}, {txt:"수원", val:"NAEK110"}, {txt:"인천공항T1", val:"NAEK105"},
  				 {txt:"인천공항T2", val:"NAEK117"}, {txt:"안산", val:"NAEK190"}, {txt:"안성중대", val:"NAEK131"}, {txt:"이천", val:"NAEK160"},
  				 {txt:"용인", val:"NAEK150"}, {txt:"고양백석", val:"NAEK116"}, {txt:"고양화정", val:"NAEK115"}, {txt:"광명(KTX역)", val:"NAEK125"},
  				 {txt:"광명(철산역)", val:"NAEK126"}, {txt:"구리", val:"NAEK169"}, {txt:"부천", val:"NAEK101"}, {txt:"서수원", val:"NAEK109"},
				 {txt:"신갈시외", val:"NAEK114"}, {txt:"신갈영덕", val:"NAEK119"}, {txt:"시흥(시화)", val:"NAEK195"}, {txt:"안성", val:"NAEK130"},
  				 {txt:"안성공도", val:"NAEK133"}, {txt:"안성대림", val:"NAEK137"}, {txt:"안성풍림", val:"NAEK132"}, {txt:"안성한경", val:"NAEK134"},
 				 {txt:"안성회관", val:"NAEK138"}, {txt:"안중", val:"NAEK177"}, {txt:"안중오거리", val:"NAEK176"}, {txt:"여주", val:"NAEK140"},
 				 {txt:"여주대", val:"NAEK139"}, {txt:"오산", val:"NAEK127"}, {txt:"용인신갈", val:"NAEK111"},
 				 {txt:"용인유림", val:"NAEK149"}, {txt:"의정부", val:"NAEK170"}, {txt:"이천(마장택지구)", val:"NAEK171"}, {txt:"이천부발(신하리)", val:"NAEK172"}, 
  				 {txt:"죽전", val:"NAEK118"}, {txt:"평택", val:"NAEK180"}, {txt:"평택대", val:"NAEK175"}, {txt:"평택용이", val:"NAEK174"}];
  var gangwon = [{txt:"원주", val:"NAEK240"}, {txt:"속초", val:"NAEK230"}, {txt:"강릉", val:"NAEK200"}, {txt:"동해", val:"NAEK210"},
  				 {txt:"삼척", val:"NAEK220"}, {txt:"양양", val:"NAEK270"}, {txt:"원주기업", val:"NAEK270"}, {txt:"원주문막", val:"NAEK245"},
  				 {txt:"원주혁신", val:"NAEK244"}, {txt:"춘천", val:"NAEK250"}, {txt:"횡성(휴)상행", val:"NAEK239"}, {txt:"횡성(휴)하행", val:"NAEK238"}];
  var daejeon = [{txt:"대전복합", val:"NAEK300"}, {txt:"천안", val:"NAEK310"}, {txt:"서산", val:"NAEK393"}, {txt:"유성", val:"NAEK360"},
  				 {txt:"세종청사", val:"NAEK010"}, {txt:"당진", val:"NAEK010"}, {txt:"공주", val:"NAEK010"}, {txt:"대전청사(샘머리)", val:"NAEK010"},
  				 {txt:"세종터미널", val:"NAEK352"}, {txt:"고대조치원", val:"NAEK355"},  {txt:"금산", val:"NAEK330"}, {txt:"내포", val:"NAEK390"},
  				 {txt:"논산", val:"NAEK370"}, {txt:"당진기지시", val:"NAEK388"}, {txt:"대전도룡", val:"NAEK307"}, {txt:"덕산스파", val:"NAEK399"},
  				 {txt:"배방정류소", val:"NAEK337"}, {txt:"선문대", val:"NAEK347"}, {txt:"세종국무조정실", val:"NAEK361"}, {txt:"세종시청", val:"NAEK362"},
  				 {txt:"세종연구단지", val:"NAEK358"}, {txt:"안면도", val:"NAEK396"}, {txt:"아산둔포", val:"NAEK344"}, {txt:"아산서부(호서대)", val:"NAEK341"},
  				 {txt:"아산온양", val:"NAEK340"}, {txt:"아산탕정", val:"NAEK342"}, {txt:"아산테크노밸리", val:"NAEK338"}, {txt:"연무대", val:"NAEK380"},
  				 {txt:"예산", val:"NAEK398"}, {txt:"인삼랜드(휴)상행", val:"NAEK325"}, {txt:"인삼랜드(휴)하행", val:"NAEK324"}, {txt:"정산", val:"NAEK392"}, 
 				 {txt:"정안(휴)상행", val:"NAEK316"}, {txt:"정안(휴)하행", val:"NAEK315"}, {txt:"조치원", val:"NAEK350"}, {txt:"창기리", val:"NAEK397"},
 				 {txt:"천안공단", val:"NAEK346"}, {txt:"천안아산역", val:"NAEK343"}, {txt:"청양", val:"NAEK391"}, {txt:"탕정삼성", val:"NAEK349"},
 				 {txt:"태안", val:"NAEK394"}, {txt:"홍대조치원", val:"NAEK354"}, {txt:"홍성", val:"NAEK389"}];
  var chungbug = [{txt:"청주(센트럴)", val:"NAEK401"}, {txt:"충주", val:"NAEK420"}, {txt:"청주고속터미널", val:"NAEK400"}, {txt:"북청주(청주대)", val:"NAEK405"},
  				  {txt:"서충주", val:"NAEK421"}, {txt:"제천", val:"NAEK450"}, {txt:"제천하소", val:"NAEK449"},
  				  {txt:"청주공항", val:"NAEK407"}, {txt:"청주북부터미널", val:"NAEK406"}, {txt:"황간", val:"NAEK440"}];
  var gwangju = [{txt:"광주(유스퀘어)", val:"NAEK500"}, {txt:"순천", val:"NAEK515"}, {txt:"목포", val:"NAEK505"}, {txt:"여수", val:"NAEK510"},
  				 {txt:"강진", val:"NAEK535"}, {txt:"고흥", val:"NAEK540"}, {txt:"광양", val:"NAEK520"}, {txt:"광주비아", val:"NAEK503"},
  				 {txt:"구례", val:"NAEK519"}, {txt:"남악", val:"NAEK592"}, {txt:"나주", val:"NAEK592"}, 
  				 {txt:"녹동", val:"NAEK545"}, {txt:"능주", val:"NAEK587"}, {txt:"담양", val:"NAEK582"}, {txt:"동광양", val:"NAEK525"}, 
  				 {txt:"문장", val:"NAEK584"}, {txt:"무안", val:"NAEK550"}, {txt:"벌교", val:"NAEK555"}, {txt:"보성", val:"NAEK554"},
  				 {txt:"섬진강(휴)상행", val:"NAEK529"}, {txt:"섬진강(휴)하행", val:"NAEK528"}, {txt:"순천신대지구", val:"NAEK513"},
  				 {txt:"순천신대지구CGV", val:"NAEK512"}, {txt:"영광", val:"NAEK560"}, {txt:"영산포", val:"NAEK565"}, {txt:"영암", val:"NAEK570"},
  				 {txt:"여천", val:"NAEK509"}, {txt:"옥과", val:"NAEK588"}, {txt:"완도", val:"NAEK575"}, {txt:"원동", val:"NAEK578"},
  				 {txt:"임자대광", val:"NAEK593"}, {txt:"임자진리", val:"NAEK594"}, {txt:"장성", val:"NAEK583"}, {txt:"고흥", val:"NAEK540"},
  				 {txt:"진도", val:"NAEK590"}, {txt:"지도", val:"NAEK585"}, {txt:"함평", val:"NAEK581"}, {txt:"해남", val:"NAEK595"},
  				 {txt:"해제", val:"NAEK552"}, {txt:"화순", val:"NAEK586"}];
  var jeonbuk = [{txt:"덕과", val:"NAEK626"}, {txt:"순창", val:"NAEK645"}, {txt:"애통리", val:"NAEK619"}, {txt:"익산", val:"NAEK615"},
  				 {txt:"익산팔봉", val:"NAEK616"}, {txt:"자치인재원", val:"NAEK622"}, {txt:"전북혁신", val:"NAEK621"}, {txt:"전주호남제일문", val:"NAEK605"},
  				 {txt:"정읍", val:"NAEK630"}, {txt:"태인", val:"NAEK629"}, {txt:"흥덕", val:"NAEK634"}];
  var busan = [{txt:"김해장유", val:"NAEK736"}, {txt:"내서", val:"NAEK706"}, {txt:"마산", val:"NAEK705"},
  			   {txt:"울산", val:"NAEK715"}, {txt:"울산신복", val:"NAEK716"}, {txt:"진주개양", val:"NAEK723"}, {txt:"진주혁신", val:"NAEK724"},
  			   {txt:"진해", val:"NAEK704"}, {txt:"창원역", val:"NAEK704"}, {txt:"통영", val:"NAEK730"}];
  var daegu = [{txt:"김천혁신", val:"NAEK821"}, {txt:"낙동강(휴)상행", val:"NAEK824"}, {txt:"낙동강(휴)하행", val:"NAEK823"}, {txt:"대구용계", val:"NAEK807"},
  			   {txt:"대구혁신", val:"NAEK801"}, {txt:"상주", val:"NAEK825"}, {txt:"선산(휴)상행", val:"NAEK813"}, {txt:"선산(휴)하행", val:"NAEK812"},
  			   {txt:"서대구", val:"NAEK805"}, {txt:"안동", val:"NAEK840"}, {txt:"영덕", val:"NAEK843"}, {txt:"영주", val:"NAEK835"},
  			   {txt:"영천", val:"NAEK845"}, {txt:"영천망정", val:"NAEK846"}, {txt:"예천", val:"NAEK851"}, {txt:"점촌", val:"NAEK850"},
  			   {txt:"포항", val:"NAEK830"}, {txt:"포항시청", val:"NAEK828"}, {txt:"풍기", val:"NAEK834"}];
  var target = document.getElementById("addressKindD3");

  if(e.value == "a") var d = seoul;
  else if(e.value == "b") var d = incheon;
  else if(e.value == "c") var d = gangwon;
  else if(e.value == "d") var d = daejeon;
  else if(e.value == "e") var d = chungbug;
  else if(e.value == "f") var d = gwangju;
  else if(e.value == "g") var d = jeonbuk;
  else if(e.value == "h") var d = busan;
  else if(e.value == "i") var d = daegu;

  target.options.length = 0;

  for (x in d) {
      var opt = document.createElement("option");
      opt.value = d[x].val;
      opt.innerHTML = d[x].txt;
      target.appendChild(opt);
  }   
}

function addressKindChange4(e) {
  var seoul = [{txt:"서울경부", val:"NAEK010"}, {txt:"센트럴시티", val:"NAEK020"}, {txt:"동서울", val:"NAEK032"}, {txt:"상봉", val:"NAEK040"}];
  var incheon = [{txt:"인천", val:"NAEK100"}, {txt:"성남", val:"NAEK120"}, {txt:"수원", val:"NAEK110"}, {txt:"인천공항T1", val:"NAEK105"},
  				 {txt:"인천공항T2", val:"NAEK117"}, {txt:"안산", val:"NAEK190"}, {txt:"안성중대", val:"NAEK131"}, {txt:"이천", val:"NAEK160"},
  				 {txt:"용인", val:"NAEK150"}, {txt:"고양백석", val:"NAEK116"}, {txt:"고양화정", val:"NAEK115"}, {txt:"광명(KTX역)", val:"NAEK125"},
  				 {txt:"광명(철산역)", val:"NAEK126"}, {txt:"구리", val:"NAEK169"}, {txt:"부천", val:"NAEK101"}, {txt:"서수원", val:"NAEK109"},
				 {txt:"신갈시외", val:"NAEK114"}, {txt:"신갈영덕", val:"NAEK119"}, {txt:"시흥(시화)", val:"NAEK195"}, {txt:"안성", val:"NAEK130"},
  				 {txt:"안성공도", val:"NAEK133"}, {txt:"안성대림", val:"NAEK137"}, {txt:"안성풍림", val:"NAEK132"}, {txt:"안성한경", val:"NAEK134"},
 				 {txt:"안성회관", val:"NAEK138"}, {txt:"안중", val:"NAEK177"}, {txt:"안중오거리", val:"NAEK176"}, {txt:"여주", val:"NAEK140"},
 				 {txt:"여주대", val:"NAEK139"}, {txt:"오산", val:"NAEK127"}, {txt:"용인신갈", val:"NAEK111"},
 				 {txt:"용인유림", val:"NAEK149"}, {txt:"의정부", val:"NAEK170"}, {txt:"이천(마장택지구)", val:"NAEK171"}, {txt:"이천부발(신하리)", val:"NAEK172"}, 
  				 {txt:"죽전", val:"NAEK118"}, {txt:"평택", val:"NAEK180"}, {txt:"평택대", val:"NAEK175"}, {txt:"평택용이", val:"NAEK174"}];
  var gangwon = [{txt:"원주", val:"NAEK240"}, {txt:"속초", val:"NAEK230"}, {txt:"강릉", val:"NAEK200"}, {txt:"동해", val:"NAEK210"},
  				 {txt:"삼척", val:"NAEK220"}, {txt:"양양", val:"NAEK270"}, {txt:"원주기업", val:"NAEK270"}, {txt:"원주문막", val:"NAEK245"},
  				 {txt:"원주혁신", val:"NAEK244"}, {txt:"춘천", val:"NAEK250"}, {txt:"횡성(휴)상행", val:"NAEK239"}, {txt:"횡성(휴)하행", val:"NAEK238"}];
  var daejeon = [{txt:"대전복합", val:"NAEK300"}, {txt:"천안", val:"NAEK310"}, {txt:"서산", val:"NAEK393"}, {txt:"유성", val:"NAEK360"},
  				 {txt:"세종청사", val:"NAEK010"}, {txt:"당진", val:"NAEK010"}, {txt:"공주", val:"NAEK010"}, {txt:"대전청사(샘머리)", val:"NAEK010"},
  				 {txt:"세종터미널", val:"NAEK352"}, {txt:"고대조치원", val:"NAEK355"},  {txt:"금산", val:"NAEK330"}, {txt:"내포", val:"NAEK390"},
  				 {txt:"논산", val:"NAEK370"}, {txt:"당진기지시", val:"NAEK388"}, {txt:"대전도룡", val:"NAEK307"}, {txt:"덕산스파", val:"NAEK399"},
  				 {txt:"배방정류소", val:"NAEK337"}, {txt:"선문대", val:"NAEK347"}, {txt:"세종국무조정실", val:"NAEK361"}, {txt:"세종시청", val:"NAEK362"},
  				 {txt:"세종연구단지", val:"NAEK358"}, {txt:"안면도", val:"NAEK396"}, {txt:"아산둔포", val:"NAEK344"}, {txt:"아산서부(호서대)", val:"NAEK341"},
  				 {txt:"아산온양", val:"NAEK340"}, {txt:"아산탕정", val:"NAEK342"}, {txt:"아산테크노밸리", val:"NAEK338"}, {txt:"연무대", val:"NAEK380"},
  				 {txt:"예산", val:"NAEK398"}, {txt:"인삼랜드(휴)상행", val:"NAEK325"}, {txt:"인삼랜드(휴)하행", val:"NAEK324"}, {txt:"정산", val:"NAEK392"}, 
 				 {txt:"정안(휴)상행", val:"NAEK316"}, {txt:"정안(휴)하행", val:"NAEK315"}, {txt:"조치원", val:"NAEK350"}, {txt:"창기리", val:"NAEK397"},
 				 {txt:"천안공단", val:"NAEK346"}, {txt:"천안아산역", val:"NAEK343"}, {txt:"청양", val:"NAEK391"}, {txt:"탕정삼성", val:"NAEK349"},
 				 {txt:"태안", val:"NAEK394"}, {txt:"홍대조치원", val:"NAEK354"}, {txt:"홍성", val:"NAEK389"}];
  var chungbug = [{txt:"청주(센트럴)", val:"NAEK401"}, {txt:"충주", val:"NAEK420"}, {txt:"청주고속터미널", val:"NAEK400"}, {txt:"북청주(청주대)", val:"NAEK405"},
  				  {txt:"서충주", val:"NAEK421"}, {txt:"제천", val:"NAEK450"}, {txt:"제천하소", val:"NAEK449"},
  				  {txt:"청주공항", val:"NAEK407"}, {txt:"청주북부터미널", val:"NAEK406"}, {txt:"황간", val:"NAEK440"}];
  var gwangju = [{txt:"광주(유스퀘어)", val:"NAEK500"}, {txt:"순천", val:"NAEK515"}, {txt:"목포", val:"NAEK505"}, {txt:"여수", val:"NAEK510"},
  				 {txt:"강진", val:"NAEK535"}, {txt:"고흥", val:"NAEK540"}, {txt:"광양", val:"NAEK520"}, {txt:"광주비아", val:"NAEK503"},
  				 {txt:"구례", val:"NAEK519"}, {txt:"남악", val:"NAEK592"}, {txt:"나주", val:"NAEK592"}, 
  				 {txt:"녹동", val:"NAEK545"}, {txt:"능주", val:"NAEK587"}, {txt:"담양", val:"NAEK582"}, {txt:"동광양", val:"NAEK525"}, 
  				 {txt:"문장", val:"NAEK584"}, {txt:"무안", val:"NAEK550"}, {txt:"벌교", val:"NAEK555"}, {txt:"보성", val:"NAEK554"},
  				 {txt:"섬진강(휴)상행", val:"NAEK529"}, {txt:"섬진강(휴)하행", val:"NAEK528"}, {txt:"순천신대지구", val:"NAEK513"},
  				 {txt:"순천신대지구CGV", val:"NAEK512"}, {txt:"영광", val:"NAEK560"}, {txt:"영산포", val:"NAEK565"}, {txt:"영암", val:"NAEK570"},
  				 {txt:"여천", val:"NAEK509"}, {txt:"옥과", val:"NAEK588"}, {txt:"완도", val:"NAEK575"}, {txt:"원동", val:"NAEK578"},
  				 {txt:"임자대광", val:"NAEK593"}, {txt:"임자진리", val:"NAEK594"}, {txt:"장성", val:"NAEK583"}, {txt:"고흥", val:"NAEK540"},
  				 {txt:"진도", val:"NAEK590"}, {txt:"지도", val:"NAEK585"}, {txt:"함평", val:"NAEK581"}, {txt:"해남", val:"NAEK595"},
  				 {txt:"해제", val:"NAEK552"}, {txt:"화순", val:"NAEK586"}];
  var jeonbuk = [{txt:"덕과", val:"NAEK626"}, {txt:"순창", val:"NAEK645"}, {txt:"애통리", val:"NAEK619"}, {txt:"익산", val:"NAEK615"},
  				 {txt:"익산팔봉", val:"NAEK616"}, {txt:"자치인재원", val:"NAEK622"}, {txt:"전북혁신", val:"NAEK621"}, {txt:"전주호남제일문", val:"NAEK605"},
  				 {txt:"정읍", val:"NAEK630"}, {txt:"태인", val:"NAEK629"}, {txt:"흥덕", val:"NAEK634"}];
  var busan = [{txt:"김해장유", val:"NAEK736"}, {txt:"내서", val:"NAEK706"}, {txt:"마산", val:"NAEK705"},
  			   {txt:"울산", val:"NAEK715"}, {txt:"울산신복", val:"NAEK716"}, {txt:"진주개양", val:"NAEK723"}, {txt:"진주혁신", val:"NAEK724"},
  			   {txt:"진해", val:"NAEK704"}, {txt:"창원역", val:"NAEK704"}, {txt:"통영", val:"NAEK730"}];
  var daegu = [{txt:"김천혁신", val:"NAEK821"}, {txt:"낙동강(휴)상행", val:"NAEK824"}, {txt:"낙동강(휴)하행", val:"NAEK823"}, {txt:"대구용계", val:"NAEK807"},
  			   {txt:"대구혁신", val:"NAEK801"}, {txt:"상주", val:"NAEK825"}, {txt:"선산(휴)상행", val:"NAEK813"}, {txt:"선산(휴)하행", val:"NAEK812"},
  			   {txt:"서대구", val:"NAEK805"}, {txt:"안동", val:"NAEK840"}, {txt:"영덕", val:"NAEK843"}, {txt:"영주", val:"NAEK835"},
  			   {txt:"영천", val:"NAEK845"}, {txt:"영천망정", val:"NAEK846"}, {txt:"예천", val:"NAEK851"}, {txt:"점촌", val:"NAEK850"},
  			   {txt:"포항", val:"NAEK830"}, {txt:"포항시청", val:"NAEK828"}, {txt:"풍기", val:"NAEK834"}];
  var target = document.getElementById("addressKindD4");

  if(e.value == "a") var d = seoul;
  else if(e.value == "b") var d = incheon;
  else if(e.value == "c") var d = gangwon;
  else if(e.value == "d") var d = daejeon;
  else if(e.value == "e") var d = chungbug;
  else if(e.value == "f") var d = gwangju;
  else if(e.value == "g") var d = jeonbuk;
  else if(e.value == "h") var d = busan;
  else if(e.value == "i") var d = daegu;

  target.options.length = 0;

  for (x in d) {
      var opt = document.createElement("option");
      opt.value = d[x].val;
      opt.innerHTML = d[x].txt;
      target.appendChild(opt);
  }   
}
