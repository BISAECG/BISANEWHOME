let langAarray={'zh_CN':'简体','zh_HK':'繁體','en_US':'English'};
var selectLang=document.getElementById("language");
if(selectLang!=null){
	for(let i in langAarray){		
		selectLang.options.add(new Option(langAarray[i],i));
	}
}

let goodsAarray={'0':'real','1':'virtual'};
var selectGoods=document.getElementById("goods_type");
if(selectGoods!=null){
	for(let i in goodsAarray){		
		selectGoods.options.add(new Option(goodsAarray[i],i));
	}
}
function jsonDateFormat(jsonDate) {
	var year = jsonDate.year+1900;
    var month = jsonDate.month+1;
    var day = jsonDate.date;
    month=(month>9)?(""+month):("0"+month);  // 如果得到的数字小于9要在前面加'0'
    day=(day>9)?(""+day):("0"+day);
    return year + "-" + month + "-" + day;
}
function jsonDateTimeFormat(jsonDate) {
	console.log(jsonDate);
	var year = jsonDate.year+1900;
    var month = jsonDate.month+1;
    var day = jsonDate.date;
    var hour =jsonDate.hours;
    var minute=jsonDate.minutes;
    var second=jsonDate.seconds;
    month=(month>9)?(""+month):("0"+month);  // 如果得到的数字小于9要在前面加'0'
    day=(day>9)?(""+day):("0"+day);
    return year + "-" + month + "-" + day +" "+hour+":"+minute+":"+second;
}