$(function(){
var data;
	$.ajax({
		url:"../map/Samples/MapDataBaseXml/SouthKoreaDrillDownMetroDongRegion.xml",
		type:"get",
		dataType:"xml",
		success:function(xml){
			data=xml;
			console.log(data);
			$(data).find("Area").each(function(){
				var label=$(this).attr("label");
				var $option = $("<option>").append(label).attr("value",label);
				$("#area").append($option);
				
			})
		}
	})
	
	$("#province").hide();
	$("#gu").hide();
	$("#dong").hide();
	
	$("#area").change(function(){
		$("#gu").hide();
		$("#dong").hide();
		var area=$(this).val();
		var area2=$(data).find("Area[label='"+area+"']");
		
		$("#province").empty();
		$("#province").append("<option>지역선택</option>");
		
		var provinceCheck=$(area2).children().is("Province");
		if(provinceCheck==true){
			$("#province").show();
			$(area2).find("Province").each(function(){
				var label=$(this).attr("label");
				var $option = $("<option>").append(label).attr("value",label);
				$("#province").append($option);
				
			});
		}else{
			$("#province").hide();
			$("#gu").show();
			$(area2).find("Gu").each(function(){
				var label=$(this).attr("label");
				var $option = $("<option>").append(label).attr("value",label);
				$("#gu").append($option);
				
			});
		}
		
		
		
	})
	
	
	$("#province").change(function(){
		$("#gu").hide();
		$("#dong").hide();
		var province=$(this).val();
		var province2=$(data).find("Province[label='"+province+"']");
		
		$("#gu").empty();
		$("#gu").append("<option>지역선택</option>");
		$("#gu").show();
		$(province2).find("Gu").each(function(){
			var label=$(this).attr("label");
			var $option = $("<option>").append(label).attr("value",label);
			$("#gu").append($option);
		});
	})
	
	
	
	$("#gu").change(function(){
		$("#dong").hide();
		var gu=$(this).val();
		var gu2=$(data).find("Gu[label='"+gu+"']");
		
		$("#dong").empty();
		$("#dong").append("<option>지역선택</option>");

		var dongCheck=$(gu2).children().is("Dong");
		if(dongCheck==true){
			$("#dong").show();
			$(gu2).find("Dong").each(function(){
				var label=$(this).attr("label");
				var $option = $("<option>").append(label).attr("value",label);
				$("#dong").append($option);
			});
		}else{
			$("#dong").hide();
		}
	})

})
		