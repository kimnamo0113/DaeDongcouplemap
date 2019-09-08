<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<!-- rMateChartH5 라이센스 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/map/LicenseKey/rMateMapChartH5License.js"></script>
<!-- rMateMapChartH5 라이브러리 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/map/rMateMapChartH5/JS/rMateMapChartH5.js"></script>
<!-- rMateMapChartH5 CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/map/rMateMapChartH5/Assets/rMateMapChartH5.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<script type="text/javascript">
// -----------------------맵차트 설정 시작-----------------------
// rMate 맵차트 생성 준비가 완료된 상태 시 호출할 함수를 지정합니다.
var mapVars = "rMateOnLoadCallFunction=mapReadyHandler";

// 맵차트의 속성인 rMateOnLoadCallFunction 으로 설정된 함수.
// rMate 맵차트 준비가 완료된 경우 이 함수가 호출됩니다.
// 이 함수를 통해 맵차트에 레이아웃과 데이터를 삽입합니다.
// 파라메터 : id - rMateMapChartH5.create() 사용 시 사용자가 지정한 id 입니다.
// 맵차트 콜백함수 7개 존재합니다.
// 1. setLayout - 스트링으로 작성된 레이아웃 XML을 삽입합니다.
// 2. setData - 배열로 작성된 데이터를 삽입합니다.
// 3. setMapDataBase - 스트링으로 작성된 MapData XML을 삽입합니다.
// 4. setLayoutURLEx - 레이아웃 XML 경로를 지시합니다.
// 5. setDataURLEx - 데이터 XML 경로를 지시합니다.
// 6. setMapDataBaseURLEx - MapData XML 경로를 지시합니다.
// 7. setSourceURLEx - Map Source 경로를 지시합니다.
function mapReadyHandler(id) {
	document.getElementById(id).setLayout(layoutStr);
	document.getElementById(id).setData(mapData);
	document.getElementById(id).setMapDataBaseURLEx(mapDataBaseURL);
	document.getElementById(id).setSourceURLEx(sourceURL);
}

// Map Data 경로 정의
// setMapDataBase함수로 mapDataBase를 문자열로 넣어줄 경우 주석처리나 삭제하십시오.
var mapDataBaseURL = "${pageContext.request.contextPath}/resources/map/Samples/MapDataBaseXml/SouthKoreaDrillDownMetroDongRegion.xml";

// MapChart Source 선택
// MapSource 디렉토리의 지도 이미지중 택일가능하며, 이외에 사용자가 작성한 별도의 Svg이미지를 지정할 수 있습니다.(매뉴얼 참조)
var sourceURL = "${pageContext.request.contextPath}/resources/map/Samples/MapSource/SouthKoreaDrillDownMetroDongRegion.svg";

// rMateMapChart 를 생성합니다.
// 파라메터 (순서대로) 
//  1. 맵차트의 id ( 임의로 지정하십시오. ) 
//  2. 맵차트가 위치할 div 의 id (즉, 차트의 부모 div 의 id 입니다.)
//  3. 맵차트 생성 시 필요한 환경 변수들의 묶음인 chartVars
//  4. 맵차트의 가로 사이즈 (생략 가능, 생략 시 100%)
//  5. 맵차트의 세로 사이즈 (생략 가능, 생략 시 100%)
rMateMapChartH5.create("map1", "mapHolder", mapVars, "100%", "100%");

function colorFunction(code, label, data) {
	if (code.toString().indexOf("0000") > -1 )
		return "#c7e5ef";
	else
		return "#ebf0f4";
}


function clickFunction(code, label, data) {
	alert("code:"+code+"\nlabel:"+label);
	/* \ndata.sales:"+data.sales */
	}


var layoutStr = '\
<?xml version="1.0" encoding="utf-8"?>\
<rMateMapChart>\
	<MapChart id="mainMap1" showDataTips="true" mapChangeJsFunction="clickFunction">\
		<series>\
			<MapSeries id="mapseries" interactive="true" selectionMarking="line" color="#777777" labelPosition="inside" displayName="Map" localFillJsFunction="colorFunction">\
				<showDataEffect>\
					<SeriesInterpolate duration="1000"/>\
				</showDataEffect>\
				<stroke>\
					<Stroke color="#CAD7E0" weight="0.5" alpha="1"/>\
				</stroke>\
				<rollOverStroke>\
					<Stroke color="#CAD7E0" weight="0.5" alpha="1"/>\
				</rollOverStroke>\
			</MapSeries>\
		</series>\
	</MapChart>\
</rMateMapChart>\
';


var mapData;
// -----------------------맵차트 설정 끝 -----------------------

</script>
<!-- 샘플 작동을 위한 css와 js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/map/Samples/Web/JS/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/map/Samples/Web/JS/sample_util.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/map/Samples/Web/sample.css"/>

<!-- SyntaxHighlighter -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/map/Samples/Web/syntax/shCore.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/map/Samples/Web/syntax/shBrushJScript.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/map/Samples/Web/syntax/shCoreDefault.css"/>
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<div class="headerTitle">대한민국 - 권역별 (서울, 광역시 하위 동지역 포함)</div>
		</div>
		<div id="content">
			<!-- 차트가 삽입될 DIV -->
			<div id="mapHolder"></div>
		</div>
		<div class="description">
		■ 수도권, 충청권 등 권역별로 나눠진 지도 입니다.<br>
		색상이 적용된 지역을 클릭하시면 동까지 표현된 화면을 보실 수 있습니다.
		</div>

		<div id="updater">
			<div>Layout과 Data를 수정 후 적용 할 수 있습니다.</div>
			<div id="updaterTab">
				<ul id="updaterTabUl">
					<li id="updaterTabUlSource" class="active_tab">Source</li>
					<li id="updaterTabUlLayout" class="non_active_li">Layout</li>
					<li id="updaterTabUlData" class="non_active_li">Data</li>
					<li id="updaterTabUlBlank">
						<span id="btn_update">수정적용</span>
					</li>
				</ul>
			</div>
			<div id="updaterTarea">
				<pre id="updaterTareaSource" class="brush:js toolbar:false" name="updaterTareaSource"></pre>
				<textarea id="updaterTareaLayout" class="updaterTextarea" spellcheck="false"></textarea>
				<textarea id="updaterTareaData" class="updaterTextarea" spellcheck="false"></textarea>
			</div>
		</div>
	</div>
</body>
</html>
